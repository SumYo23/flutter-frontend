import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/food_model.dart';
import '../providers/food_provider.dart';
import '../styles/text_style.dart';
import '../view_model/food_view.dart';
import 'food_info_page.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<FoodProvider>(
        builder: (ctx, foodProvider, _) {
          List<Food> favoriteFoods =
              foodProvider.foods.where((food) => food.isFavorite).toList();

          return Scaffold(
            body: favoriteFoods.isEmpty
                ? Center(child: Text('하트 눌러서 찜 할 수 있어요!'))
                : Column(
                    children: [
                      const SizedBox(height: 60),
                      Container(
                          height: 200,
                          child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/mydog.png',
                                    height: 130, // 원하는 이미지 높이 설정
                                    width: 130, // 원하는 이미지 너비 설정
                                  ),
                                  Text("찜 목록!",
                                      style:TextStyle(
                                          fontSize:20,
                                          fontWeight:FontWeight.w700,
                                          color:Color(0xFF192E51)
                                      )
                                  ),
                                ],
                              ))),
                      Expanded(
                        child: FoodViewModel(foods: favoriteFoods),
                      ),
                    ],
                  ),
          );
        },
      ),
    );
  }
}
