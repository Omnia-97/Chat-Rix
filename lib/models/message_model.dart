import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  static const String collectionName = 'messages';
  String id;
  String roomId;
  String senderId;
  String senderName;
  String content;
  Timestamp timestamp;

  MessageModel({
    this.id = '',
    required this.roomId,
    required this.senderId,
    required this.senderName,
    required this.content,
    required this.timestamp,
  });

  MessageModel.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          roomId: json['roomId'],
          senderId: json['senderId'],
          senderName: json['senderName'],
          content: json['content'],
          timestamp: json['timestamp'],
        );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'roomId': roomId,
      'senderId': senderId,
      'senderName': senderName,
      'content': content,
      'timestamp': timestamp,
    };
  }
}
