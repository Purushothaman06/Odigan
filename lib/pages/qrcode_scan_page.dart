import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter_tts/flutter_tts.dart';

class QRCodeScanner extends StatefulWidget {
  @override
  _QRCodeScannerState createState() => _QRCodeScannerState();
}

class _QRCodeScannerState extends State<QRCodeScanner> {
  final GlobalKey _qrKey = GlobalKey(debugLabel: 'QR');
  late QRViewController _controller;
  late String result = "";
  final FlutterTts flutterTts = FlutterTts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text(
            'QR SCANNER',
            style: TextStyle(
              fontSize: 24,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          _buildQrView(context),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    return QRView(
      key: _qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderColor: Colors.white,
        borderRadius: 5,
        borderLength: 30,
        borderWidth: 5,
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this._controller = controller;
    controller.scannedDataStream.listen((scanData) async {
      setState(() {
        result = scanData.code!;
      });
      await controller.pauseCamera();
      await flutterTts.speak("QR Code Detected");
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'RESULT',
              style: TextStyle(
                fontSize: 22,
                color: Colors.black,
              ),
            ),
            content: Text(result),
            actions: [
              TextButton(
                child: Text(
                  'SPEAK',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                onPressed: speakContent,
              ),
              TextButton(
                child: Text(
                  'CLOSE',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                onPressed: () {
                  controller.resumeCamera();
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    });
  }

  void speakContent() async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.getMaxSpeechInputLength;
    await flutterTts.setVolume(1.0);
    await flutterTts.setPitch(1.0);
    await flutterTts.setSpeechRate(0.3); // speak slowly
    await flutterTts.speak(result);
  }

  @override
  void dispose() {
    flutterTts.stop();
    _controller.dispose();
    super.dispose();
  }
}
