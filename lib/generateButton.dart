import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GenerateButton extends StatefulWidget {
  const GenerateButton({
    Key key,
  }) : super(key: key);

  @override
  _GenerateButtonState createState() => _GenerateButtonState();
}

class _GenerateButtonState extends State<GenerateButton>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> btnAnimation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(milliseconds: 300), vsync: this);
    btnAnimation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0,
          0.5,
          curve: Curves.decelerate,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 80),
      child: ScaleTransition(
        scale: btnAnimation,
        child: MaterialButton(
          padding: EdgeInsets.zero,
          child: Image.asset('assets/images/generate_btn.png'),
          onPressed: () {
            HapticFeedback.vibrate();
            controller.forward();
            Future.delayed(Duration(milliseconds: 100)).then((value) {
              controller.reverse();
            });
          },
        ),
      ),
    );
  }
}
