// To parse this JSON data, do
//
//     final chatListModel = chatListModelFromJson(jsonString);

import 'dart:convert';

ChatListModel chatListModelFromJson(String str) => ChatListModel.fromJson(json.decode(str));

String chatListModelToJson(ChatListModel data) => json.encode(data.toJson());

class ChatListModel {
  List<Chat>? chat;

  ChatListModel({
    this.chat,
  });

  factory ChatListModel.fromJson(Map<String, dynamic> json) => ChatListModel(
        chat: json["chat"] == null ? [] : List<Chat>.from(json["chat"]!.map((x) => Chat.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "chat": chat == null ? [] : List<dynamic>.from(chat!.map((x) => x.toJson())),
      };
}

class Chat {
  String? photo;
  String? name;
  String? lastMsg;
  String? timestamp;

  Chat({
    this.photo,
    this.name,
    this.lastMsg,
    this.timestamp,
  });

  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
        photo: json["photo"],
        name: json["name"],
        lastMsg: json["last_msg"],
        timestamp: json["timestamp"],
      );

  Map<String, dynamic> toJson() => {
        "photo": photo,
        "name": name,
        "last_msg": lastMsg,
        "timestamp": timestamp,
      };
}
