import 'dart:async';
import 'dart:ui';

import 'package:covid_tracker/View/Worldstates.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {

  late final AnimationController _controller =
      AnimationController(duration: Duration(seconds: 3), vsync: this)
        ..repeat();

@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds:3), () => Navigator.push(context, MaterialPageRoute(builder: (context)=> Worldstates())));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedBuilder(
                animation: _controller,
                builder: (BuildContext context, Widget? child) {
                  return Transform.rotate(
                      angle: _controller.value * 3.0 * math.pi,
                      child: Container(
                        height: size.height*0.3,
                        width:  size.width*0.5,
                        child: Image(image: AssetImage('images/virus1.png')),
                      ));
                }),
                SizedBox(height: size.height*0.08,),
                Align(
                  alignment: Alignment.center,
                  child: Text('Covid 19\nTracker App',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color:Colors.white),))

          ],
        ),
      ),
    );
  }
}
