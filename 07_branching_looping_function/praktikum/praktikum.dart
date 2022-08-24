void main(List<String> args) {
  print(getGrade(70));
  print(getGrade(50));
  print(getGrade(0));

  print(factorial(10)); // 362880
  print(factorial(20)); // 121645100408832000
  print(factorial(30)); // 8841761993739701954543616000000
}

// task 1
String getGrade(int value) {
  if (value >= 70) {
    return 'A';
  } else if (value >= 40) {
    return 'B';
  } else if (value >= 0) {
    return 'C';
  } else {
    return '';
  }
}

// task 2
BigInt factorial(int value) {
  BigInt result = BigInt.from(1);

  if (value == 1) {
    return result;
  }

  for (var i = 1; i < value; i++) {
    result *= BigInt.from(i);
  }

  return result;
}
