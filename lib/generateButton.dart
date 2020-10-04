import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;
import 'package:among_us_app/globals.dart' as globals;
import 'package:provider/provider.dart';

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
    controller = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );
    btnAnimation = Tween<double>(
      begin: 1.0,
      end: 0.5,
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
            Provider.of<globals.RVProvider>(context, listen: false)
                .changeBGVariable(math.Random().nextInt(globals.bgSize) + 1);
            Provider.of<globals.RVProvider>(context, listen: false)
                .changeColorVariable(
                    math.Random().nextInt(globals.colorSize) + 1);
            HapticFeedback.vibrate();
            controller.forward();
            Future.delayed(Duration(milliseconds: 50)).then((value) {
              controller.reverse();
            });
          },
        ),
      ),
    );
  }
}
