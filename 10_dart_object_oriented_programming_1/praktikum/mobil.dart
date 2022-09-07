import 'hewan.dart';

class Mobil {
  double kapasitas = 4.5;
  List<Hewan> muatan = [];

  void tambahMuatan(Hewan hewan) {
    var totalKapasitas = totalMuatan();
    if (kapasitas > totalKapasitas) {
      muatan.add(hewan);
    } else {
      print('Maaf maksimal berat muatan $kapasitas kg');
    }
  }

  double totalMuatan() {
    double totalBerat = 0;

    for (Hewan hewan in muatan) {
      totalBerat += hewan.berat;
    }
    return totalBerat;
  }

  void totalSemuaMuatan() {
    print('Total berat semua hewan di dalam mobil ${totalMuatan()} kg');
  }
}
