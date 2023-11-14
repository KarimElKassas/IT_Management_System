import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ionicons/ionicons.dart';
import 'package:it_work/resources/extensions.dart';
import '../../../core/service/service_locator.dart';
import '../../../resources/asset_manager.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/constants_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/routes_manager.dart';
import '../../../resources/strings_manager.dart';
import '../../../resources/values_manager.dart';
import '../../../utils/components.dart';
import '../bloc/home_cubit.dart';
import '../bloc/home_states.dart';
import 'dart:ui' as ui;

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeCubit>()..getAllSectors(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {
          if(state is HomeGetDepartmentsError){
            print("ERROR Departments STATE : ${state.error}");
          }
          if(state is HomeGetSectorsError){
            print("ERROR Sectors STATE : ${state.error}");
          }
        },
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          return Scaffold(
            backgroundColor: Theme.of(context).primaryColorLight,
            body: FadeIn(
              duration: const Duration(seconds: 2),
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
                                child: SvgPicture.asset(
                                  ImageAsset.repairSvg,
                                  alignment: Alignment.center,
                                ),
                              ),
                              const SizedBox(height: AppSize.s16),
                              Text(AppStrings.repairDepartment, style: TextStyle(color: Theme.of(context).primaryColorDark, fontFamily: FontConstants.family, fontSize: AppSize.s22, fontWeight: FontWeight.bold),)
                            ],
                          ),
                        ).ripple((){
                          AppConstants.navigate(context, RoutesManager.repairHomeRoute, null);
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
                                child: SvgPicture.asset(
                                  ImageAsset.networkSvg,
                                  alignment: Alignment.center,
                                ),
                              ),
                              const SizedBox(height: AppSize.s16,),
                              Text(AppStrings.networkDepartment, style: TextStyle(color: Theme.of(context).primaryColorDark, fontFamily: FontConstants.family, fontSize: AppSize.s22, fontWeight: FontWeight.bold),)
                            ],
                          ),
                        ).ripple((){},borderRadius: const BorderRadius.all(Radius.circular(AppSize.s16)),overlayColor: MaterialStateColor.resolveWith((
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
                              child: SvgPicture.asset(
                                ImageAsset.programmingSvg,
                                alignment: Alignment.center,
                              ),
                            ),
                            const SizedBox(height: AppSize.s16,),
                            Text(AppStrings.programmingDepartment, style: TextStyle(color: Theme.of(context).primaryColorDark, fontFamily: FontConstants.family, fontSize: AppSize.s22, fontWeight: FontWeight.bold),)
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
          );
        },
      ),
    );
  }
  Widget alterExitDialog(BuildContext context, HomeCubit cubit) {
    bool isClosing = false;

    return Directionality(
      textDirection:
      AppConstants.isArabic() ? ui.TextDirection.rtl : ui.TextDirection.ltr,
      child: AlertDialog(
        // <-- SEE HERE
          title: Text(
            AppStrings.warning.tr(),
            style: TextStyle(
                color: Theme
                    .of(context)
                    .primaryColorDark,
                fontSize: AppSize.s16,
                fontWeight: FontWeightManager.bold,
                fontFamily: FontConstants.family),
          ),
          backgroundColor: Theme
              .of(context)
              .splashColor,
          titlePadding: const EdgeInsets.only(
              top: AppSize.s12, left: AppSize.s12, right: AppSize.s12),
          contentPadding: const EdgeInsets.all(AppSize.s12),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  AppStrings.areYouSureExit.tr(),
                  style: TextStyle(
                      color: Theme
                          .of(context)
                          .primaryColorDark,
                      fontSize: AppSize.s14,
                      fontWeight: FontWeightManager.bold,
                      fontFamily: FontConstants.family),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                cubit.logOut();
                AppConstants.finish(context, RoutesManager.loginRoute);
              },
              style: ButtonStyle(
                  overlayColor: MaterialStateColor.resolveWith(
                          (states) => ColorManager.goldColor.withOpacity(0.4))),
              child: Text(
                AppStrings.ok.tr(),
                style: TextStyle(
                    fontSize: AppSize.s14,
                    fontFamily: FontConstants.family,
                    fontWeight: FontWeightManager.heavy,
                    color: Theme
                        .of(context)
                        .primaryColorDark),
                maxLines: AppSize.s1.toInt(),
              ),
            ),
            TextButton(
              onPressed: () {
                if (!isClosing) {
                  isClosing = true;
                  Navigator.of(context).pop();
                }
              },
              style: ButtonStyle(
                  overlayColor: MaterialStateColor.resolveWith(
                          (states) => ColorManager.goldColor.withOpacity(0.4))),
              child: Text(
                AppStrings.cancel.tr(),
                style: TextStyle(
                    fontSize: AppSize.s14,
                    fontFamily: FontConstants.family,
                    fontWeight: FontWeightManager.heavy,
                    color: Theme
                        .of(context)
                        .primaryColorDark),
                maxLines: AppSize.s1.toInt(),
              ),
            ),
          ],
          buttonPadding: const EdgeInsets.all(AppSize.s10)),
    );
  }
}
