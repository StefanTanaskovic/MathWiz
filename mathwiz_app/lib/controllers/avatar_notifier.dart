import 'package:flutter/material.dart';
import 'package:mathwiz_app/model/avatar/items_model.dart';
import 'package:mathwiz_app/services/avatar_api.dart';
import 'package:random_string/random_string.dart';

class AvatarNotifier extends ChangeNotifier {
  String _avatarURL =
      "https://www.doppelme.com/transparent/DM1800598KZRELL/avatar.png";

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

  void createAvatar() async {
    APIService apiService = new APIService();

    apiService.createAvatar().then((value) {
      if (value != null) {
        print(value);
      } else {
        print('Error!');
      }
    });
  }

  void updateAvatar(String avatarKey, String itemID) async {
    APIService apiService = new APIService();

    print(itemID);

    apiService.updateAvatar(avatarKey, itemID).then((value) {
      if (value != null) {
        _avatarURL = value + '#' + randomAlpha(2);
        notifyListeners();
      } else {
        print('Error!');
      }
    });
  }
}
