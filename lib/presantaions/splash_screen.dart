import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:screening/presantaions/navbar_Screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    navigateToHome(context);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          width: 200,
          child: Center(
            child: Lottie.asset('Assets/images/Animation - 1709722982768.json'),
          ),
        ),
      ),
    );
  }
}

void navigateToHome(BuildContext context) async {
  await Future.delayed(const Duration(seconds: 3));
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => MyHomePage()),
  );
}
