import 'package:flutter/material.dart';
import 'package:mathwiz_app/model/avatar/items_model.dart';
import 'package:mathwiz_app/services/avatar_api.dart';

class AvatarNotifier extends ChangeNotifier {
  String _avatarURL = "";

  String get avatarURL => _avatarURL;

  MasterItemsModel _masterItemsModel;

  MasterItemsModel get masterItemsModel => _masterItemsModel;

  Future getItems(context) async {
    await getAvatarImages(context).then((value) {
      if (value != null) {
        _masterItemsModel = value;
      }
    });
    notifyListeners();
  }

  void createAvatarTest() async {
    APIService apiService = new APIService();

    apiService.createAvatar().then((value) {
      if (value != null) {
        print(value);
      } else {
        print('Error!');
      }
    });
  }

  void updateAvatarTest(String avatarKey, String itemID) async {
    APIService apiService = new APIService();

    apiService.updateAvatar(avatarKey, itemID).then((value) {
      if (value != null) {
        print(value);
      } else {
        print('Error!');
      }
    });
  }
}
