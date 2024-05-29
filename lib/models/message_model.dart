import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  static const String collectionName = 'messages';
  String id;
  String roomId;
  String senderId;
  String senderName;
  String content;
  int dateTime;

  MessageModel({
    this.id = '',
    required this.roomId,
    required this.senderId,
    required this.senderName,
    required this.content,
    required this.dateTime,
  });

  MessageModel.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          roomId: json['roomId'],
          senderId: json['senderId'],
          senderName: json['senderName'],
          content: json['content'],
          dateTime: json['dateTime'],
        );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'roomId': roomId,
      'senderId': senderId,
      'senderName': senderName,
      'content': content,
      'dateTime': dateTime,
    };
  }
}
