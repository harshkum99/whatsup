import 'package:get/get.dart';
import 'package:whatsup/modules/chat/chat_vm.dart';
import 'package:whatsup/modules/chat_dashboard/chat_dashboard_vm.dart';

class ChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ChatVM());
  }
}

class ChatDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ChatDashboardVM());
  }
}
