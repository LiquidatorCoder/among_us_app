import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoDialog extends StatelessWidget {
  const InfoDialog({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: new Text("Among Us Avatar Generator v1.0.0+1"),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text("Developed and Maintained by")),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
            child: Material(
              elevation: 0,
              color: Colors.white54,
              borderRadius: BorderRadius.circular(20),
              child: new ListTile(
                leading: Container(
                    padding: EdgeInsets.only(right: 12.0),
                    decoration: new BoxDecoration(
                      border: new Border(
                        right:
                            new BorderSide(width: 1.0, color: Colors.white54),
                      ),
                    ),
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/images/Cyan.png"),
                    )),
                title: Text(
                  "Hash Studios",
                  style: TextStyle(
                      color: Colors.black87, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "India",
                  style: TextStyle(color: Colors.black87),
                ),
              ),
            ),
          ),
          Text(
            "This is an unofficial fan-made app.",
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
      actions: <Widget>[
        CupertinoDialogAction(
          child: Text("Github"),
          onPressed: () {
            Navigator.of(context).pop();
            String link = "https://www.github.com/Hash-Studios";
            _launchURL(link);
          },
        ),
        // CupertinoDialogAction(
        //   child: Text("LinkedIn"),
        //   onPressed: () {
        //     Navigator.of(context).pop();
        //     String link = "https://www.linkedin.com/in/liquidatorcoder/";
        //     _launchURL(link);
        //   },
        // ),
        CupertinoDialogAction(
          isDestructiveAction: true,
          child: Text("Back"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
