import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:whatsup/data/chat_model.dart';

class ChatVM extends GetxController {
  final allChatsList = <Chat>[].obs;
  final isLoading = false.obs;
  final contactName = Get.arguments['name'];
  final contactPhoto = Get.arguments['photo'];
  final chatIndex = Get.arguments['chat_index'];
  TextEditingController messageController = TextEditingController();
  ScrollController scrollController = ScrollController();

  List<int> list1 = [
    0,
    3,
    6,
    9,
    12,
    15
  ];
  List<int> list2 = [
    1,
    4,
    7,
    10,
    13,
    16
  ];

  @override
  void onInit() async {
    super.onInit();
    getChatsFromJson();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
      update();
    });
  }

  void getChatsFromJson() async {
    isLoading(true);

    if (list1.contains(chatIndex)) {
      final jsonString = await rootBundle.loadString('lib/data/local/chat_list1.json');
      final jsonData = json.decode(jsonString);
      final chatListModel = ChatModel.fromJson(jsonData);
      allChatsList.value = chatListModel.chat!;
    } else if (list2.contains(chatIndex)) {
      final jsonString = await rootBundle.loadString('lib/data/local/chat_list2.json');
      final jsonData = json.decode(jsonString);
      final chatListModel = ChatModel.fromJson(jsonData);
      allChatsList.value = chatListModel.chat!;
    } else {
      final jsonString = await rootBundle.loadString('lib/data/local/chat_list3.json');
      final jsonData = json.decode(jsonString);
      final chatListModel = ChatModel.fromJson(jsonData);
      allChatsList.value = chatListModel.chat!;
    }

    isLoading(false);
  }
}
