import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GenerateButton extends StatelessWidget {
  const GenerateButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 80),
      child: MaterialButton(
        padding: EdgeInsets.zero,
        child: Image.asset('assets/images/generate_btn.png'),
        onPressed: () {
          HapticFeedback.vibrate();
        },
      ),
    );
  }
}
