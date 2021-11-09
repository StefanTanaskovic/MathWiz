import 'dart:convert';

AvatarModel avatarModelFromJson(String str) =>
    AvatarModel.fromJson(json.decode(str));

// Create Avatar Response Model
class AvatarModel {
  final String status;
  final String avatarID;
  final String avatarURL;
  final String thumbnailURL;

  AvatarModel({
    this.status,
    this.avatarID,
    this.avatarURL,
    this.thumbnailURL,
  });

  factory AvatarModel.fromJson(Map<String, dynamic> jsonMap) {
    final data = AvatarModel(
      status: jsonMap["status"],
      avatarID: jsonMap["doppelme_key"],
      avatarURL: jsonMap["avatarSrc"],
      thumbnailURL: jsonMap["thumbnailSrc"],
    );
    return data;
  }
}
