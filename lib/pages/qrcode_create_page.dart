import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodeGenerator extends StatefulWidget {
  @override
  _QRCodeGenerator createState() => _QRCodeGenerator();
}

class _QRCodeGenerator extends State<QRCodeGenerator> {
  String _medicineName = '';
  String _medicineDescription = '';
  String _foodStatus = 'Before food';
  String _dosageInterval = 'Morning';

  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
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
        title: Center(
          child: const Text(
            'QR GENERATOR',
            style: TextStyle(
              fontSize: 24,
              color: Colors.black,
            ),
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
                'Enter Medicine Details',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 25),

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

              SizedBox(height: 25),

              Container(
                 padding: const EdgeInsets.only(left: 16, right: 16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(5)
                  ),
                child: DropdownButton<String>(
                  hint: Text("Dosage Interval"),
                  dropdownColor: Colors.white,
                  iconSize: 36,
                  isExpanded: true,
                  underline: SizedBox(),
                  style: TextStyle(color: Colors.black, fontSize: 18),
                  value: _dosageInterval,
                  icon: const Icon(Icons.arrow_drop_down),
                  onChanged: (String? newValue) {
                    setState(() {
                      _dosageInterval = newValue!;
                    });
                  },
                  items: <String>['Morning', 'Morning-Night', 'Morning-Evening-Night', 'Morning-Afternoon-Evening-Night']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),

              SizedBox(height: 25),

              Container(
                 padding: const EdgeInsets.only(left: 16, right: 16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(5)
                  ),
                child: DropdownButton<String>(
                  hint: Text("Food status"),
                  dropdownColor: Colors.white,
                  iconSize: 36,
                  isExpanded: true,
                  underline: SizedBox(),
                  style: TextStyle(color: Colors.black, fontSize: 18),
                  value: _foodStatus,
                  icon: const Icon(Icons.arrow_drop_down),
                  onChanged: (String? newValue) {
                    setState(() {
                      _foodStatus = newValue!;
                    });
                  },
                  items: <String>['Before food', 'After food']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),

              SizedBox(height: 25),

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
                    'GENERATE QR',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    minimumSize: Size(350, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 32),

              Center(
                child: QrImage(
                  data: '$_medicineName\t$_dosageInterval\t$_foodStatus\t$_medicineDescription',
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