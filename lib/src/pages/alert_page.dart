import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alert Page"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Center(
        child: FlatButton(
          onPressed: () => _showAlert(context),
          child: Text("Show Alert"),
          color: Colors.blue,
          textColor: Colors.white,
        ),
      ),
    );
  }

  _showAlert(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            title: Text("Alert Dialog Demo"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                    "This is the content of the Alert Dialog demo. This shouldn't take too much space. Flutter is awesome."),
                FlutterLogo(size: 100.0)
              ],
            ),
            actions: <Widget>[
              FlatButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text("Cancel")),
              FlatButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text("Ok")),
            ],
          );
        });
  }
}
