import 'bangun_ruang.dart';

class Balok extends BangunRuang {
  Balok(int panjang, int lebar, int tinggi) : super(panjang, lebar, tinggi);

  @override
  String volume() => 'Volume Balok adalah ${panjang * lebar * tinggi} cm';
}
