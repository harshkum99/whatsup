import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsup/modules/chat_dashboard/chat_dashboard_vm.dart';
import 'package:whatsup/resources/app_colors.dart';
import 'package:whatsup/utils/date_formatter.dart';

class ContactCardView extends StatelessWidget {
  final index;
  const ContactCardView({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatDashboardVM>(builder: (vm) {
      return Container(
          margin: const EdgeInsets.all(10),
          height: 70,
          width: Get.width,
          color: AppColors.appWhite,
          child: Row(
            children: [
              CircleAvatar(
                radius: 22.5,
                backgroundImage: AssetImage(vm.allChatsList[index].photo!),
              ),
              const SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: Get.width * 0.8,
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                      Text(
                        vm.allChatsList[index].name!,
                        style: const TextStyle(
                          color: AppColors.appBlack,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        toDisplayDate(vm.allChatsList[index].timestamp!),
                        style: TextStyle(
                          color: AppColors.appBlack.withOpacity(0.6),
                          fontSize: 13,
                        ),
                      ),
                    ]),
                  ),
                  Text(
                    vm.allChatsList[index].lastMsg!.length < 42 ? vm.allChatsList[index].lastMsg! : "${vm.allChatsList[index].lastMsg!.substring(0, 42)}..",
                    style: TextStyle(
                      color: AppColors.appBlack.withOpacity(0.6),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ));
    });
  }
}
