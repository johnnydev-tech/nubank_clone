import 'package:flutter/material.dart';
import 'package:nubank_clone/pages/home/widgets/item_menu.dart';

class MenuApp extends StatelessWidget {
  final double top;
  final bool showMenu;

  const MenuApp({Key key, this.top, this.showMenu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: 0,
      right: 0,
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 200),
        opacity: showMenu ? 1 : 0,
        child: Container(
          //color: Colors.red,
          height: MediaQuery.of(context).size.height * .65,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 12),
                padding: EdgeInsets.all(5),
                color: Colors.white,
                child: Image.asset(
                  "assets/images/qrcode.png",
                  height: 85,
                  color: Colors.purple[700],
                ),
              ),
              Text.rich(
                TextSpan(
                  text: "Banco ",
                  children: [
                    TextSpan(
                      text: "260 - Nu Pagamentos S.A",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(
                height: 5,
              ),
              Text.rich(
                TextSpan(
                  text: "Agência ",
                  children: [
                    TextSpan(
                      text: "0001",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(
                height: 5,
              ),
              Text.rich(
                TextSpan(
                  text: "Conta ",
                  children: [
                    TextSpan(
                      text: "0000000-0",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ItemMenu(
                      top: .7,
                      bottom: 0,
                      icon: Icons.help_outline,
                      text: "Me ajuda",
                    ),
                    ItemMenu(
                      top: .7,
                      bottom: 0,
                      icon: Icons.person,
                      text: "Perfil",
                    ),
                    ItemMenu(
                        top: .7,
                        bottom: 0,
                        icon: Icons.monetization_on_outlined,
                        text: "Configurar NuConta"),
                    ItemMenu(
                      top: .7,
                      bottom: 0,
                      icon: Icons.credit_card,
                      text: "Configurar Cartão",
                    ),
                    ItemMenu(
                      top: .7,
                      bottom: .7,
                      icon: Icons.smartphone,
                      text: "Configurações do app",
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 25),
                      child: OutlineButton(
                        highlightedBorderColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 15),
                        borderSide: BorderSide(width: 1, color: Colors.white54),
                        child: Text(
                          "SAIR DA CONTA",
                          style: TextStyle(letterSpacing: 1),
                        ),
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
