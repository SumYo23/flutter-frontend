import 'package:flutter/material.dart';

import '../models/food_model.dart';
import '../repositories/favorite_repository.dart';

class FavoriteProvider extends ChangeNotifier {
  final FavoriteRepository favoriteRepository;

  FavoriteProvider({required this.favoriteRepository});

  List<Food> _favoriteFoods = [
    Food(
      name: "음식 1",
      imageUrl: 'assets/tree.png',
      description: "음식 1 설명",
      stuffs: [FoodIngredient(name: 'adfa', quantity: 2)],
      recipe: [FoodRecipe(process: 'asfdff', describe: 'ffff')],
    ),
    Food(
      name: "음식 2",
      imageUrl: 'assets/tree.png',
      description: "음식 2 설명",
      stuffs: [FoodIngredient(name: 'afaa', quantity: 244)],
      recipe: [FoodRecipe(process: 'asfsssdff', describe: 'fsfafff')],
    ),
  ];
}
