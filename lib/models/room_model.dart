class RoomModel {
  static const String collectionName = 'rooms';
  String id;
  String userId;
  String roomName;
  String roomDescription;
  String roomCategoryId;
  List<String> participantIds;
  RoomModel({
    this.id = "",
    required this.userId,
    required this.roomName,
    required this.roomDescription,
    required this.roomCategoryId,
    required this.participantIds,
  });
  RoomModel.fromJson(Map<String, dynamic> json)
      : this(
    id: json['id'] ?? '',
    userId: json['userId'] ?? '',
    roomName: json['roomName'] ?? '',
    roomDescription: json['roomDescription'] ?? '',
    roomCategoryId: json['roomCategoryId'] ?? '',
    participantIds: List<String>.from(json['participantIds'] ?? []),
  );


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'roomName': roomName,
      'roomDescription': roomDescription,
      'roomCategoryId': roomCategoryId,
      'participantIds': participantIds,
    };
  }
}
