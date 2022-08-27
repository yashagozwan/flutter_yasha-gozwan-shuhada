// Task 1
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
