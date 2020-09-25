import 'package:flutter/material.dart';

class ItemMenu extends StatelessWidget {
  final IconData icon;
  final String text;
  final double bottom, top;

  const ItemMenu({Key key, this.icon, this.text, this.bottom, this.top})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: bottom,
            color: Colors.white54,
          ),
          top: BorderSide(
            width: top,
            color: Colors.white54,
          ),
        ),
      ),
      child: RaisedButton(
        color: Colors.transparent,
        elevation: 0,
        disabledElevation: 0,
        focusElevation: 0,
        highlightElevation: 0,
        hoverElevation: 0,
        splashColor: Colors.purple[700],
        padding: EdgeInsets.all(0),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  text,
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
              ],
            ),
            Icon(
              Icons.chevron_right,
            )
          ],
        ),
      ),
    );
  }
}
