import 'package:closingwork/screens/detailscr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class CameraPage extends StatefulWidget {
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {

  @override
  void initState() {
    FlutterBarcodeScanner.scanBarcode("#ff6666", null, false, ScanMode.DEFAULT)
        .then((res) {
      setState(() {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              qrtext: res,
            ),
          ),
        );
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
