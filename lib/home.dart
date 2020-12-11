import 'dart:io';
import 'dart:ui';

import 'package:among_us_app/aboutDialog.dart';
import 'package:among_us_app/bottomPanel.dart';
import 'package:among_us_app/generateButton.dart';
import 'package:among_us_app/starPainter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share/share.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:among_us_app/globals.dart' as globals;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScreenshotController screenshotController = ScreenshotController();
  final PanelController panelController = PanelController();
  @override
  void initState() {
    super.initState();
  }

  void showMenu() {
    showCupertinoDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) => InfoDialog());
  }

  void shareAvatar() {
    screenshotController.capture(pixelRatio: 3).then((File image) {
      //Capture Done
      setState(() {});
      final RenderBox box = context.findRenderObject();
      if (Platform.isAndroid) {
        Share.shareFile(image,
            subject: 'Image created by Among Us Avatar Generator',
            text:
                'Hey, Look I created ${Provider.of<globals.RVProvider>(context, listen: false).nameVariable} with this amazing app called Among Us Avatar Generator.',
            sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
      } else {
        Share.share(
            'Hey, Look I created ${Provider.of<globals.RVProvider>(context, listen: false).nameVariable} with this amazing app called Among Us Avatar Generator.',
            subject: 'Image created by Among Us Avatar Generator',
            sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
      }
    }).catchError((onError) {
      print(onError);
    });
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
        leading: SettingsButton(
          onPressed: showMenu,
        ),
        actions: <Widget>[
          ShareButton(
            onPressed: shareAvatar,
          ),
        ],
      ),
      body: SlidingUpPanel(
        backdropTapClosesPanel: true,
        controller: panelController,
        minHeight: 65,
        maxHeight: 340,
        parallaxEnabled: true,
        parallaxOffset: 0.6,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        collapsed: CollapsedPanel(),
        body: PanelBody(
            stars: Stars(),
            screenshotController: screenshotController,
            panelController: panelController),
        panel: GenerateBottomPanel(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: GenerateButton(),
    );
  }
}

class ShareButton extends StatelessWidget {
  final Function onPressed;
  const ShareButton({
    this.onPressed,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: kToolbarHeight,
      child: IconButton(
        icon: Image.asset(
          "assets/images/share_btn.png",
          fit: BoxFit.contain,
        ),
        onPressed: onPressed,
      ),
    );
  }
}

class SettingsButton extends StatelessWidget {
  final Function onPressed;
  const SettingsButton({
    this.onPressed,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Image.asset(
        "assets/images/info_btn.png",
        fit: BoxFit.contain,
      ),
      onPressed: onPressed,
    );
  }
}

class PanelBody extends StatelessWidget {
  const PanelBody({
    Key key,
    @required this.stars,
    @required ScreenshotController screenshotController,
    @required this.panelController,
  })  : _screenshotController = screenshotController,
        super(key: key);

  final Widget stars;
  final ScreenshotController _screenshotController;
  final PanelController panelController;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        if (details.delta.dy < -10) {
          panelController.open();
          HapticFeedback.vibrate();
        }
        if (details.delta.dy > 10) {
          panelController.close();
          HapticFeedback.vibrate();
        }
      },
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Stack(
            children: [
              stars,
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.66,
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 20),
                child: Image.asset("assets/images/logo.png"),
              ),
              Screenshot(
                  controller: _screenshotController,
                  child: Provider.of<globals.RVProvider>(context).cropStyle ==
                          "round"
                      ? ClipOval(
                          child: GeneratedAvatar(),
                        )
                      : Provider.of<globals.RVProvider>(context).cropStyle ==
                              "square"
                          ? GeneratedAvatar()
                          : Provider.of<globals.RVProvider>(context)
                                      .cropStyle ==
                                  "rrect"
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: GeneratedAvatar(),
                                )
                              : GeneratedAvatar()),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 140),
                child: Text(
                  Provider.of<globals.RVProvider>(context).nameVariable,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class GeneratedAvatar extends StatelessWidget {
  const GeneratedAvatar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/BG/BG${Provider.of<globals.RVProvider>(context).bgVariable}-01.png",
          height: MediaQuery.of(context).size.width * 0.6,
        ),
        Image.asset(
          "assets/images/CH/CH${Provider.of<globals.RVProvider>(context).colorVariable}-01.png",
          height: MediaQuery.of(context).size.width * 0.6,
        ),
        if (Provider.of<globals.RVProvider>(context).hatVariable != 0)
          Image.asset(
            "assets/images/HT/HT${Provider.of<globals.RVProvider>(context).hatVariable}-01.png",
            height: MediaQuery.of(context).size.width * 0.6,
          ),
        if (Provider.of<globals.RVProvider>(context).skinVariable != 0)
          Image.asset(
            "assets/images/SK/SK${Provider.of<globals.RVProvider>(context).skinVariable}-01.png",
            height: MediaQuery.of(context).size.width * 0.6,
          )
      ],
    );
  }
}

class CollapsedPanel extends StatelessWidget {
  const CollapsedPanel({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25)),
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
    );
  }
}
