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
        title: Center(
          child: const Text(
            'ODIGAN - MED FINDER',
            style: TextStyle( 
              fontSize: 24,
              color: Colors.black,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: signUserOut,
            icon: const Icon(Icons.logout_rounded),
            color: Colors.black,
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

          SizedBox(height: 35),

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
                    'SCAN QR',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                    ),
                  ),

                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(350, 60),
                     shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),

                SizedBox(height: 45),

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
                    'CREATE QR',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                    ),
                  ),

                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(350, 60),
                     shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
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
