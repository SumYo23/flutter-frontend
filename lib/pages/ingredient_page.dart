import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';
import '../models/bar_model.dart';
import '../providers/ingredient_provider.dart';
import '../styles/text_style.dart';

class IngredientPage extends StatefulWidget {
  const IngredientPage({super.key});

  @override
  State<IngredientPage> createState() => _IngredientPageState();
}

class _IngredientPageState extends State<IngredientPage> {
  String dropdownValue = '등록순';

  List<bool> _isSelected = [true, false, false];

  @override
  void initState() {
    super.initState();
    // widget 이 모두 렌더링된 이후에 data 를 받아옴

    // widget 이 렌더링되기 전에 data 를 받아오면
    // build 중 setState 가 호출될 가능성이 있기 때문에 반드시 widget build 가 완료되고 데이터를 받아와야 함
    Future.microtask(() {
      context.read<IngredientProvider>().getIngredients();
    });
  }

  void sortIngredients(IngredientProvider ingredientProvider, int index) {
    if (index == 0) {
      ingredientProvider.sortByTime();
    } else if (index == 1) {
      ingredientProvider.sortByQuantity();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<IngredientProvider>(
        builder: (ctx, ingredientProvider, _) => Column(
          children: [
            SizedBox(height: 100),
            Container(
              height: 115,
              padding: const EdgeInsets.only(bottom: 40.0, top: 40),
              child: ToggleButtons(
                borderColor: Colors.grey,
                fillColor: Color(0xFFE9EBF8),
                borderWidth: 1.2,
                selectedBorderColor: Colors.black,
                selectedColor: Colors.black,
                borderRadius: BorderRadius.circular(50),
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    width: 110,
                    //padding: const EdgeInsets.all(15.0),
                    child: Text(
                      '등록순',
                        style:TextStyle(
                            fontSize:15,
                            fontWeight:FontWeight.w500,
                            color:Color(0xFF203B67),
                        )
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 110,
                    //padding: const EdgeInsets.all(15.0),
                    child: Text(
                      '보유량순',
                        style:TextStyle(
                          fontSize:15,
                          fontWeight:FontWeight.w500,
                          color:Color(0xFF203B67),
                        )
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 110,
                    //padding: const EdgeInsets.all(15.0),
                    child: Text(
                      '유통기한순',
                        style:TextStyle(
                          fontSize:15,
                          fontWeight:FontWeight.w500,
                          color:Color(0xFF203B67),
                        )
                    ),
                  ),
                ],
                onPressed: (int index) {
                  setState(() {
                    for (int i = 0; i < _isSelected.length; i++) {
                      _isSelected[i] = i == index;
                    }
                    sortIngredients(ingredientProvider, index);
                  });
                },
                isSelected: _isSelected,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: ingredientProvider.ingredients.length,
                itemBuilder: (ctx, i) => Container(
                  margin: EdgeInsets.only(left: 30, right: 30, bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                  height: 70,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Dismissible(
                          key: Key(ingredientProvider.ingredients[i].ingredient
                              .toString()),
                          onDismissed: (direction) {
                            // 해당 ListTile을 삭제하는 로직을 구현합니다.
                            ingredientProvider.removeIngredient(i);
                          },
                          child: ListTile(
                            title: Text(ingredientProvider.ingredients[i].ingredient
                                .toString(),
                                style:TextStyle(
                                  fontSize:15,
                                  fontWeight:FontWeight.w700,
                                  color:Color(0xFF203B67),
                                )
                            )
                            ,
                            // leading: Image.network(ingredientProvider.ingredients[i].imageUrl.toString()),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(width: 8.0),
                                IconButton(
                                  icon: Icon(Icons.remove),
                                  onPressed: () {
                                    ingredientProvider.decrementQuantity(i);
                                  },
                                ),
                                SizedBox(width: 8.0),
                                Text(
                                  ingredientProvider.ingredients[i].quantity
                                          .toString(),
                                  style:TextStyle(
                                    fontSize:20,
                                    fontWeight:FontWeight.w700,
                                    color:Color(0xFF203B67),
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () {
                                    ingredientProvider.incrementQuantity(i);
                                  },
                                ),
                              ],
                            ),
                          ),
                          background: Container(
                            color: Colors.red,
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.only(right: 16.0),
                            child: Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: SpeedDial(
        icon: Icons.add,
        activeIcon: Icons.close,
        backgroundColor: Color(0xFF2B4F8A),
        children: [
          SpeedDialChild(
            child: Icon(Icons.camera_alt),
            label: "사진 촬영",
            labelStyle: TextStyle(
                          fontSize:20,
                          fontWeight:FontWeight.w500,
                          color:Color(0xFF192E51),
                        ),
            onTap: () {
              Provider.of<IngredientProvider>(context, listen: false)
                  .captureAndUploadImage();
            },
          ),
          SpeedDialChild(
            child: Icon(Icons.edit),
            label: "직접 입력",
            labelStyle: TextStyle(
              fontSize:20,
              fontWeight:FontWeight.w500,
              color:Color(0xFF192E51),
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => IngredientInputDialog(),
              );
            },
          ),
        ],
      ),
      //bottomNavigationBar: MyBar(),
    );
  }
}

class IngredientInputDialog extends StatefulWidget {
  @override
  _IngredientInputDialogState createState() => _IngredientInputDialogState();
}

class _IngredientInputDialogState extends State<IngredientInputDialog> {
  String? _ingredientName;
  int _quantity = 0;

  final List<String> _ingredientNameOptions = [
    '미역',
    '미음',
    '미원',
    '감자',
    '당근',
    '고기',
    '전예준'
  ];

  final _ingredientNameController = TextEditingController();
  final _quantityController = TextEditingController();
  late TextEditingController homeTeamName = TextEditingController();

  final FocusNode _ingredientNameFocusNode = FocusNode();
  final FocusNode _quantityFocusNode = FocusNode();

  @override
  void dispose() {
    _ingredientNameController.dispose();
    _quantityController.dispose();
    _ingredientNameFocusNode.dispose();
    _quantityFocusNode.dispose();
    super.dispose();
  }

  void clearField() {
    _ingredientNameController.clear();
    _quantityController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
          '재료 추가',
          style: TextStyle(
          fontSize:20,
          fontWeight:FontWeight.w700,
          color:Color(0xFF192E51),
        ),

      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20),
          Text('이름',
            style: TextStyle(
              fontSize:15,
              fontWeight:FontWeight.w500,
              color:Color(0xFF192E51),
            ),
          ),
          Autocomplete<String>(
            optionsBuilder: (TextEditingValue textEditingValue) {
              if (textEditingValue.text == '') {
                return const Iterable<String>.empty();
              }
              return _ingredientNameOptions.where((String option) {
                return option.contains(textEditingValue.text.toLowerCase());
              });
            },
            onSelected: (String selection) {
              _ingredientName = selection;
              _ingredientNameController.text = selection;
            },
            fieldViewBuilder: (context, controller, focusNode, onSubmit) {
              homeTeamName = controller;
              return TextFormField(
                  controller: controller, focusNode: focusNode);
            },
          ),
          const SizedBox(height: 20),
          Text('수량',
            style: TextStyle(
              fontSize:15,
              fontWeight:FontWeight.w500,
              color:Color(0xFF192E51),
            ),
          ),
          TextField(
            controller: _quantityController,
            focusNode: _quantityFocusNode,
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {
                _quantity = int.parse(value);
              });
            },
            //decoration: InputDecoration(labelText: '수량'),
          ),
        ],
      ),
      actions: [

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width:100,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFEAEAEA)),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  '닫기',
                    style:TextStyle(
                      fontSize:15,
                      fontWeight:FontWeight.w700,
                      color:Color(0xFF192E51),
                    )
                ),
              ),
            ),
            const SizedBox(width:10),
            Container(
              width:100,
              child: ElevatedButton(
                onPressed: () {
                  if (_ingredientName != null && _quantity > 0) {
                    Provider.of<IngredientProvider>(context, listen: false)
                        .addOrUpdateIngredient(_ingredientName!, _quantity);
                    homeTeamName.clear();
                    clearField();
                    FocusScope.of(context).requestFocus(_ingredientNameFocusNode);
                  }
                },
                child: Text(
                    '업로드',
                    style:TextStyle(
                      fontSize:15,
                      fontWeight:FontWeight.w700,
                      color:Color(0xffFDF8F8),
                    )

                ),
              ),
            ),
          ],

        ),

      ],
    );
  }
}
