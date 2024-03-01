// To parse this JSON data, do
//
//     final chatModel = chatModelFromJson(jsonString);

import 'dart:convert';

ChatModel chatModelFromJson(String str) => ChatModel.fromJson(json.decode(str));

String chatModelToJson(ChatModel data) => json.encode(data.toJson());

class ChatModel {
  List<Chat>? chat;

  ChatModel({
    this.chat,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
        chat: json["chat"] == null ? [] : List<Chat>.from(json["chat"]!.map((x) => Chat.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "chat": chat == null ? [] : List<dynamic>.from(chat!.map((x) => x.toJson())),
      };
}

class Chat {
  String? sender;
  String? message;
  String? timestamp;

  Chat({
    this.sender,
    this.message,
    this.timestamp,
  });

  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
        sender: json["sender"],
        message: json["message"],
        timestamp: json["timestamp"],
      );

  Map<String, dynamic> toJson() => {
        "sender": sender,
        "message": message,
        "timestamp": timestamp,
      };
}
