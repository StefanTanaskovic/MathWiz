import 'package:flutter/material.dart';
import 'package:mathwiz_app/constants.dart';
import 'package:mathwiz_app/controllers/avatar_notifier.dart';
import 'package:mathwiz_app/model/avatar/items_model.dart';
import 'package:provider/provider.dart';

class ShopTab extends StatefulWidget {
  final MasterItemsModel items;

  ShopTab({Key key, @required this.items}) : super(key: key);

  @override
  _ShopTabState createState() => _ShopTabState();
}

class _ShopTabState extends State<ShopTab> {
  var title;
  var assets;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.only(top: 10),
        itemCount: 9,
        itemBuilder: (BuildContext context, int count) {
          if (count == 0) {
            title = "Face Paint";
            assets = widget.items.faces;
          } else if (count == 1) {
            title = "Hair";
            assets = widget.items.hairs;
          } else if (count == 2) {
            title = "Hats";
            assets = widget.items.hats;
          } else if (count == 3) {
            title = "Tops";
            assets = widget.items.tops;
          } else if (count == 4) {
            title = "Bottoms";
            assets = widget.items.bottoms;
          } else if (count == 5) {
            title = "Shoes";
            assets = widget.items.shoes;
          } else if (count == 6) {
            title = "Extras";
            assets = widget.items.extras;
          } else if (count == 7) {
            title = "Eyewear";
            assets = widget.items.eyes;
          } else if (count == 8) {
            title = "Backgrounds";
            assets = widget.items.backgrounds;
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
                    children: List.generate(assets.length, (index) {
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
                                image: AssetImage(assets[index]),
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

  tryAvatarItem(count, index, widget, context) {
    var tapped;
    var type;
    if (count == 0) {
      tapped = widget.items.faces[index];
      type = 'face';
    } else if (count == 1) {
      tapped = widget.items.hairs[index];
      type = 'hair';
    } else if (count == 2) {
      tapped = widget.items.hats[index];
      type = 'hat';
    } else if (count == 3) {
      tapped = widget.items.tops[index];
      type = 'top';
    } else if (count == 4) {
      tapped = widget.items.bottoms[index];
      type = 'bottom';
    } else if (count == 5) {
      tapped = widget.items.shoes[index];
      type = 'foot';
    } else if (count == 6) {
      tapped = widget.items.extras[index];
      type = 'facial';
    } else if (count == 7) {
      tapped = widget.items.eyes[index];
      type = 'eye';
    } else if (count == 8) {
      tapped = widget.items.backgrounds[index];
      type = 'background';
    }

    tapped = tapped.replaceAll(new RegExp(r'[^0-9]'), '');

    AvatarNotifier avatarNotifier =
        Provider.of<AvatarNotifier>(context, listen: false);
    avatarNotifier.updateAvatar(tapped, type);
  }
}
