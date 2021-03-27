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

  var hairsList = json
      .decode(manifestJson)
      .keys
      .where((String key) => key.startsWith('assets/avatar/hairs/'));
  hairsList = List<String>.from(hairsList);

  var eyesList = json
      .decode(manifestJson)
      .keys
      .where((String key) => key.startsWith('assets/avatar/eyes/'));
  eyesList = List<String>.from(eyesList);

  var hatsList = json
      .decode(manifestJson)
      .keys
      .where((String key) => key.startsWith('assets/avatar/hats/'));
  hatsList = List<String>.from(hatsList);

  var topsList = json
      .decode(manifestJson)
      .keys
      .where((String key) => key.startsWith('assets/avatar/tops/'));
  topsList = List<String>.from(topsList);

  var bottomsList = json
      .decode(manifestJson)
      .keys
      .where((String key) => key.startsWith('assets/avatar/bottoms/'));
  bottomsList = List<String>.from(bottomsList);

  var shoesList = json
      .decode(manifestJson)
      .keys
      .where((String key) => key.startsWith('assets/avatar/shoes/'));
  shoesList = List<String>.from(shoesList);

  var extrasList = json
      .decode(manifestJson)
      .keys
      .where((String key) => key.startsWith('assets/avatar/extras/'));
  extrasList = List<String>.from(extrasList);

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

  var masterItemsModel = MasterItemsModel(
      faces: facesList,
      hairs: hairsList,
      eyes: eyesList,
      hats: hatsList,
      tops: topsList,
      bottoms: bottomsList,
      shoes: shoesList,
      extras: extrasList,
      accessories: accessoriesList,
      backgrounds: backgroundsList);

  return masterItemsModel;
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
