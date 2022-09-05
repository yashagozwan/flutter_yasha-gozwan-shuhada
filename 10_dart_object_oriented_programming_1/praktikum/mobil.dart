import 'hewan.dart';

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
