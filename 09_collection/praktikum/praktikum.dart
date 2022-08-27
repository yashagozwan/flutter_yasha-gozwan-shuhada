void main() {
  taskOne();
  taskTwo();
}

void taskOne() async {
  List<int> result = await multiplyNumbers([3, 2, 1], 5);
  print(result);
}

Future<List<int>> multiplyNumbers(List<int> numbers, int multiplyBy) {
  return Future.delayed(Duration(milliseconds: 3000), () {
    List<int> temporary = [];
    for (int number in numbers) {
      temporary.add(number * multiplyBy);
    }
    return temporary;
  });
}

void taskTwo() {
  Map<String, List<String>> order1 = {
    'ordersId': ['123', '124', '423'],
    'ordersName': ['Mouse', 'Keyboard', 'keycaps'],
  };

  Map<String, List<String>> order2 = {
    'ordersId': ['221', '443', '543'],
    'ordersName': ['JavaScript', 'Dart', 'Kotlin'],
  };

  List<Map<String, List<String>>> orders = [order1, order2];

  print(orders);
}
