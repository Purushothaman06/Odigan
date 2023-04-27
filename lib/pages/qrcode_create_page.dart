import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodeGenerator extends StatefulWidget {
  
  @override
  _QRCodeGenerator createState() => _QRCodeGenerator();
}

class _QRCodeGenerator extends State<QRCodeGenerator> {
  String _medicineName = '';
  String _medicineDosage = '';
  String _medicineDescription = '';

  final _nameController = TextEditingController();
  final _dosageController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _dosageController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _generateQRCode() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'QR Code Generator',
          style: TextStyle( 
            fontSize: 24,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              
              Text(
                'Enter medicine details:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 16),

              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Medicine name',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  _medicineName = value;
                },
              ),

              SizedBox(height: 16),

              TextField(
                controller: _dosageController,
                decoration: InputDecoration(
                  labelText: 'Medicine dosage',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  _medicineDosage = value;
                },
              ),

              SizedBox(height: 16),

              TextField(
                controller: _descriptionController,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: 'Medicine description',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  _medicineDescription = value;
                },
              ),

              SizedBox(height: 32),

              Center(
                child: ElevatedButton(
                  onPressed: _generateQRCode,
                  child: Text(
                    'Generate QR Code',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),

                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(250, 70),
                     shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 32),

              Center(
                child: QrImage(
                  data: '$_medicineName\n$_medicineDosage\n$_medicineDescription',
                  version: QrVersions.auto,
                  size: 200.0,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
