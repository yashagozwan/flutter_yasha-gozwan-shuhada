import 'matematika.dart';

class FaktorPersekutuanTerbesar implements Matematika {
  List<int> result = [];
  int smaller = 0, bigger = 0;
  int x, y;

  FaktorPersekutuanTerbesar(this.x, this.y) {
    if (x <= y) {
      smaller = x;
    } else {
      smaller = y;
    }

    if (x >= y) {
      bigger = x;
    } else {
      bigger = y;
    }

    for (int i = 1; i < smaller; i++) {
      if (smaller % i == 0 && bigger % i == 0) {
        result.add(i);
      }
    }
  }

  @override
  String hasil() {
    int getBiggerNumber = result[result.length - 1];
    return 'Hasil dari faktor persekutuan terbesar $x dan $y adalah $getBiggerNumber';
  }
}
