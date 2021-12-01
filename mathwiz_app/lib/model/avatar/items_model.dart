import 'dart:convert';
import 'package:flutter/cupertino.dart';

Future<MasterItemsModel> getAvatarImages(context) async {
  final manifestJson =
      await DefaultAssetBundle.of(context).loadString('AssetManifest.json');

  var facesList = json
      .decode(manifestJson)
      .keys
      .where((String key) => key.startsWith('assets/avatar/faces/'));
  facesList = List<String>.from(facesList);

  List<ItemModel> newFacesList = [];

  for (var i = 0; i < facesList.length; i++) {
    int cost;
    if (i == 0) {
      cost = 0;
    } else if (i < 5) {
      cost = 20;
    } else {
      cost = 50;
    }
    var newFaceItem = ItemModel(
      imagePath: facesList[i].toString(),
      itemCost: cost,
      itemID: facesList[i].replaceAll(new RegExp(r'[^0-9]'), ''),
      isOwned: false,
    );

    newFacesList.add(newFaceItem);
  }

  var hairsList = json
      .decode(manifestJson)
      .keys
      .where((String key) => key.startsWith('assets/avatar/hairs/'));
  hairsList = List<String>.from(hairsList);

  List<ItemModel> newHairsList = [];

  for (var i = 0; i < hairsList.length; i++) {
    int cost;
    if (i == 0) {
      cost = 0;
    } else if (i < 3) {
      cost = 0;
    } else if (i >= 3 && i < 6) {
      cost = 0;
    } else {
      cost = 50;
    }
    var newHairItem = ItemModel(
      imagePath: hairsList[i].toString(),
      itemCost: cost,
      itemID: hairsList[i].replaceAll(new RegExp(r'[^0-9]'), ''),
      isOwned: false,
    );

    newHairsList.add(newHairItem);
  }

  var eyesList = json
      .decode(manifestJson)
      .keys
      .where((String key) => key.startsWith('assets/avatar/eyes/'));
  eyesList = List<String>.from(eyesList);

  List<ItemModel> newEyesList = [];

  for (var i = 0; i < eyesList.length; i++) {
    int cost;
    if (i == 0) {
      cost = 0;
    } else if (i < 5) {
      cost = 20;
    } else {
      cost = 50;
    }
    var newEyeItem = ItemModel(
      imagePath: eyesList[i].toString(),
      itemCost: cost,
      itemID: eyesList[i].replaceAll(new RegExp(r'[^0-9]'), ''),
      isOwned: false,
    );

    newEyesList.add(newEyeItem);
  }

  var hatsList = json
      .decode(manifestJson)
      .keys
      .where((String key) => key.startsWith('assets/avatar/hats/'));
  hatsList = List<String>.from(hatsList);

  List<ItemModel> newHatsList = [];

  for (var i = 0; i < hatsList.length; i++) {
    int cost;
    if (i == 0) {
      cost = 0;
    } else if (i < 5) {
      cost = 20;
    } else {
      cost = 50;
    }
    var newHatItem = ItemModel(
      imagePath: hatsList[i].toString(),
      itemCost: cost,
      itemID: hatsList[i].replaceAll(new RegExp(r'[^0-9]'), ''),
      isOwned: false,
    );

    newHatsList.add(newHatItem);
  }

  var topsList = json
      .decode(manifestJson)
      .keys
      .where((String key) => key.startsWith('assets/avatar/tops/'));
  topsList = List<String>.from(topsList);

  List<ItemModel> newTopsList = [];

  for (var i = 0; i < topsList.length; i++) {
    int cost;
    if (i == 0) {
      cost = 0;
    } else if (i < 3) {
      cost = 0;
    } else if (i >= 3 && i < 6) {
      cost = 0;
    } else {
      cost = 50;
    }
    var newTopItem = ItemModel(
      imagePath: topsList[i].toString(),
      itemCost: cost,
      itemID: topsList[i].replaceAll(new RegExp(r'[^0-9]'), ''),
      isOwned: false,
    );

    newTopsList.add(newTopItem);
  }

  var bottomsList = json
      .decode(manifestJson)
      .keys
      .where((String key) => key.startsWith('assets/avatar/bottoms/'));
  bottomsList = List<String>.from(bottomsList);

  List<ItemModel> newBottomsList = [];

  for (var i = 0; i < bottomsList.length; i++) {
    int cost;
    if (i == 0) {
      cost = 0;
    } else if (i < 3) {
      cost = 0;
    } else if (i >= 3 && i < 6) {
      cost = 0;
    } else {
      cost = 50;
    }
    var newBottomItem = ItemModel(
      imagePath: bottomsList[i].toString(),
      itemCost: cost,
      itemID: bottomsList[i].replaceAll(new RegExp(r'[^0-9]'), ''),
      isOwned: false,
    );

    newBottomsList.add(newBottomItem);
  }

  var shoesList = json
      .decode(manifestJson)
      .keys
      .where((String key) => key.startsWith('assets/avatar/shoes/'));
  shoesList = List<String>.from(shoesList);

  List<ItemModel> newShoesList = [];

  for (var i = 0; i < shoesList.length; i++) {
    int cost;
    if (i == 0) {
      cost = 0;
    } else if (i < 3) {
      cost = 0;
    } else if (i >= 3 && i < 6) {
      cost = 0;
    } else {
      cost = 50;
    }
    var newShoeItem = ItemModel(
      imagePath: shoesList[i].toString(),
      itemCost: cost,
      itemID: shoesList[i].replaceAll(new RegExp(r'[^0-9]'), ''),
      isOwned: false,
    );

    newShoesList.add(newShoeItem);
  }

  var extrasList = json
      .decode(manifestJson)
      .keys
      .where((String key) => key.startsWith('assets/avatar/extras/'));
  extrasList = List<String>.from(extrasList);

  List<ItemModel> newExtrasList = [];

  for (var i = 0; i < extrasList.length; i++) {
    int cost;
    if (i == 0) {
      cost = 0;
    } else if (i < 5) {
      cost = 20;
    } else {
      cost = 50;
    }
    var newExtraItem = ItemModel(
      imagePath: extrasList[i].toString(),
      itemCost: cost,
      itemID: extrasList[i].replaceAll(new RegExp(r'[^0-9]'), ''),
      isOwned: false,
    );

    newExtrasList.add(newExtraItem);
  }

  var accessoriesList = json
      .decode(manifestJson)
      .keys
      .where((String key) => key.startsWith('assets/avatar/accessories/'));
  accessoriesList = List<String>.from(accessoriesList);

  var backgroundsList = json
      .decode(manifestJson)
      .keys
      .where((String key) => key.startsWith('assets/avatar/backgrounds/'));
  backgroundsList = List<String>.from(backgroundsList);

  List<ItemModel> newBackgroundsList = [];

  for (var i = 0; i < backgroundsList.length; i++) {
    int cost;
    if (i == 0) {
      cost = 0;
    } else if (i < 5) {
      cost = 20;
    } else {
      cost = 50;
    }
    var newBackgroundItem = ItemModel(
      imagePath: backgroundsList[i].toString(),
      itemCost: cost,
      itemID: backgroundsList[i].replaceAll(new RegExp(r'[^0-9]'), ''),
      isOwned: false,
    );

    newBackgroundsList.add(newBackgroundItem);
  }

  var masterItemsModel = MasterItemsModel(
      faces: newFacesList,
      hairs: newHairsList,
      eyes: newEyesList,
      hats: newHatsList,
      tops: newTopsList,
      bottoms: newBottomsList,
      shoes: newShoesList,
      extras: newExtrasList,
      accessories: accessoriesList,
      backgrounds: newBackgroundsList);

  return masterItemsModel;
}

class ItemModel {
  final int itemCost;
  final String itemID;
  final String imagePath;
  final bool isOwned;

  ItemModel({
    this.itemCost,
    this.itemID,
    this.imagePath,
    this.isOwned,
  });
}

class MasterItemsModel {
  final List faces;
  final List hairs;
  final List eyes;
  final List hats;
  final List tops;
  final List bottoms;
  final List shoes;
  final List extras;
  final List accessories;
  final List backgrounds;

  MasterItemsModel({
    this.faces,
    this.hairs,
    this.eyes,
    this.hats,
    this.tops,
    this.bottoms,
    this.shoes,
    this.extras,
    this.accessories,
    this.backgrounds,
  });
}
