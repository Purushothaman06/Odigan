import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:odigan/components/my_textfield.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
    } on FirebaseAuthException catch (ex) {
      print(ex);
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            content: Text('Password reset link sent! Check your email'),
          );
        }
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              'Enter Your Email and We will Send you a Password Reset link',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
          ),
          // email textfield

          const SizedBox(height: 25),

          MyTextField(
            controller: _emailController,
            hintText: 'Email',
            obscureText: false,
          ),

          const SizedBox(height: 25),

          ElevatedButton(
            onPressed: passwordReset,
            child: Text(
              'Reset Password',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            style: ElevatedButton.styleFrom(
                minimumSize: Size(350, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
          )
        ],
      ),
    );
  }
}
