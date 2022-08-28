abstract class BangunRuang {
  int panjang, lebar, tinggi;

  BangunRuang(
    this.panjang,
    this.lebar,
    this.tinggi,
  );

  String volume();
}

class Kubus extends BangunRuang {
  int sisi;

  Kubus(this.sisi) : super(0, 0, 0);

  @override
  String volume() => 'Volume Kubus adalah ${sisi * sisi * sisi} cm';
}

class Balok extends BangunRuang {
  Balok(int panjang, int lebar, int tinggi) : super(panjang, lebar, tinggi);

  @override
  String volume() => 'Volume Balok adalah ${panjang * lebar * tinggi} cm';
}

abstract class Matematika {
  String hasil();
}

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

void main() {
  Kubus kubus = Kubus(15);
  print(kubus.volume());

  Balok balok = Balok(11, 30, 20);
  print(balok.volume());

  var soal1 = KelipatanPersekutuanTerkecil(9, 12);
  print(soal1.hasil());

  var soal2 = FaktorPersekutuanTerbesar(22, 99);
  print(soal2.hasil());
}
