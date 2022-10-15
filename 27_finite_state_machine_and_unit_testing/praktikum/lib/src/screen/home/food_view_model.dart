import 'package:flutter/material.dart';
import '../../model/api/food_api.dart';
import '../../model/food_model.dart';

enum FoodViewModelState {
  none,
  loading,
  error,
}

class FoodViewModel extends ChangeNotifier {
  final FoodApi _foodApi = FoodApi();

  FoodViewModelState _state = FoodViewModelState.none;
  FoodViewModelState get state => _state;

  Iterable<Food> _foods = [];
  Iterable<Food> get foods => _foods;

  void setQuantity(int id, int quantity) {
    final foods = [..._foods];
    final food = foods.where((element) => element.id == id).first;
    final foodIndex = foods.indexOf(food);
    foods[foodIndex].quantity = quantity;
    _foods = foods;
    notifyListeners();
  }

  void _setViewModelState(FoodViewModelState state) {
    _state = state;
    notifyListeners();
  }

  Future<void> getFoods() async {
    _setViewModelState(FoodViewModelState.loading);
    try {
      final foods = await _foodApi.getFoods();
      _foods = foods;
      _setViewModelState(FoodViewModelState.none);
    } catch (e) {
      _setViewModelState(FoodViewModelState.error);
    }
  }
}
