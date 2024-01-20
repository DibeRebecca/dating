// To parse this JSON data, do
//
//     final message = messageFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class Message {
  Message({
    required this.id,
    required this.text,
    required this.self,
    required this.sentTime,
    required this.sentDate,
    required this.readStatut,
    required this.receiveStatut,
    required this.senderId,
    required this.receiverId,
  });

  final String id;
  final String text;
  final bool self;
  final String sentTime;
  final String sentDate;
  final bool readStatut;
  final bool receiveStatut;
  final String senderId;
  final String receiverId;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    id: json["id"],
    text: json["text"],
    self: json["self"],
    sentTime: json["sent_time"],
    sentDate: json["sent_date"],
    readStatut: json["read_statut"],
    receiveStatut: json["receive_statut"],
    senderId: json["sender_id"],
    receiverId: json["receiver_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "text": text,
    "self": self,
    "sent_time": sentTime,
    "sent_date": sentDate,
    "read_statut": readStatut,
    "receive_statut": receiveStatut,
    "sender_id": senderId,
    "receiver_id": receiverId,
  };

  static List<Message> messageFromJson(String str) => List<Message>.from(json.decode(str).map((x) => Message.fromJson(x)));

  static String messageToJson(List<Message> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
}
