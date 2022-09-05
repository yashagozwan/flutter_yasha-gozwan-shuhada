import 'matematika.dart';

class KelipatanPersekutuanTerkecil implements Matematika {
  int a = 0, b = 0, c = 0, d = 0;

  int x, y;

  KelipatanPersekutuanTerkecil(this.x, this.y) {
    c = x * y;

    for (int i = 1; i < c; i++) {
      a = i % x;
      b = i % y;

      if (a == 0 && b == 0) {
        d = i;
        break;
      }
    }
  }

  @override
  String hasil() {
    return 'Hasil dari kelipatan persekutuan terkecil $x dan $y adalah $d';
  }
}
