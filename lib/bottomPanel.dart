import 'dart:ui';

import 'package:among_us_app/starPainter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:among_us_app/globals.dart' as globals;

class GenerateBottomPanel extends StatelessWidget {
  const GenerateBottomPanel({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        border: Border.all(color: Colors.white, width: 4),
        color: Colors.black,
      ),
      child: SizedBox.expand(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    icon: Icon(
                      Icons.chevron_left,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Provider.of<globals.RVProvider>(context, listen: false)
                          .shiftBGVariable(false);
                    }),
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Text(
                    "BG${Provider.of<globals.RVProvider>(context).bgVariable}-01.png",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                IconButton(
                    icon: Icon(
                      Icons.chevron_right,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Provider.of<globals.RVProvider>(context, listen: false)
                          .shiftBGVariable(true);
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    icon: Icon(
                      Icons.chevron_left,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Provider.of<globals.RVProvider>(context, listen: false)
                          .shiftColorVariable(false);
                    }),
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Text(
                    "CH${Provider.of<globals.RVProvider>(context).colorVariable}-01.png",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                IconButton(
                    icon: Icon(
                      Icons.chevron_right,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Provider.of<globals.RVProvider>(context, listen: false)
                          .shiftColorVariable(true);
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Stars extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: StarPainter(particles: 30),
      child: Container(
        height: MediaQuery.of(context).size.height,
      ),
    );
  }
}
