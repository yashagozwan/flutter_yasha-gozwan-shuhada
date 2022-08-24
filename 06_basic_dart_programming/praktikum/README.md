# Task

## Task 1
Membuat rumus menghitung luas lingkaran.
```dart
void main() {
    var formula = 22 / 7;
    var wide = 7;
    var result = formula * wide * wide;
    print(result);
}
```
Result
```bash
$ dart praktikum.dart
154.0
```

## Task 2
Membuat 3 variable dengan tipe data string dan mengabungkannya.
```dart
void main() {
    String firstName = 'Yasha';
    String middleName = 'Gozwan';
    String lastName = 'Shuhada';
    String fullName = '$firstName $middleName $lastName';
    print(fullName);
}
```
Result
```bash
$ dart praktikum.dart
Yasha Gozwan Shuhada
```