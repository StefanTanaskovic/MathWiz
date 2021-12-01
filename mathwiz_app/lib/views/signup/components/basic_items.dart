import 'package:flutter/material.dart';
import 'package:mathwiz_app/constants.dart';
import 'package:mathwiz_app/controllers/avatar_notifier.dart';
import 'package:mathwiz_app/model/avatar/items_model.dart';
import 'package:mathwiz_app/services/fs_database.dart';
import 'package:provider/provider.dart';

class BasicItems extends StatefulWidget {
  final MasterItemsModel items;

  BasicItems({Key key, @required this.items}) : super(key: key);

  @override
  _BasicItemsState createState() => _BasicItemsState();
}

class _BasicItemsState extends State<BasicItems> {
  var title;
  List<ItemModel> assets;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.only(top: 10),
        itemCount: 4,
        itemBuilder: (BuildContext context, int count) {
          if (count == 0) {
            title = "Hair";
            assets = widget.items.hairs;
          } else if (count == 1) {
            title = "Tops";
            assets = widget.items.tops;
          } else if (count == 2) {
            title = "Bottoms";
            assets = widget.items.bottoms;
          } else if (count == 3) {
            title = "Shoes";
            assets = widget.items.shoes;
          }

          return Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              height: 200,
              child: Column(children: [
                Text(
                  title,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                Expanded(
                  child: GridView.count(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.all(10),
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 0,
                    crossAxisCount: 2,
                    children: List.generate(9, (index) {
                      return Align(
                          child: Container(
                        height: 100,
                        width: 100,
                        child: Card(
                          clipBehavior: Clip.antiAlias,
                          elevation: 3,
                          child: Container(
                            decoration: BoxDecoration(
                              image: new DecorationImage(
                                image: AssetImage(assets[index].imagePath),
                              ),
                              border: Border.all(
                                color: kPrimaryColor,
                              ),
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                  child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Wrap(
                                      children: [
                                        checkCost(assets, index),
                                      ],
                                    ),
                                  ),
                                  splashColor: kSecondaryColor,
                                  onTap: () {
                                    tryAvatarItem(
                                        count, index, widget, context);
                                  }),
                            ),
                          ),
                        ),
                      ));
                    }),
                  ),
                ),
              ]));
        });
  }

  tryAvatarItem(count, index, widget, BuildContext context) {
    ItemModel tapped;
    var type;
    if (count == 0) {
      tapped = widget.items.hairs[index];
      type = 'hair';
    } else if (count == 1) {
      tapped = widget.items.tops[index];
      type = 'top';
    } else if (count == 2) {
      tapped = widget.items.bottoms[index];
      type = 'bottom';
    } else if (count == 3) {
      tapped = widget.items.shoes[index];
      type = 'foot';
    }

    if (tapped.itemCost == 0) {
      print("Afforded! Buy!");
      FirestoreDatabaseService fsDatabase =
          Provider.of<FirestoreDatabaseService>(context, listen: false);
      AvatarNotifier avatarNotifier =
          Provider.of<AvatarNotifier>(context, listen: false);

      avatarNotifier.updateAvatar(tapped.itemID, type);
      fsDatabase.updateBank(-tapped.itemCost);
    } else {
      print("You're too poor!");
    }
  }
}

checkCost(assets, index) {
  if (assets[index].itemCost == 0) {
    return Container();
  } else {
    return Container(
        color: Colors.black.withOpacity(0.5),
        child: Text(
          assets[index].itemCost.toString(),
          style: TextStyle(
              color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 16),
        ));
  }
}
