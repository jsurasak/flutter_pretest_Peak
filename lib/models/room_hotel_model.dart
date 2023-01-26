import 'dart:convert';

class RoomHotelModel {
  String? floor;
  String? room;
  String? customerName;
  String? customerAge;
  bool? status;
  String? keyCardNumber;

  RoomHotelModel({
    this.floor,
    this.room,
    this.customerName,
    this.customerAge,
    this.status,
    this.keyCardNumber,
  });

  factory RoomHotelModel.fromMap(Map<String, dynamic> data) {
    return RoomHotelModel(
      floor: data['floor'] as String?,
      room: data['room'] as String?,
      customerName: data['customerName'] as String?,
      customerAge: data['customerAge'] as String?,
      status: data['status'] as bool?,
      keyCardNumber: data['keyCardNumber'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'floor': floor,
        'room': room,
        'customerName': customerName,
        'customerAge': customerAge,
        'status': status,
        'keyCardNumber': keyCardNumber,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [RoomHotelModel].
  factory RoomHotelModel.fromJson(String data) {
    return RoomHotelModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [RoomHotelModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
