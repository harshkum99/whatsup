import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:whatsup/data/chat_model.dart';
import 'package:whatsup/resources/app_colors.dart';
import 'package:whatsup/resources/app_images.dart';
import 'package:whatsup/utils/date_formatter.dart';
import 'package:whatsup/utils/time_formatter.dart';
import 'package:whatsup/utils/widgets/app_bar.dart';

import 'chat_vm.dart';

class ChatView extends StatelessWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatVM>(builder: (vm) {
      return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: MyAppBar(
          title: Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundImage: AssetImage(vm.contactPhoto!),
              ),
              const SizedBox(width: 10),
              Text(
                vm.contactName!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ).marginOnly(left: 25),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.videocam,
                color: AppColors.appWhite,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.call,
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
        body: Container(
          width: Get.width,
          height: Get.height,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(AppImages.chatBg), fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              Obx(
                () => vm.isLoading.value
                    ? const Center(child: CircularProgressIndicator())
                    : Expanded(
                        child: Container(
                        // width: Get.width,
                        child: ListView.builder(
                            controller: vm.scrollController,
                            itemCount: vm.allChatsList.length,
                            itemBuilder: (context, index) {
                              return vm.allChatsList[index].sender! == "Me" ? textSend(vm.allChatsList[index]) : textReceived(vm.allChatsList[index]);
                            }),
                      )),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: Row(children: [
                  Expanded(
                    child: SizedBox(
                      height: 60,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: TextFormField(
                          onChanged: (t) {
                            vm.update();
                          },
                          controller: vm.messageController,
                          decoration: InputDecoration(
                            hintText: 'Type a message',
                            hintStyle: TextStyle(color: AppColors.appBlack.withOpacity(0.5)),
                            contentPadding: const EdgeInsets.only(left: 20),
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.emoji_emotions_outlined,
                              color: AppColors.appBlack.withOpacity(0.5),
                            ),
                            suffixIcon: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.attach_file,
                                    color: AppColors.appBlack.withOpacity(0.5),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.camera_alt_rounded,
                                    color: AppColors.appBlack.withOpacity(0.5),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ).marginOnly(left: 5, right: 5, bottom: 5),
                    ),
                  ),
                  const SizedBox(width: 5),
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: AppColors.tealGreen,
                    child: IconButton(
                      onPressed: () {},
                      icon: vm.messageController.text.isNotEmpty
                          ? Icon(
                              Icons.send,
                              color: AppColors.appWhite,
                            )
                          : Icon(
                              Icons.mic,
                              color: AppColors.appWhite,
                            ),
                    ),
                  ).marginOnly(bottom: 5, right: 5),
                ]),
              )
            ],
          ),
        ),
      );
    });
  }
}

Widget textSend(Chat text) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          width: Get.width * 0.6,
          decoration: BoxDecoration(
            color: AppColors.msgGreen,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Text(
                text.message!,
                maxLines: 10,
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      formatTimestamp(text.timestamp!),
                      style: TextStyle(color: AppColors.appBlack.withOpacity(0.5), fontSize: 12),
                    ),
                    const SizedBox(width: 5),
                    const Icon(
                      Icons.done_all,
                      color: AppColors.tealGreen,
                      size: 17,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    ),
  ).marginSymmetric(vertical: 5, horizontal: 5);
}

Widget textReceived(Chat text) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: Get.width * 0.6,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.appWhite,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Text(
                text.message!,
                maxLines: 10,
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      formatTimestamp(text.timestamp!),
                      style: TextStyle(color: AppColors.appBlack.withOpacity(0.5), fontSize: 12),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    ),
  ).marginSymmetric(vertical: 5, horizontal: 5);
}
