
import 'package:flutter/material.dart';

import 'DiceStripped.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff37505C),
      appBar: AppBar(
        title: Text("Dice Game"),
        elevation: 0,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          MainBackground(),
          /*Positioned(
            top: 5,
            bottom: 5,
            left: 5,
            right: 5,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
                child: Container(
                  color: Colors.black.withOpacity(0),
                ),
              ),
            ),
          ),*/
        ],
      ),
    );
  }
}

class MainBackground extends StatefulWidget {
  @override
  _MainBackgroundState createState() => _MainBackgroundState();
}

class _MainBackgroundState extends State<MainBackground> with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(duration: const Duration(seconds: 12), vsync: this)..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 100,
          left: 50,
          child: DiceStripped(_animationController),
        ),
        Positioned(
          top: 300,
          left: 5,
          child: DiceStripped(_animationController),
        ),
        Positioned(
          top: 200,
          left: 250,
          child: DiceStripped(_animationController),
        ),
        Positioned(
          bottom: 200,
          right: 50,
          child: DiceStripped(_animationController),
        ),
        Positioned(
          left: 70,
          bottom: 60,
          child: DiceStripped(_animationController),
        ),
      ],
    );
  }
}
