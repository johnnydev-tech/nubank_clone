import 'package:flutter/material.dart';

import 'card_app.dart';

class PageViewApp extends StatelessWidget {
  final double top;
  final ValueChanged<int> onChanged;

  const PageViewApp({Key key, this.top, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      height: MediaQuery.of(context).size.height * .53,
      left: 0,
      right: 0,
      child: PageView(
        onPageChanged: onChanged,
        physics: BouncingScrollPhysics(),
        children: [
          CardApp(),
          CardApp(),
          CardApp(),
        ],
      ),
    );
  }
}
