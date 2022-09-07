import 'hewan.dart';
import 'mobil.dart';

void main() {
  Hewan burung = Hewan()..berat = 1.5;
  Hewan kucing = Hewan()..berat = 2.9;
  Hewan ikan = Hewan()..berat = 2.3;
  Hewan ayam = Hewan()..berat = 3.4;
  Hewan sapi = Hewan()..berat = 40.0;
  Hewan dog = Hewan()..berat = 3.9;

  Mobil mobil = Mobil()..kapasitas = 100;

  mobil.tambahMuatan(burung);
  mobil.tambahMuatan(kucing);
  mobil.tambahMuatan(ikan);
  mobil.tambahMuatan(ayam);
  mobil.tambahMuatan(sapi);
  mobil.tambahMuatan(dog);

  mobil.totalSemuaMuatan();
}
