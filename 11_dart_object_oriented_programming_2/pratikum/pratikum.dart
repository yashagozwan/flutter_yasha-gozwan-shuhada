import 'balok.dart';
import 'faktor_persekutuan_terbesar.dart';
import 'kelipatan_persekutuan_terkecil.dart';
import 'kubus.dart';

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
