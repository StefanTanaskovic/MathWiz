import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mathwiz_app/views/class_list/class_list_screen.dart';
import 'package:mathwiz_app/views/homepage/homepage_teacher.dart';
import 'package:mathwiz_app/views/shop/shop_screen.dart';

import '../constants.dart';

class HamMenu extends StatelessWidget {
  const HamMenu({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
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

                // image: DecorationImage(
                //   image: AssetImage("assets/images/math_logo.png"),
                //   scale: 3,
                //   fit: BoxFit.scaleDown,
                // ),
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
            leading: Icon(Icons.home),
            title: Align(
              child: new Text('Home',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              alignment: Alignment(-1.3, 0),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return HomepageTeacherScreen();
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
        ],
      ),
    );
  }
}
