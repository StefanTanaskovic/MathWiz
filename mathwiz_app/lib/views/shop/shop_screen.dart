import 'package:flutter/material.dart';
import 'package:mathwiz_app/constants.dart';
import 'package:mathwiz_app/controllers/avatar_notifier.dart';
import 'package:mathwiz_app/services/avatar_api.dart';
import 'package:mathwiz_app/services/fs_database.dart';
import 'package:mathwiz_app/widgets/ham_menu.dart';
import 'package:mathwiz_app/widgets/loading_indicator.dart';
import 'package:provider/provider.dart';
import 'components/shop_tab.dart';

class ShopScreen extends StatefulWidget {
  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  @override
  void initState() {
    super.initState();
    AvatarNotifier avatarNotifier =
        Provider.of<AvatarNotifier>(context, listen: false);

    avatarNotifier.getItems(context);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    if (context.watch<AvatarNotifier>().masterItemsModel == null ||
        context.watch<FirestoreDatabaseService>().user.avatarID == null) {
      return Scaffold(
        body: LoadingIndicator(),
      );
    } else {
      FirestoreDatabaseService fsDatabase =
          Provider.of<FirestoreDatabaseService>(context, listen: false);
      AvatarNotifier avatarNotifier =
          Provider.of<AvatarNotifier>(context, listen: false);
      avatarNotifier.setAvatarUrl(fsDatabase.user.avatarID.toString());

      return Scaffold(
        body: DefaultTabController(
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
                      child: Image.network(
                        //"https://www.doppelme.com/transparent/DM1800598BLMKKC/avatar.png"
                        //"https://www.doppelme.com/transparent/DM1800598KZRELL/avatar.png"
                        context.watch<AvatarNotifier>().avatarURL,
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
                                          border: Border.all(
                                              color: kSecondaryColor),
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
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: kPrimaryColor, // background
                                  onPrimary: Colors.white, // foreground
                                ),
                                child: Text("Buy"),
                                onPressed: () async {
                                  APIService service = new APIService();

                                  await service
                                      .getItemInfo('face')
                                      .then((value) {
                                    value.tops.forEach((element) {
                                      print(element.id +
                                          ' : ' +
                                          element.description);
                                    });
                                  });
                                },
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
                    Tab(
                        text: 'Shop',
                        icon: Icon(Icons.account_balance_rounded)),
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
                        // ----- Shop Tab ----- //
                        ShopTab(
                          items:
                              context.watch<AvatarNotifier>().masterItemsModel,
                        ),
                        // ----- Inv Tab ------ //
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
}
