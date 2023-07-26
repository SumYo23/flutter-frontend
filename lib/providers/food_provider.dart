import 'package:flutter/cupertino.dart';
import '../models/food_model.dart';
import '../repositories/food_repository.dart';

class FoodProvider with ChangeNotifier {
  List<Food> _foods = [
    // Food(
    //     name: 'Pizza',
    //     description: 'Delicious cheese pizza',
    //     imageUrl: 'assets/tree.png',
    //     stuffs: [
    //       FoodIngredient(name: '마늘', quantity: 1),
    //       FoodIngredient(name: '감자', quantity: 1),
    //       FoodIngredient(name: 'cafaf', quantity: 1),
    //       FoodIngredient(name: 'dadfaf', quantity: 1),
    //       FoodIngredient(name: 'e', quantity: 1),
    //       FoodIngredient(name: 'f', quantity: 1),
    //       FoodIngredient(name: 'g', quantity: 1),
    //     ],
    //     recipe: [
    //       FoodRecipe(process: '1', describe: '짤라'),
    //       FoodRecipe(process: '2', describe: '짤라'),
    //       FoodRecipe(process: '3', describe: '짤라'),
    //       FoodRecipe(process: '4', describe: '짤라'),
    //       FoodRecipe(process: '5', describe: '짤라'),
    //     ]),
    // Food(
    //     name: 'qq',
    //     description: 'Delicious cheese pizza',
    //     imageUrl: 'assets/tree.png',
    //     stuffs: [
    //       FoodIngredient(name: '마늘', quantity: 1),
    //       FoodIngredient(name: '감자', quantity: 1),
    //       FoodIngredient(name: 'cafaf', quantity: 1),
    //       FoodIngredient(name: 'dadfaf', quantity: 1),
    //       FoodIngredient(name: 'e', quantity: 1),
    //       FoodIngredient(name: 'f', quantity: 1),
    //       FoodIngredient(name: 'g', quantity: 1),
    //     ],
    //     recipe: [
    //       FoodRecipe(process: '1', describe: '짤라'),
    //       FoodRecipe(process: '2', describe: '짤라'),
    //       FoodRecipe(process: '3', describe: '짤라'),
    //       FoodRecipe(process: '4', describe: '짤라'),
    //       FoodRecipe(process: '5', describe: '짤라'),
    //     ]),
    // Food(
    //     name: 'zz',
    //     description: 'Delicious cheese pizza',
    //     imageUrl: 'assets/tree.png',
    //     stuffs: [
    //       FoodIngredient(name: '마늘', quantity: 1),
    //       FoodIngredient(name: '감자', quantity: 1),
    //       FoodIngredient(name: 'cafaf', quantity: 1),
    //       FoodIngredient(name: 'dadfaf', quantity: 1),
    //       FoodIngredient(name: 'e', quantity: 1),
    //       FoodIngredient(name: 'f', quantity: 1),
    //       FoodIngredient(name: 'g', quantity: 1),
    //     ],
    //     recipe: [
    //       FoodRecipe(process: '1', describe: '짤라'),
    //       FoodRecipe(process: '2', describe: '짤라'),
    //       FoodRecipe(process: '3', describe: '짤라'),
    //       FoodRecipe(process: '4', describe: '짤라'),
    //       FoodRecipe(process: '5', describe: '짤라'),
    //     ]),
    // Food(
    //     name: 'ss',
    //     description: 'Delicious cheese pizza',
    //     imageUrl: 'assets/tree.png',
    //     stuffs: [
    //       FoodIngredient(name: '마늘', quantity: 1),
    //       FoodIngredient(name: '감자', quantity: 1),
    //       FoodIngredient(name: 'cafaf', quantity: 1),
    //       FoodIngredient(name: 'dadfaf', quantity: 1),
    //       FoodIngredient(name: 'e', quantity: 1),
    //       FoodIngredient(name: 'f', quantity: 1),
    //       FoodIngredient(name: 'g', quantity: 1),
    //     ],
    //     recipe: [
    //       FoodRecipe(process: '1', describe: '짤라'),
    //       FoodRecipe(process: '2', describe: '짤라'),
    //       FoodRecipe(process: '3', describe: '짤라'),
    //       FoodRecipe(process: '4', describe: '짤라'),
    //       FoodRecipe(process: '5', describe: '짤라'),
    //     ]),
    // Food(
    //     name: 'bb',
    //     description: 'Delicious cheese pizza',
    //     imageUrl: 'assets/tree.png',
    //     stuffs: [
    //       FoodIngredient(name: '마늘', quantity: 1),
    //       FoodIngredient(name: '감자', quantity: 1),
    //       FoodIngredient(name: 'cafaf', quantity: 1),
    //       FoodIngredient(name: 'dadfaf', quantity: 1),
    //       FoodIngredient(name: 'e', quantity: 1),
    //       FoodIngredient(name: 'f', quantity: 1),
    //       FoodIngredient(name: 'g', quantity: 1),
    //     ],
    //     recipe: [
    //       FoodRecipe(process: '1', describe: '짤라'),
    //       FoodRecipe(process: '2', describe: '짤라'),
    //       FoodRecipe(process: '3', describe: '짤라'),
    //       FoodRecipe(process: '4', describe: '짤라'),
    //       FoodRecipe(process: '5', describe: '짤라'),
    //     ]),
    // Food(
    //     name: 'cc',
    //     description: 'Delicious cheese pizza',
    //     imageUrl: 'assets/tree.png',
    //     stuffs: [
    //       FoodIngredient(name: '마늘', quantity: 1),
    //       FoodIngredient(name: '감자', quantity: 1),
    //       FoodIngredient(name: 'cafaf', quantity: 1),
    //       FoodIngredient(name: 'dadfaf', quantity: 1),
    //       FoodIngredient(name: 'e', quantity: 1),
    //       FoodIngredient(name: 'f', quantity: 1),
    //       FoodIngredient(name: 'g', quantity: 1),
    //     ],
    //     recipe: [
    //       FoodRecipe(process: '1', describe: '짤라'),
    //       FoodRecipe(process: '2', describe: '짤라'),
    //       FoodRecipe(process: '3', describe: '짤라'),
    //       FoodRecipe(process: '4', describe: '짤라'),
    //       FoodRecipe(process: '5', describe: '짤라'),
    //     ]),
    // Food(
    //     name: 'dd',
    //     description: 'Delicious cheese pizza',
    //     imageUrl: 'assets/tree.png',
    //     stuffs: [
    //       FoodIngredient(name: '마늘', quantity: 1),
    //       FoodIngredient(name: '감자', quantity: 1),
    //       FoodIngredient(name: 'cafaf', quantity: 1),
    //       FoodIngredient(name: 'dadfaf', quantity: 1),
    //       FoodIngredient(name: 'e', quantity: 1),
    //       FoodIngredient(name: 'f', quantity: 1),
    //       FoodIngredient(name: 'g', quantity: 1),
    //     ],
    //     recipe: [
    //       FoodRecipe(process: '1', describe: '짤라'),
    //       FoodRecipe(process: '2', describe: '짤라'),
    //       FoodRecipe(process: '3', describe: '짤라'),
    //       FoodRecipe(process: '4', describe: '짤라'),
    //       FoodRecipe(process: '5', describe: '짤라'),
    //     ]),
  ];

  final FoodRepository foodRepository;

  List<Food> get foods => _foods;

  FoodProvider({required this.foodRepository});

  Future<void> getFoods() async {
    _foods = await foodRepository.fetchFoods();
    notifyListeners();
  }

  void toggleFavoriteStatus(String id) async {
    final foodIndex = _foods.indexWhere((food) => food.name == id);

    if (foodIndex >= 0) {
      _foods[foodIndex].isFavorite = !_foods[foodIndex].isFavorite;
      //await foodRepository.toggleFavoriteStatus(id);
      notifyListeners();
    }
  }
}
