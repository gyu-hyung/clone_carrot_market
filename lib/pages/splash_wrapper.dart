import 'package:clone_carrot_market/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashWrapper extends StatefulWidget {
  const SplashWrapper({super.key});

  @override
  State<SplashWrapper> createState() => _SplashWrapperState();
}

class _SplashWrapperState extends State<SplashWrapper> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();

    // Fade in
    Future.delayed(Duration(milliseconds: 100), () {
      setState(() => _opacity = 1.0);
    });

    // Fade out
    Future.delayed(Duration(seconds: 3), () {
      setState(() => _opacity = 0.0);
    });

    // Navigate after fade out
    Future.delayed(Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
        CupertinoPageRoute(builder: (_) => const HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF16171B),
      body: Center(
        child: AnimatedOpacity(
          duration: const Duration(seconds: 1),
          opacity: _opacity,
          child: SvgPicture.asset(
            'assets/icons/logo.svg',
            width: 200,
            height: 200,
          ),
        ),
      ),
    );
  }
}
