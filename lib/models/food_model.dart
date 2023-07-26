class Food {
  String? name;
  String? imageUrl;
  String? description;
  List<FoodIngredient>? stuffs;
  List<FoodRecipe>? recipe;
  bool isFavorite = false;

  Food(
      {required this.name,
      required this.imageUrl,
      this.description,
      this.stuffs,
      this.recipe});

  Food.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    imageUrl = json['imageUrl'];
    description = json['description'];
    if (json['stuffs'] != null) {
      stuffs = List<FoodIngredient>.from(
          json['stuffs'].map((x) => FoodIngredient.fromJson(x)));
    }

    if (json['recipe'] != null) {
      recipe = List<FoodRecipe>.from(
          json['recipe'].map((x) => FoodRecipe.fromJson(x)));
    }
  }

  // parse SampleModel to json
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['imageUrl'] = imageUrl;
    data['description'] = description;
    data['stuffs'] = stuffs?.map((x) => x.toJson()).toList();
    data['recipe'] = recipe?.map((x) => x.toJson()).toList();
    return data;
  }
}

class FoodIngredient {
  String? name;
  int? quantity;

  FoodIngredient({required this.name, required this.quantity});

  FoodIngredient.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['quantity'] = quantity;
    return data;
  }
}

class FoodRecipe {
  String? process;
  String? describe;

  FoodRecipe({required this.process, required this.describe});

  FoodRecipe.fromJson(Map<String, dynamic> json) {
    process = json['process'];
    describe = json['describe'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['process'] = process;
    data['describe'] = describe;
    return data;
  }
}
