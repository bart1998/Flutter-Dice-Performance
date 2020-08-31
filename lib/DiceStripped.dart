import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DiceStripped extends StatefulWidget {
  final AnimationController _animationController;

  const DiceStripped(this._animationController, {Key key}) : super(key: key);

  @override
  _DiceStrippedState createState() => _DiceStrippedState();
}

class _DiceStrippedState extends State<DiceStripped> {

  @override
  Widget build(BuildContext context) {
    // return _Dice(widget._animationController, continuous: true);
    return Transform.rotate(
      angle: 2,
      child: _Dice(widget._animationController),
    );
  }
}

class _Dice extends StatelessWidget {
  static const double dotOffset = 1.45;

  static const sixPosList = <Offset>[
    const Offset(-dotOffset, -dotOffset),
    const Offset(-dotOffset, 0),
    const Offset(-dotOffset, dotOffset),
    const Offset(dotOffset, -dotOffset),
    const Offset(dotOffset, 0),
    const Offset(dotOffset, dotOffset),
  ];

  static List<TweenSequenceItem<Offset>> getSequenceItemList(int dotNum) {
    return <TweenSequenceItem<Offset>>[
      TweenSequenceItem<Offset>(
        tween: Tween<Offset>(
          begin: Offset.zero,
          end: sixPosList[dotNum],
        ),
        weight: 10,
      ),
      TweenSequenceItem<Offset>(
        tween: Tween<Offset>(
          begin: sixPosList[dotNum],
          end: Offset.zero,
        ),
        weight: 10,
      ),
    ];
  }
  static final firstDot = TweenSequence(getSequenceItemList(0));
  static final secondDot = TweenSequence(getSequenceItemList(1));
  static final thirdDot = TweenSequence(getSequenceItemList(2));
  static final fourthDot = TweenSequence(getSequenceItemList(3));
  static final fifthDot = TweenSequence(getSequenceItemList(4));
  static final sixthDot = TweenSequence(getSequenceItemList(5));

  Animation<Offset> _offset1Animation;
  Animation<Offset> _offset2Animation;
  Animation<Offset> _offset3Animation;
  Animation<Offset> _offset4Animation;
  Animation<Offset> _offset5Animation;
  Animation<Offset> _offset6Animation;

  final AnimationController _animationController;

  _Dice(this._animationController) {
    _offset1Animation = firstDot.animate(_animationController);
    _offset2Animation = secondDot.animate(_animationController);
    _offset3Animation = thirdDot.animate(_animationController);
    _offset4Animation = fourthDot.animate(_animationController);
    _offset5Animation = fifthDot.animate(_animationController);
    _offset6Animation = sixthDot.animate(_animationController);
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(5)),
        boxShadow: const <BoxShadow>[
          const BoxShadow(
            color: Color(0x66F4F4F4),
            blurRadius: 20,
            spreadRadius: 3,
          )
        ],
      ),
      child: Stack(
        children: <Widget>[
          _buildDot(_offset1Animation),
          _buildDot(_offset2Animation),
          _buildDot(_offset3Animation),
          _buildDot(_offset4Animation),
          _buildDot(_offset5Animation),
          _buildDot(_offset6Animation),
        ],
      ),
    );
  }

  Widget _buildDot(Animation<Offset> animation) {
    return Center(
      child: SlideTransition(
        transformHitTests: false,
        position: animation,
        child: const _Dot(),
      ),
    );
  }
}


class _Dot extends StatelessWidget {
  const _Dot();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 13,
      height: 13,
      decoration: const BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: <Color>[
            Color(0xFF333843),
            Color(0xFF677188),
          ],
        ),
      ),
    );
  }
}

