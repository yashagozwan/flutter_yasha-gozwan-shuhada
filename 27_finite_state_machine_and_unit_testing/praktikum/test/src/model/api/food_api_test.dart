import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:praktikum/src/model/api/food_api.dart';
import 'package:praktikum/src/model/food_model.dart';
import 'package:test/test.dart';
import 'food_api_test.mocks.dart';

@GenerateMocks([FoodApi])
void main() {
  group('FoodApi Mock', () {
    final foodApi = MockFoodApi();

    test('get all foods', () async {
      when(foodApi.getFoods()).thenAnswer(
        (realInvocation) async => <Food>[
          Food(id: 123, name: 'Ramen'),
          Food(id: 98, name: 'Soba'),
          Food(id: 94, name: 'Meron Pan'),
        ],
      );

      final foods = await foodApi.getFoods();
      expect(foods.isNotEmpty, true);
    });
  });

  group('Real Connection Food Api', () {
    final foodApi = FoodApi();
    test('get all foods', () async {
      final foods = await foodApi.getFoods();
      expect(foods.isNotEmpty, true);
    });
  });
}
