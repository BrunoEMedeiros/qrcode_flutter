import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';

class Scanqr extends StatefulWidget {
  @override
  _ScanqrState createState() => _ScanqrState();
}

class _ScanqrState extends State<Scanqr> {
  String code = "";

  @override
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR Scanner"),
      ),
      body: Center(
        child: Text(
          code,
          style: new TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.camera_alt),
        label: Text("Scan"),
        onPressed: () => scanQrCode(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  scanQrCode() async {
    
    try {
      String qrResult = await BarcodeScanner.scan();
      setState(() {
        code = qrResult;
      });
    } on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          code = "Camera permission was denied";
        });
      } else {
        setState(() {
          code = "Unknown Error $ex";
        });
      }
    } on FormatException {
      setState(() {
        code = "You pressed the back button before scanning anything";
      });
    } catch (ex) {
      setState(() {
        code = "Unknown Error $ex";
      });
    }
  }


}