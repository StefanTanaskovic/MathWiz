import 'package:flutter/material.dart';
import 'package:mathwiz_app/constants.dart';

class ShopScreen extends StatelessWidget {
  final List<String> classList = <String>['Thing A', 'Thing B', 'Thing C'];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context)
        .size; // provides total hieght and width of screen
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            leading: Icon(Icons.menu),
            title: Text('Shop'),
            backgroundColor: kPrimaryColor,
          ),
          body: SafeArea(
              child: Column(
            children: [
              Expanded(
                // Top Avatar Area
                child: Row(children: [
                  Expanded(
                    flex: 2,
                    child: Image.asset("assets/images/math_logo.png"),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            //padding: EdgeInsets.symmetric(horizontal: 10),
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: kPrimaryColor,
                                        borderRadius: BorderRadius.circular(8)),
                                    padding: EdgeInsets.all(3),
                                    child: Text(
                                      " Gold: ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.yellow[600]),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      " 1500 ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            alignment: Alignment.bottomCenter,
                            child: RaisedButton(
                              color: kPrimaryColor,
                              textColor: Colors.white,
                              child: Text("Buy"),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
              TabBar(
                // Tab Bar
                tabs: [
                  Tab(text: 'Shop', icon: Icon(Icons.account_balance_rounded)),
                  Tab(text: 'Inventory', icon: Icon(Icons.face)),
                ],
                labelColor: kPrimaryColor,
              ),
              Expanded(
                flex: 2,
                child: Container(
                  color: kBackgroundColor,
                  child: TabBarView(
                    children: [
                      GridView.count(
                        padding: EdgeInsets.all(10),
                        mainAxisSpacing: 0,
                        crossAxisSpacing: 0,
                        crossAxisCount: 5,
                        children: List.generate(40, (index) {
                          return Align(
                            child: Container(
                              height: 100,
                              width: 100,
                              child: Card(
                                color: Colors.white,
                                semanticContainer: true,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                              ),
                            ),
                          );
                        }),
                      ),
                      Icon(Icons.backpack),
                    ],
                  ),
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
