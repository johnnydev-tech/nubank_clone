import 'package:flutter/material.dart';
import 'package:nubank_clone/pages/home/widgets/item_menu_bottom.dart';
import 'package:nubank_clone/pages/home/widgets/menu_app.dart';
import 'package:nubank_clone/pages/home/widgets/my_app_bar.dart';
import 'package:nubank_clone/pages/home/widgets/my_dots_app.dart';
import 'package:nubank_clone/pages/home/widgets/page_view_app.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showMenu;
  int _currentIndex;
  double _yPosition;

  @override
  void initState() {
    super.initState();
    _showMenu = false;
    _currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;

    if (_yPosition == null) {
      _yPosition = _screenHeight * .24;
    }
    return Scaffold(
      backgroundColor: Colors.purple[700],
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          MyAppBar(
            showMenu: _showMenu,
            onTap: () {
              setState(() {
                _showMenu = !_showMenu;
                _yPosition =
                    _showMenu ? _screenHeight * .85 : _screenHeight * .24;
              });
            },
          ),
          MenuApp(
            top: _screenHeight * .18,
            showMenu: _showMenu,
          ),
          PageViewApp(
            showMenu: _showMenu,
            top: _yPosition -
                35, //!_showMenu ? _screenHeight * .24 : _screenHeight * .75,
            onChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            onPanUpdate: (details) {
              double positionBottomLimit = _screenHeight * .85;
              double positionTopLimit = _screenHeight * .24;
              double middlePosition = positionBottomLimit - positionTopLimit;
              middlePosition = middlePosition / 2;
              setState(() {
                _yPosition += details.delta.dy;

                _yPosition = _yPosition < positionTopLimit
                    ? positionTopLimit
                    : _yPosition;

                _yPosition = _yPosition > positionBottomLimit
                    ? positionBottomLimit
                    : _yPosition;

                if (_yPosition != positionBottomLimit && details.delta.dy > 0) {
                  _yPosition =
                      _yPosition > positionTopLimit + middlePosition - 140
                          ? positionBottomLimit
                          : _yPosition;
                }

                if (_yPosition != positionTopLimit && details.delta.dy < 0) {
                  _yPosition =
                      _yPosition < positionBottomLimit - middlePosition + 90
                          ? positionTopLimit
                          : _yPosition;
                }

                if (_yPosition == positionBottomLimit) {
                  _showMenu = true;
                } else if (_yPosition == positionTopLimit) {
                  _showMenu = false;
                }
              });
            },
          ),
          MyDotsApp(
              showMenu: _showMenu,
              top: _screenHeight * .70,
              currentIndex: _currentIndex),
          AnimatedPositioned(
            duration: Duration(milliseconds: 200),
            bottom: !_showMenu
                ? 0 + MediaQuery.of(context).padding.bottom + 60
                : -200,
            left: 0,
            right: 0,
            height: 120,
            child: Container(
              child: ListView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  ItemMenuBottom(
                    icon: Icons.person_add,
                    text: "Indicar Amigos",
                  ),
                  ItemMenuBottom(
                    icon: Icons.monetization_on,
                    text: "Pix",
                  ),
                  ItemMenuBottom(
                    icon: Icons.qr_code_scanner,
                    text: "Pagar",
                  ),
                  ItemMenuBottom(
                    icon: Icons.trending_up,
                    text: "Transferir",
                  ),
                  ItemMenuBottom(
                    icon: Icons.trending_down,
                    text: "Depositar",
                  ),
                  ItemMenuBottom(
                    icon: Icons.phone_android,
                    text: "Recarga de celuar",
                  ),
                  ItemMenuBottom(
                    icon: Icons.monetization_on_outlined,
                    text: "Dividir valor",
                  ),
                  ItemMenuBottom(
                    icon: Icons.payments,
                    text: "Cobrar",
                  ),
                  ItemMenuBottom(
                    icon: Icons.accessibility_new,
                    text: "Doação",
                  ),
                  ItemMenuBottom(
                    icon: Icons.tune,
                    text: "Ajustar Limite",
                  ),
                  ItemMenuBottom(
                    icon: Icons.lock_open,
                    text: "Bloquear Cartão",
                  ),
                  ItemMenuBottom(
                    icon: Icons.payment,
                    text: "Cartão Virtual",
                  ),
                  ItemMenuBottom(
                    icon: Icons.sort,
                    text: "Organizar atalhos",
                    color: Colors.black12,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
