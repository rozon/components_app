import 'package:flutter/material.dart';
import 'dart:async';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<int> _items = List();
  int _pictureNumber = 0;
  ScrollController _scrollController = ScrollController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _add10Items();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _fetchData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lists"),
      ),
      body: Stack(
        children: <Widget>[
          _createList(),
          _createLoading(),
        ],
      ),
    );
  }

  Widget _createList() {
    return RefreshIndicator(
      onRefresh: _getNextPage,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _items.length,
        itemBuilder: (BuildContext context, item) {
          return FadeInImage(
            placeholder: AssetImage("assets/loading-image.gif"),
            image: NetworkImage(
                "https://i.picsum.photos/id/${_items[item]}/500/300.jpg"),
          );
        },
      ),
    );
  }

  void _add10Items() {
    for (var i = 1; i < 10; i++) {
      _pictureNumber++;
      _items.add(_pictureNumber);
    }
    setState(() {});
  }

  Future<Null> _fetchData() async {
    setState(() {
      _isLoading = true;
    });
    return Timer(Duration(seconds: 2), () {
      _isLoading = false;
      _scrollController.animateTo(
        _scrollController.position.pixels + 100,
        duration: Duration(milliseconds: 250),
        curve: Curves.fastOutSlowIn,
      );
      _add10Items();
    });
  }

  Widget _createLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
            ],
          ),
          SizedBox(height: 30.0),
        ],
      );
    } else {
      return Container();
    }
  }

  Future<void> _getNextPage() async {
    Timer(Duration(seconds: 2), () {
      _items.clear();
      _pictureNumber++;
      _add10Items();
    });

    return Future.delayed(Duration(seconds: 2));
  }
}
