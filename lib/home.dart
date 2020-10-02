import 'dart:math';
import 'dart:ui';

import 'package:among_us_app/generateButton.dart';
import 'package:among_us_app/starPainter.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget stars;

  @override
  void initState() {
    stars = Stars();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        brightness: Brightness.dark,
        elevation: 0,
        leading: PopupMenuButton<int>(
          icon: Image.asset(
            "assets/images/info_btn.png",
            fit: BoxFit.contain,
          ),
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 1,
              child: Row(
                children: <Widget>[
                  Icon(Icons.settings_backup_restore),
                  SizedBox(
                    width: 5,
                  ),
                  Text("Reset"),
                ],
              ),
            ),
            PopupMenuItem(
              value: 2,
              child: Row(
                children: <Widget>[
                  Icon(Icons.exit_to_app),
                  SizedBox(
                    width: 5,
                  ),
                  Text("Exit"),
                ],
              ),
            ),
          ],
        ),
        actions: <Widget>[
          Container(
            width: kToolbarHeight,
            child: MaterialButton(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "assets/images/share_btn.png",
                fit: BoxFit.contain,
              ),
              onPressed: () {
                Share.share(
                    "Hey, See what I created on the Among Us Avatar App.");
              },
            ),
          ),
        ],
      ),
      body: SlidingUpPanel(
        minHeight: 125,
        maxHeight: 400,
        parallaxEnabled: true,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        collapsed: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25)),
                border: Border.all(color: Colors.white, width: 4),
                color: Colors.black,
              ),
              margin: EdgeInsets.all(0),
              child: SizedBox.expand(),
            ),
            Positioned(
                child: Container(
              color: Colors.black,
              width: MediaQuery.of(context).size.width - 8,
              height: 6,
            ))
          ],
        ),
        body: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Stack(
              children: [
                stars,
              ],
            ),
            Image.asset(
              "assets/images/Cyan.png",
              height: 300,
            )
          ],
        ),
        panel: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25)),
            border: Border.all(color: Colors.white, width: 4),
            color: Colors.black,
          ),
          child: SizedBox.expand(),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: GenerateButton(),
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
