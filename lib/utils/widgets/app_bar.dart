import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:whatsup/resources/app_colors.dart';

final appbarHeight = Get.height * 0.08;

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  Widget? title;
  Color? appbarColor;
  Color? titleColor;
  bool withTr;
  bool withBack;
  Function? customCallback;
  List<Widget>? actions;
  Widget? flexibleSpace;

  MyAppBar({Key? key, this.title, this.flexibleSpace, this.appbarColor = AppColors.tealGreen, this.actions, this.customCallback, this.titleColor = Colors.white, this.withBack = true, this.withTr = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: appbarColor,
        leading: withBack
            ? IconButton(
                onPressed: () {
                  if (customCallback != null) {
                    customCallback!();
                  } else {
                    Navigator.pop(context);
                  }
                },
                icon: const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: AppColors.appWhite,
                  ),
                ),
                color: titleColor,
              )
            : const SizedBox.shrink(),
        title: title,
        //title: AppText(_getTitle() as Text, style: AppTextStyles.txtRobotoRegular18.copyWith(fontWeight: FontWeight.bold, color: titleColor)),
        elevation: 0,
        centerTitle: false,
        actions: actions,
        titleSpacing: -35,
        flexibleSpace: flexibleSpace,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ));
  }

  // String _getTitle() {
  //   /*if(title==null||title.isEmpty)
  //     return "";
  //   else if(withTr)
  //     return title.tr;
  //   else*/
  //   return title;
  // }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(appbarHeight);
}
