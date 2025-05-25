import 'package:clone_carrot_market/main.dart';
import 'package:flutter/material.dart';

class SplashWrapper extends StatefulWidget {
  const SplashWrapper({super.key});
  @override
  State<SplashWrapper> createState() => _SplashWrapperState();
}

class _SplashWrapperState extends State<SplashWrapper> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => HomePage()),
      );
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return SplashScreen();
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF16171B),
      body: Center(
        // child: Image.asset('assets/logo.svg', width: 100, height: 100),
        child: Text('로딩중 ...', style: TextStyle(color: Colors.white),),
      ),
    );
  }
}
