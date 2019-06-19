library flutter_ezlist;

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

typedef RefreshCallback = Future<void> Function();

class EzList extends StatelessWidget {
  final List items;

  final IndexedWidgetBuilder itemBuilder;

  final RefreshCallback onRefresh;

  const EzList({
    Key key,
    @required this.onRefresh,
    @required this.items,
    @required this.itemBuilder,
  })  : assert(onRefresh != null),
        assert(items != null),
        assert(itemBuilder != null);

  @override
  Widget build(BuildContext context) {
    return LiquidPullToRefresh(
        key: key,
        showChildOpacityTransition: false,
        springAnimationDurationInMilliseconds: 100,
        onRefresh: onRefresh,
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: itemBuilder,
        ));
  }
}
