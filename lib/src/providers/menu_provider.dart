import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class _MenuProvider {
  _MenuProvider();

  Future<List<dynamic>> loadData() async {
    final response = await rootBundle.loadString('data/menu_opts.json');
    Map data = json.decode(response);
    return data["routes"];
  }
}

final menuProvider = new _MenuProvider();
