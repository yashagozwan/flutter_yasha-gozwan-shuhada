import 'bangun_ruang.dart';

class Kubus extends BangunRuang {
  int sisi;

  Kubus(this.sisi) : super(0, 0, 0);

  @override
  String volume() => 'Volume Kubus adalah ${sisi * sisi * sisi} cm';
}
