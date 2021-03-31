import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mathwiz_app/services/auth.dart';
import 'package:mathwiz_app/views/class_list/class_list_screen.dart';
import 'package:mathwiz_app/views/shop/shop_screen.dart';

import '../constants.dart';

class HamMenuStart extends StatelessWidget {
  const HamMenuStart({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: size.height * 0.115,
            child: DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('MathWiz',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white)),
                ],
              ),
              decoration: BoxDecoration(
                color: kPrimaryColor,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.list_alt),
            title: Align(
              child: new Text('Classes',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              alignment: Alignment(-1.3, 0),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ClassListScreen();
                  },
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Align(
              child: new Text('Shop',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              alignment: Alignment(-1.3, 0),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ShopScreen();
                  },
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Align(
              child: new Text('Sign Out',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.red)),
              alignment: Alignment(-1.3, 0),
            ),
            onTap: () async {
              Navigator.of(context).popUntil((route) => route.isFirst);
              await _auth.signOut();
            },
          ),
        ],
      ),
    );
  }
}
