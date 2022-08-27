# Tasks

## Task 1
```Dart
class Mobil {
  double kapasitas = 4.5;
  List<Hewan> muatan = [];

  // Menambahkan hewan ke list muatan
  void tambahMuatan(Hewan hewan) {
    if (kapasitas > hewan.berat) {
      muatan.add(hewan);
    } else {
      print('Maaf maksimal berat muatan $kapasitas kg');
    }
  }
}
```

## Task 2
```Dart
class Mobil {
  ...
  // Menghitung total berat dari semua hewan
  void totalMuatan() {
    double totalBerat = 0;
    for (Hewan hewan in muatan) {
      totalBerat += hewan.berat;
    }
    print('Total berat semua hewan di dalam mobil $totalBerat kg');
  }
}
```

Semua Kode
```Dart
class Hewan {
  double berat = 3.5;
}

class Mobil {
  double kapasitas = 4.5;
  List<Hewan> muatan = [];

  void tambahMuatan(Hewan hewan) {
    if (kapasitas > hewan.berat) {
      muatan.add(hewan);
    } else {
      print('Maaf maksimal berat muatan $kapasitas kg');
    }
  }

  void totalMuatan() {
    double totalBerat = 0;
    for (Hewan hewan in muatan) {
      totalBerat += hewan.berat;
    }
    print('Total berat semua hewan di dalam mobil $totalBerat kg');
  }
}

void main() {
  Hewan burung = Hewan()..berat = 1.5;
  Hewan kucing = Hewan()..berat = 2.9;
  Hewan ikan = Hewan()..berat = 2.3;
  Hewan ayam = Hewan()..berat = 3.4;
  Hewan sapi = Hewan()..berat = 40.0;
  Hewan dog = Hewan()..berat = 3.9;

  Mobil mobil = Mobil();
  mobil.tambahMuatan(burung);
  mobil.tambahMuatan(kucing);
  mobil.tambahMuatan(ikan);
  mobil.tambahMuatan(ayam);
  mobil.tambahMuatan(sapi);
  mobil.tambahMuatan(dog);
  mobil.totalMuatan();
}

```

### Output
Ada hewan yang tidak masuk ke list muatan yaitu sapi. Karena sapi terlalu berat untuk masuk ke list muatan.
```Bash
$ dart praktikum.dart 
Maaf maksimal berat muatan 4.5 kg
Total berat semua hewan di dalam mobil 14.0 kg
```