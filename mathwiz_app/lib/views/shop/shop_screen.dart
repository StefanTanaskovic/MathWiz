import 'package:flutter/material.dart';
import 'package:mathwiz_app/constants.dart';
import 'package:mathwiz_app/widgets/ham_menu.dart';

class ShopScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context)
        .size; // provides total hieght and width of screen
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Shop'),
            backgroundColor: kPrimaryColor,
          ),
          drawer: HamMenu(size: size),
          body: SafeArea(
              child: Column(
            children: [
              Expanded(
                // Top Avatar Area
                child: Row(children: [
                  Expanded(
                    flex: 2,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        //avatar
                        Positioned(
                          left: 60,
                          child: Image.asset(
                              "assets/images/avatar3.png",
                              //height: 200,
                              scale: 1.2,
                            ),
                        ),
                        //hair
                        Positioned(
                          left: 63,
                          top: 32,
                          child: Image.asset(
                            "assets/images/24.png",
                            //scale: 0.7,
                            //height: 200,
                          ),
                        ),
                        //bottom
                        Positioned(
                          left: 72,
                          top: 126,
                          child: Image.asset(
                            "assets/images/127.png",
                            scale: 1.3,
                            //height: 200,
                          ),
                          
                        ),
                        //Top
                        Positioned(
                          left: 67,
                          top: 100,
                          child: Image.asset(
                            "assets/images/333.png",
                            scale: 0.98,
                            //height: 200,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: kSecondaryColor),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    height: 50,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Gold:",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: kSecondaryColor),
                                    ),
                                  ),
                                ),
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
                              color: kSecondaryColor,
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
                labelColor: kSecondaryColor,
                indicatorColor: kSecondaryColor,
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
                                color: kPrimaryLightColor,
                                semanticContainer: true,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                              ),
                            ),
                          );
                        }),
                      ),
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
                                color: kSecondaryLightColor,
                                semanticContainer: true,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                              ),
                            ),
                          );
                        }),
                      ),
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
