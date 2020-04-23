import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Card Page"),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _getTypeOneCard(),
          SizedBox(height: 30.0),
          _getTypeTwoCard(),
        ],
      ),
    );
  }

  Widget _getTypeOneCard() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album),
            title: Text("Title Test"),
            subtitle: Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(onPressed: () {}, child: Text("Cancel")),
              FlatButton(onPressed: () {}, child: Text("Ok"))
            ],
          ),
        ],
      ),
    );
  }

  Widget _getTypeTwoCard() {
    final card = Container(
      child: Column(
        children: <Widget>[
          FadeInImage(
              height: 300.0,
              fit: BoxFit.cover,
              fadeInDuration: Duration(milliseconds: 200),
              placeholder: AssetImage("assets/loading-image.gif"),
              image: NetworkImage(
                  "https://digital-photography-school.com/wp-content/uploads/2016/05/101-landscape-lightroom-presets-bg.jpg")),
          Container(
            child: Text("Text below image"),
            padding: EdgeInsets.all(10.0),
          )
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 10.0),
          ),
        ],
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: card,
      ),
    );
  }
}
