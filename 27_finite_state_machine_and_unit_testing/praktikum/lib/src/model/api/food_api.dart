import 'package:dio/dio.dart';
import '../food_model.dart';

class FoodApi {
  final Dio _dio = Dio();

  Future<Iterable<Food>> getFoods() async {
    try {
      final response = await _dio.get(
        'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/foods',
      );
      final mapFoods = response.data as List<dynamic>;
      return mapFoods.map((food) => Food.fromMap(food));
    } on DioError {
      rethrow;
    }
  }
}
