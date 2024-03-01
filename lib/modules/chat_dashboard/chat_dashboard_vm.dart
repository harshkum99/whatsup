import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:whatsup/data/chat_list_model.dart';

class ChatDashboardVM extends GetxController {
  final allChatsList = <Chat>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() async {
    super.onInit();
    getChatListFromJson();
  }

  void getChatListFromJson() async {
    isLoading(true);
    final jsonString = await rootBundle.loadString('lib/data/local/chat_dashboard_list.json');
    final jsonData = json.decode(jsonString);
    final chatListModel = ChatListModel.fromJson(jsonData);
    allChatsList.value = chatListModel.chat!;
    isLoading(false);
  }
}
