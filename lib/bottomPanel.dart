import 'dart:ui';

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
                      color:
                          Provider.of<globals.RVProvider>(context).bgVariable !=
                                  1
                              ? Colors.white
                              : Colors.black,
                    ),
                    onPressed:
                        Provider.of<globals.RVProvider>(context).bgVariable != 1
                            ? () {
                                Provider.of<globals.RVProvider>(context,
                                        listen: false)
                                    .shiftBGVariable(false);
                              }
                            : null),
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
                      color:
                          Provider.of<globals.RVProvider>(context).bgVariable !=
                                  globals.bgSize
                              ? Colors.white
                              : Colors.black,
                    ),
                    onPressed:
                        Provider.of<globals.RVProvider>(context).bgVariable !=
                                globals.bgSize
                            ? () {
                                Provider.of<globals.RVProvider>(context,
                                        listen: false)
                                    .shiftBGVariable(true);
                              }
                            : null),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    icon: Icon(
                      Icons.chevron_left,
                      color: Provider.of<globals.RVProvider>(context)
                                  .colorVariable !=
                              1
                          ? Colors.white
                          : Colors.black,
                    ),
                    onPressed: Provider.of<globals.RVProvider>(context)
                                .colorVariable !=
                            1
                        ? () {
                            Provider.of<globals.RVProvider>(context,
                                    listen: false)
                                .shiftColorVariable(false);
                          }
                        : null),
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
                      color: Provider.of<globals.RVProvider>(context)
                                  .colorVariable !=
                              globals.colorSize
                          ? Colors.white
                          : Colors.black,
                    ),
                    onPressed: Provider.of<globals.RVProvider>(context)
                                .colorVariable !=
                            globals.colorSize
                        ? () {
                            Provider.of<globals.RVProvider>(context,
                                    listen: false)
                                .shiftColorVariable(true);
                          }
                        : null),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    icon: Icon(
                      Icons.chevron_left,
                      color: Provider.of<globals.RVProvider>(context)
                                  .hatVariable !=
                              0
                          ? Colors.white
                          : Colors.black,
                    ),
                    onPressed:
                        Provider.of<globals.RVProvider>(context).hatVariable !=
                                0
                            ? () {
                                Provider.of<globals.RVProvider>(context,
                                        listen: false)
                                    .shiftHatVariable(false);
                              }
                            : null),
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Text(
                    Provider.of<globals.RVProvider>(context).hatVariable != 0
                        ? "HT${Provider.of<globals.RVProvider>(context).hatVariable}-01.png"
                        : "None",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                IconButton(
                    icon: Icon(
                      Icons.chevron_right,
                      color: Provider.of<globals.RVProvider>(context)
                                  .hatVariable !=
                              globals.hatSize
                          ? Colors.white
                          : Colors.black,
                    ),
                    onPressed:
                        Provider.of<globals.RVProvider>(context).hatVariable !=
                                globals.hatSize
                            ? () {
                                Provider.of<globals.RVProvider>(context,
                                        listen: false)
                                    .shiftHatVariable(true);
                              }
                            : null),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    icon: Icon(
                      Icons.chevron_left,
                      color: Provider.of<globals.RVProvider>(context)
                                  .skinVariable !=
                              0
                          ? Colors.white
                          : Colors.black,
                    ),
                    onPressed:
                        Provider.of<globals.RVProvider>(context).skinVariable !=
                                0
                            ? () {
                                Provider.of<globals.RVProvider>(context,
                                        listen: false)
                                    .shiftSkinVariable(false);
                              }
                            : null),
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Text(
                    Provider.of<globals.RVProvider>(context).skinVariable != 0
                        ? "SK${Provider.of<globals.RVProvider>(context).skinVariable}-01.png"
                        : "None",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                IconButton(
                    icon: Icon(
                      Icons.chevron_right,
                      color: Provider.of<globals.RVProvider>(context)
                                  .skinVariable !=
                              globals.skinSize
                          ? Colors.white
                          : Colors.black,
                    ),
                    onPressed:
                        Provider.of<globals.RVProvider>(context).skinVariable !=
                                globals.skinSize
                            ? () {
                                Provider.of<globals.RVProvider>(context,
                                        listen: false)
                                    .shiftSkinVariable(true);
                              }
                            : null),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 8, 8, 8),
                  child: IconButton(
                      icon: Icon(
                        Icons.crop,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Provider.of<globals.RVProvider>(context, listen: false)
                            .changeCropStyle();
                      }),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
