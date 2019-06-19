library flutter_ezlist;

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

typedef RefreshCallback = Future<void> Function();

class EzList extends StatelessWidget {
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

  final RefreshCallback onRefresh;

  final Key key;

  const EzList({@required this.onRefresh, this.key})
      : assert(onRefresh != null);

  @override
  Widget build(BuildContext context) {
    return LiquidPullToRefresh(
        key: key,
        showChildOpacityTransition: false,
        springAnimationDurationInMilliseconds: 100,
        onRefresh: onRefresh,
        child: ListView.builder(
          itemCount: _items.length,
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
        ));
  }
}
