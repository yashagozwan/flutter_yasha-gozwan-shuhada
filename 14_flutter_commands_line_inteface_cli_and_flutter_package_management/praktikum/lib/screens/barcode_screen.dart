import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

class BarcodeScreen extends StatelessWidget {
  const BarcodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            MyBarcode(data: 'Alterra Academy'),
            SizedBox(height: 16),
            MyBarcode(data: 'Flutter Asik'),
            SizedBox(height: 16),
            MyBarcode(data: 'Yasha Gozwan Shuhada'),
          ],
        ),
      ),
    );
  }
}

class MyBarcode extends StatelessWidget {
  final String data;

  const MyBarcode({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Color(0xFFF2F2F2),
      ),
      child: BarcodeWidget(
        width: 200,
        data: data,
        barcode: Barcode.code128(),
      ),
    );
  }
}
