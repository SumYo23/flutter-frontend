import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/food_model.dart';

class FoodRepository {

  Future<List<Food>> fetchFoods() async {
    const url = 'http://223.130.139.200/api/cook/list/10/';
    final response = await http.get(Uri.parse(url));
    final extractedData = json.decode(response.body)['foods'] as List<dynamic>;
    return extractedData.map((item) => Food.fromJson(item)).toList();


  }

  Future<void> toggleFavoriteStatus(String id) async {
    // await http.post('https://your-server.com/foods/$id/favorite');
  }
}
