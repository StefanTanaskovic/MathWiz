import 'dart:convert';

DataModel topsModelFromJson(String str) => DataModel.fromJson(json.decode(str));

// Profile Model
class DataModel {
  final String status;
  final List<TopsModel> tops;

  DataModel({
    this.status,
    this.tops,
  });

  factory DataModel.fromJson(Map<String, dynamic> jsonMap) => DataModel(
        tops: List<TopsModel>.from(
            jsonMap["asset_ids"].map((x) => TopsModel.fromJson(x))),
      );
}

class TopsModel {
  final String id;
  final String type;
  final String description;
  final String colorable;
  final String thumbSrc;

  TopsModel({
    this.id,
    this.type,
    this.description,
    this.colorable,
    this.thumbSrc,
  });

  //mapping json data
  factory TopsModel.fromJson(Map<String, dynamic> jsonMap) {
    final data = TopsModel(
      id: jsonMap["id"],
      type: jsonMap["type"],
      description: jsonMap["description"],
    );
    return data;
  }
}
