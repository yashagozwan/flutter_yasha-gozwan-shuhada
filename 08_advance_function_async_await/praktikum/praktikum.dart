void main() {
  // taskOne();
  taskTwo();
}

// task 1
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

// task 2
void taskTwo() {
  var orders = [
    [
      'ordersId',
      ['001', '002', '003']
    ],
    [
      'ordersItem',
      ['Mouse', 'Keycaps', 'Keychron']
    ],
  ];

  var ordersMap = {};

  for (int i = 0; i < orders.length; i++) {
    ordersMap.addAll({orders[i][0]: orders[i][1]});
  }

  print(ordersMap);

  var friends = [
    ['123', 'Gon'],
    ['321', 'Killua'],
    ['455', 'Yahoo'],
  ];

  var person = {};

  int i = 1;
  for (var friend in friends) {
    person.addEntries({
      "person${i++}": {"id": friend[0], "name": friend[1]}
    }.entries);
  }

  person.forEach(((_, value) => print(value)));
}
