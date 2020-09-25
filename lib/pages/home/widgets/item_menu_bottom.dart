import 'package:flutter/material.dart';

class ItemMenuBottom extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;

  const ItemMenuBottom({Key key, this.icon, this.text, this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      highlightColor: Colors.transparent,
      splashColor: Colors.black.withOpacity(.1),
      borderRadius: BorderRadius.circular(5),
      child: Container(
        padding: EdgeInsets.all(9),
        margin: EdgeInsets.symmetric(horizontal: 4, vertical: 5),
        width: 110,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: color == null ? Colors.white12 : color,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              size: 30,
            ),
            Text(
              text,
              style: TextStyle(fontSize: 12, letterSpacing: .7),
            ),
          ],
        ),
      ),
    );
  }
}
