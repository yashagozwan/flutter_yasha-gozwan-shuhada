import 'package:flutter/material.dart';
import 'button.dart';

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(22),
      crossAxisCount: 4,
      mainAxisSpacing: 15 * 3,
      crossAxisSpacing: 30,
      children: _icons.map((e) {
        return Button(
          iconData: e,
        );
      }).toList(),
    );
  }
}

final List<IconData> _icons = [
  Icons.home,
  Icons.wallet,
  Icons.settings,
  Icons.male,
  Icons.female,
  Icons.phone,
  Icons.android,
  Icons.flutter_dash,
  Icons.arrow_back,
  Icons.zoom_in,
  Icons.donut_large,
  Icons.padding,
  Icons.margin,
  Icons.bike_scooter,
  Icons.car_crash,
  Icons.whatsapp,
  Icons.wifi,
  Icons.cabin,
  Icons.apartment,
  Icons.oil_barrel,
  Icons.dangerous,
  Icons.select_all_sharp,
  Icons.access_alarm,
  Icons.one_k,
];
