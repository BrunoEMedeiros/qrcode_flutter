import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'package:teste_qrcode/scanqr.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter QR',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scanqr(),
    );
  }
}

