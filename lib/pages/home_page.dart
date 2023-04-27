import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:odigan/pages/qrcode_create_page.dart';
import 'package:odigan/pages/qrcode_scan_page.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser;

  // sign user out method
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Odigan - Med Finder',
          style: TextStyle( 
            fontSize: 24,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: signUserOut,
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      backgroundColor: Colors.deepPurple[200],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 120,
            foregroundColor: Colors.black,
            backgroundColor: Colors.transparent,
            child: Image.asset(
              'lib/icons/odigan.png',
              fit: BoxFit.contain,
            ),
          ),

          SizedBox(height: 32),

          Center(
            child: Column(
              children: [
                SizedBox(height: 35),

                ElevatedButton(
                  onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QRCodeScanner()));
                    },
                  child: Text(
                    'Scan QR',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                    ),
                  ),

                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(300, 70),
                     shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),

                SizedBox(width: 25),

                SizedBox(height: 35),

                ElevatedButton(
                  onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QRCodeGenerator()
                        )
                      );
                  },
                  child: Text(
                    'Create QR',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                    ),
                  ),

                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(300, 70),
                     shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
