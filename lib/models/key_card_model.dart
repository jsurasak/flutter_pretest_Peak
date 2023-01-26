import 'dart:convert';

class KeyCardModel {
  String? keycardnumber;
  bool? status;

  KeyCardModel({this.keycardnumber, this.status});

  factory KeyCardModel.fromMap(Map<String, dynamic> data) => KeyCardModel(
        keycardnumber: data['keycardnumber'] as String?,
        status: data['status'] as bool?,
      );

  Map<String, dynamic> toMap() => {
        'keycardnumber': keycardnumber,
        'status': status,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [KeyCardModel].
  factory KeyCardModel.fromJson(String data) {
    return KeyCardModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [KeyCardModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
