import 'package:flutter/material.dart';
import 'package:components_app/src/providers/menu_provider.dart';
import 'package:components_app/src/utils/icon_string_util.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Components"),
      ),
      body: _createList(),
    );
  }

  Widget _createList() {
    return FutureBuilder(
      initialData: [],
      future: menuProvider.loadData(),
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _listItems(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _listItems(List<dynamic> data, BuildContext context) {
    List<Widget> widgets = [];
    data.forEach((data) {
      final widget = ListTile(
        title: Text(data["text"]),
        leading: getIcon(data["icon"]),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.blue),
        onTap: () {
          Navigator.pushNamed(context, data["route"]);
        },
      );
      widgets..add(widget)..add(Divider());
    });
    return widgets;
  }
}
