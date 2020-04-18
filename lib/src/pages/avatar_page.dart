import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Avatar Page"),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://techaid.co/wp-content/uploads/2019/06/Anthony.png"),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text("AR"),
              foregroundColor: Colors.white,
              backgroundColor: Colors.purple,
            ),
          ), 
        ],
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: FadeInImage(
            placeholder: AssetImage("assets/loading-image.gif"),
            image: NetworkImage(
                "https://techaid.co/wp-content/uploads/2019/06/Anthony.png"),
            fadeInDuration: Duration(milliseconds: 200),
          ),
        ),
      ),
    );
  }
}
