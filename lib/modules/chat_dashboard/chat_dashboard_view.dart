import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:whatsup/modules/chat_dashboard/chat_dashboard_vm.dart';
import 'package:whatsup/modules/chat_dashboard/local_widgets/card_view.dart';
import 'package:whatsup/resources/app_colors.dart';
import 'package:whatsup/resources/app_routes.dart';
import 'package:whatsup/resources/app_styles.dart';
import 'package:whatsup/utils/widgets/app_bar.dart';

class ChatDashboardView extends StatelessWidget {
  const ChatDashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatDashboardVM>(builder: (vm) {
      return Scaffold(
          appBar: MyAppBar(
            title: Text(
              'WhatsUp',
              style: AppStyles.interBoldStyle(
                color: AppColors.appWhite,
                fontSize: 20,
              ),
            ),
            withBack: false,
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.camera_alt_outlined,
                  color: AppColors.appWhite,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: AppColors.appWhite,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_vert,
                  color: AppColors.appWhite,
                ),
              ),
            ],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: Get.width,
                color: AppColors.tealGreen,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IntrinsicWidth(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.groups_2,
                            color: AppColors.appWhite.withOpacity(0.7),
                          ),
                          Divider(
                            height: 1.0,
                            thickness: 2.0,
                            color: Colors.transparent,
                          )
                        ],
                      ),
                    ),
                    IntrinsicWidth(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '    Chats    ',
                            style: AppStyles.interSemiBoldStyle(color: AppColors.appWhite),
                          ),
                          Divider(
                            height: 1.0,
                            thickness: 2.0,
                            color: AppColors.appWhite,
                          )
                        ],
                      ),
                    ),
                    IntrinsicWidth(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '    Updates    ',
                            style: AppStyles.interSemiBoldStyle(
                              color: AppColors.appWhite.withOpacity(0.7),
                            ),
                          ),
                          Divider(
                            height: 1.0,
                            thickness: 2.0,
                            color: Colors.transparent,
                          )
                        ],
                      ),
                    ),
                    IntrinsicWidth(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '    Calls    ',
                            style: AppStyles.interSemiBoldStyle(
                              color: AppColors.appWhite.withOpacity(0.7),
                            ),
                          ),
                          Divider(
                            height: 1.0,
                            thickness: 2.0,
                            color: Colors.transparent,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Obx(
                () => SizedBox(
                  height: Get.height - Get.height * 0.08 - 49,
                  child: vm.isLoading.value
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          itemCount: vm.allChatsList.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Get.toNamed(AppRoutes.chat, arguments: {
                                  'name': vm.allChatsList[index].name,
                                  'photo': vm.allChatsList[index].photo,
                                  'chat_index': index,
                                });
                              },
                              child: SizedBox(
                                height: 70,
                                width: Get.width,
                                child: ContactCardView(index: index),
                              ),
                            );
                          }),
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            backgroundColor: AppColors.tealGreen,
            child: const Icon(
              Icons.message,
              color: AppColors.appWhite,
            ),
          ));
    });
  }
}
