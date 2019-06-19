import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ezlist/ezlist.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EzList Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.red),
      home: Home(title: 'EzList'),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  static final List<String> _items = <String>[
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N'
  ];

  Future<void> _handleRefresh() {
    final Completer<void> completer = Completer<void>();
    Timer(const Duration(seconds: 3), () {
      completer.complete();
    });
    return completer.future.then<void>((_) {
      _scaffoldKey.currentState?.showSnackBar(SnackBar(
          content: const Text('Refresh complete'),
          action: SnackBarAction(
              label: 'RETRY',
              onPressed: () {
                _refreshIndicatorKey.currentState?.show();
              })));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Stack(
          children: <Widget>[
            Align(alignment: Alignment(-1.0, 0.0), child: Icon(Icons.reorder)),
            Align(alignment: Alignment(-0.75, 0.0), child: Text(widget.title)),
          ],
        ),
      ),
      body: EzList(
        key: _refreshIndicatorKey,
        onRefresh: _handleRefresh,
        items: _items,
        itemBuilder: (BuildContext context, int index) {
          final String item = _items[index];
          return ListTile(
            isThreeLine: true,
            leading: CircleAvatar(child: Text(item)),
            title: Text('This item represents $item.'),
            subtitle: const Text(
                'Even more additional list item information appears on line three.'),
          );
        },
      ),
    );
  }
}
