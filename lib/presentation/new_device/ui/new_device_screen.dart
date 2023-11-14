import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ionicons/ionicons.dart';
import 'package:it_work/resources/extensions.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/constants_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/routes_manager.dart';
import '../../../resources/strings_manager.dart';
import '../../../resources/values_manager.dart';

class NewDeviceScreen extends StatelessWidget {
  const NewDeviceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CallbackShortcuts(
      bindings: <ShortcutActivator, VoidCallback>{
        const SingleActivator(LogicalKeyboardKey.escape): () {
          Navigator.pop(context);
        },
      },
      child: Focus(
        autofocus: true,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
            backgroundColor: ColorManager.CARD_BG_COLOR_DARK,
            elevation: 2,
            title: Text(AppStrings.newDevice,style: TextStyle(color: Theme.of(context).primaryColorDark,fontFamily: FontConstants.family,fontWeight: FontWeight.bold,fontSize: AppSize.s18),),
          ),
          backgroundColor: Theme.of(context).primaryColorLight,
          body: FadeIn(
            duration: const Duration(seconds: 1),
            child: Center(
              child: SingleChildScrollView(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s16)),
                        color: ColorManager.blueColor,
                      ),
                      height: MediaQuery.sizeOf(context).height / 3,
                      width: MediaQuery.sizeOf(context).width / 6,
                      padding: const EdgeInsets.all(AppSize.s16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Icon(Icons.computer_rounded, size: 76, color: Theme.of(context).primaryColorDark,),
                          ),
                          const SizedBox(height: AppSize.s16),
                          Text(AppStrings.computer, style: TextStyle(color: Theme.of(context).primaryColorDark, fontFamily: FontConstants.family, fontSize: AppSize.s22, fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ).ripple((){
                      AppConstants.navigate(context, RoutesManager.newComputerRoute, null);
                    },borderRadius: const BorderRadius.all(Radius.circular(AppSize.s16)),overlayColor: MaterialStateColor.resolveWith((
                        states) =>
                        Theme
                            .of(context)
                            .primaryColorDark
                            .withOpacity(0.15))),
                    const SizedBox(width: AppSize.s16,),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s16)),
                        color: ColorManager.blueColor,
                      ),
                      height: MediaQuery.sizeOf(context).height / 3,
                      width: MediaQuery.sizeOf(context).width / 6,
                      padding: const EdgeInsets.all(AppSize.s16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Icon(Icons.laptop_mac_rounded, size: 76, color: Theme.of(context).primaryColorDark,),
                          ),
                          const SizedBox(height: AppSize.s16,),
                          Text(AppStrings.laptop, style: TextStyle(color: Theme.of(context).primaryColorDark, fontFamily: FontConstants.family, fontSize: AppSize.s22, fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ).ripple((){
                      AppConstants.navigate(context, RoutesManager.newLaptopRoute, null);
                    },borderRadius: const BorderRadius.all(Radius.circular(AppSize.s16)),overlayColor: MaterialStateColor.resolveWith((
                        states) =>
                        Theme
                            .of(context)
                            .primaryColorDark
                            .withOpacity(0.15))),
                    const SizedBox(width: AppSize.s16,),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s16)),
                        color: ColorManager.blueColor,
                      ),
                      height: MediaQuery.sizeOf(context).height / 3,
                      width: MediaQuery.sizeOf(context).width / 6,
                      padding: const EdgeInsets.all(AppSize.s16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Icon(Icons.screenshot_monitor_rounded, size: 76, color: Theme.of(context).primaryColorDark,),
                          ),
                          const SizedBox(height: AppSize.s16,),
                          Text(AppStrings.screen, style: TextStyle(color: Theme.of(context).primaryColorDark, fontFamily: FontConstants.family, fontSize: AppSize.s22, fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ).ripple((){
                      AppConstants.navigate(context, RoutesManager.newPcScreenRoute, null);
                    },borderRadius: const BorderRadius.all(Radius.circular(AppSize.s16)),overlayColor: MaterialStateColor.resolveWith((
                        states) =>
                        Theme
                            .of(context)
                            .primaryColorDark
                            .withOpacity(0.15))),
                    const SizedBox(width: AppSize.s16,),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s16)),
                        color: ColorManager.blueColor,
                      ),
                      height: MediaQuery.sizeOf(context).height / 3,
                      width: MediaQuery.sizeOf(context).width / 6,
                      padding: const EdgeInsets.all(AppSize.s16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Icon(Icons.print_rounded, size: 76, color: Theme.of(context).primaryColorDark,),
                          ),
                          const SizedBox(height: AppSize.s16,),
                          Text(AppStrings.printer, style: TextStyle(color: Theme.of(context).primaryColorDark, fontFamily: FontConstants.family, fontSize: AppSize.s22, fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ).ripple((){},borderRadius: const BorderRadius.all(Radius.circular(AppSize.s16)),overlayColor: MaterialStateColor.resolveWith((
                        states) =>
                        Theme
                            .of(context)
                            .primaryColorDark
                            .withOpacity(0.15))),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
