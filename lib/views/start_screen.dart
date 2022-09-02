import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pop_corn_flix/views/home_screen.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 10),(){
       Get.off(() => const HomeScreen());
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Image.asset("assets/gifs/animation.gif"),
        ),
      ),
    );
  }
}
