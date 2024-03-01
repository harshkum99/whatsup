import 'package:get/get.dart';
import 'package:whatsup/modules/chat/chat_view.dart';
import 'package:whatsup/modules/chat_dashboard/chat_dashboard_view.dart';
import 'package:whatsup/utils/bindings.dart';

class AppRoutes {
  const AppRoutes._();

  static const chatDashboard = "/allChats";
  static const chat = "/chat";

  static List<GetPage<dynamic>> getPages() {
    return [
      GetPage(name: AppRoutes.chat, page: () => const ChatView(), binding: ChatBinding()),
      GetPage(name: AppRoutes.chatDashboard, page: () => const ChatDashboardView(), binding: ChatDashboardBinding()),
    ];
  }
}
