import 'package:flutter/material.dart';
import 'package:mathwiz_app/model/avatar/items_model.dart';
import 'package:mathwiz_app/services/avatar_api.dart';
import 'package:random_string/random_string.dart';

class AvatarNotifier extends ChangeNotifier {
  String _avatarURL;

  String _avatarKey;

  String get avatarURL => _avatarURL;

  MasterItemsModel _masterItemsModel;

  MasterItemsModel get masterItemsModel => _masterItemsModel;

  void setAvatarUrl(value) {
    if (_avatarURL != null) {
      print("Avatar Key and URL not null");
    } else {
      if (value != null) {
        _avatarKey = value;
        print("Avatar Key:" + value);
        _avatarURL =
            "https://www.doppelme.com/transparent/" + value + "/avatar.png";
      }
    }
  }

  Future getItems(context) async {
    await getAvatarImages(context).then((value) {
      if (value != null) {
        _masterItemsModel = value;
      }
    });
    notifyListeners();
  }

  Future createAvatar() async {
    APIService apiService = new APIService();

    apiService.createAvatar().then((value) {
      if (value != null) {
        print("Avatar Created: " + value.avatarID);
      } else {
        print('Error!');
      }
    });

    
  }

  void updateAvatar(String itemID, String itemType) async {
    APIService apiService = new APIService();

    apiService.updateAvatar(_avatarKey, itemID, itemType).then((value) {
      if (value != null) {
        _avatarURL = value + '#' + randomAlpha(2);
        notifyListeners();
      } else {
        print('Error!');
      }
    });
  }
}
