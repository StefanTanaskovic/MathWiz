import 'package:flutter/material.dart';
import 'package:mathwiz_app/constants.dart';
import 'package:mathwiz_app/model/avatar/items_model.dart';

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
        itemCount: 10,
        itemBuilder: (BuildContext context, int count) {
          if (count == 0) {
            title = "Faces";
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
            title = "Accessorie";
            assets = widget.items.accessories;
          } else if (count == 7) {
            title = "Extras";
            assets = widget.items.extras;
          } else if (count == 8) {
            title = "Eyewear";
            assets = widget.items.eyes;
          } else if (count == 9) {
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
                            color: kPrimaryLightColor,
                            semanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Image.asset(assets[index]),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ]));
        });
  }
}
