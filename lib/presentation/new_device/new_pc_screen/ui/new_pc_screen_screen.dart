import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:it_work/presentation/new_device/new_pc_screen/bloc/new_pc_screen_cubit.dart';
import 'package:it_work/presentation/new_device/new_pc_screen/bloc/new_pc_screen_states.dart';
import 'package:it_work/resources/extensions.dart';
import 'package:it_work/utils/components.dart';

import '../../../../core/service/service_locator.dart';
import '../../../../resources/color_manager.dart';
import '../../../../resources/font_manager.dart';
import '../../../../resources/strings_manager.dart';
import '../../../../resources/values_manager.dart';

class NewPcMonitorScreen extends StatelessWidget {
  NewPcMonitorScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<NewPcScreenCubit>()..getAllSectors()..getAllBrands(),
      child: BlocConsumer<NewPcScreenCubit, NewPcScreenStates>(
        listener: (context, state) {
          if(state is NewPcScreenSuccessCreateScreen){
            Navigator.pop(context);
            ReusableComponents.showMToast(context, AppStrings.createScreenSuccessfully, TextStyle(color: Theme.of(context).primaryColorDark,fontFamily: FontConstants.family,fontSize: AppSize.s16), ColorManager.goldColor.withOpacity(0.3));
          }
          if(state is NewPcScreenLoadingCreateScreen){
            showDialog(context: context, barrierDismissible: true, barrierLabel: '', builder: (context) => BlurryProgressDialog(title: AppStrings.loading));
          }
          if(state is NewPcScreenErrorCreateScreen){
            Navigator.pop(context);
            ReusableComponents.showMToast(context, state.error, TextStyle(color: Theme.of(context).primaryColorDark,fontFamily: FontConstants.family,fontSize: AppSize.s16), ColorManager.goldColor.withOpacity(0.3));
          }
        },
        builder: (context, state) {
          var cubit = NewPcScreenCubit.get(context);
          return CallbackShortcuts(
            bindings: <ShortcutActivator, VoidCallback>{
              const SingleActivator(LogicalKeyboardKey.escape): () {
                Navigator.pop(context);
              },
            },
            child: Focus(
              autofocus: true,
              canRequestFocus: true,
              child: Form(
                key: formKey,
                child: Scaffold(
                  appBar: AppBar(
                    automaticallyImplyLeading: true,
                    backgroundColor: ColorManager.CARD_BG_COLOR_DARK,
                    elevation: 2,
                    title: Text(
                      AppStrings.newScreen,
                      style: TextStyle(
                          color: Theme.of(context).primaryColorDark,
                          fontFamily: FontConstants.family,
                          fontWeight: FontWeight.bold,
                          fontSize: AppSize.s18),
                    ),
                  ),
                  backgroundColor: Theme.of(context).primaryColorLight,
                  body: FadeIn(
                    duration: const Duration(seconds: 1),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(Radius.circular(AppSize.s16)),
                                border: Border.all(color: ColorManager.BORDER_COLOR_DARK),
                                color: ColorManager.CARD_BG_COLOR_DARK,
                              ),
                              width: MediaQuery.sizeOf(context).width,
                              padding: const EdgeInsets.all(AppSize.s16),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Align(
                                      alignment: Alignment.topCenter,
                                      child: Text(
                                        AppStrings.mainDetails,
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .primaryColorDark,
                                            fontFamily: FontConstants.family,
                                            fontSize: AppSize.s22,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  const SizedBox(height: AppSize.s24),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                          width: MediaQuery.sizeOf(context).width * 0.1,
                                          child: Text(
                                            AppStrings.sector,
                                            style: TextStyle(color: Theme.of(context).primaryColorDark,
                                                fontFamily: FontConstants.family,
                                                fontSize: AppSize.s20,
                                                fontWeight: FontWeight.w400),
                                          )),
                                      const SizedBox(width: AppSize.s16),
                                      Expanded(child: GetSectorsComponent(fromRoute: "New Pc Monitor", cubit: cubit)),
                                      const SizedBox(width: AppSize.s16),
                                      SizedBox(
                                          width: MediaQuery.sizeOf(context).width * 0.1,
                                          child: Text(
                                            AppStrings.department,
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .primaryColorDark,
                                                fontFamily:
                                                    FontConstants.family,
                                                fontSize: AppSize.s20,
                                                fontWeight: FontWeight.w400),
                                          )),
                                      const SizedBox(width: AppSize.s16),
                                      Expanded(
                                          child: GetDepartmentsComponent(
                                              fromRoute: "New Pc Monitor",
                                              cubit: cubit)),
                                      const SizedBox(width: AppSize.s16),
                                      SizedBox(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.1,
                                          child: Text(
                                            AppStrings.area,
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .primaryColorDark,
                                                fontFamily:
                                                    FontConstants.family,
                                                fontSize: AppSize.s20,
                                                fontWeight: FontWeight.w400),
                                          )),
                                      const SizedBox(width: AppSize.s16),
                                      Expanded(child: GetAreasComponent(fromRoute: "New Pc Monitor", cubit: cubit)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: AppSize.s16),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(AppSize.s16)),
                                border: Border.all(
                                    color: ColorManager.BORDER_COLOR_DARK),
                                color: ColorManager.CARD_BG_COLOR_DARK,
                              ),
                              width: MediaQuery.sizeOf(context).width,
                              padding: const EdgeInsets.all(AppSize.s16),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Align(
                                      alignment: Alignment.topCenter,
                                      child: Text(
                                        AppStrings.deviceInformation,
                                        style: TextStyle(
                                            color: Theme.of(context).primaryColorDark,
                                            fontFamily: FontConstants.family,
                                            fontSize: AppSize.s22,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  const SizedBox(height: AppSize.s24),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                          width: MediaQuery.sizeOf(context).width * 0.1,
                                          child: Text(
                                            AppStrings.screenBrand,
                                            style: TextStyle(
                                                color: Theme.of(context).primaryColorDark,
                                                fontFamily: FontConstants.family,
                                                fontSize: AppSize.s20,
                                                fontWeight: FontWeight.w400),
                                          )),
                                      const SizedBox(width: AppSize.s16),
                                      Expanded(child: GetScreenBrandComponent(fromRoute: "New Pc Monitor", cubit: cubit)),
                                      const SizedBox(width: AppSize.s16),
                                      SizedBox(
                                          width: MediaQuery.sizeOf(context).width * 0.1,
                                          child: Text(
                                            AppStrings.screenSize,
                                            style: TextStyle(
                                                color: Theme.of(context).primaryColorDark,
                                                fontFamily: FontConstants.family,
                                                fontSize: AppSize.s20,
                                                fontWeight: FontWeight.w400),
                                          )),
                                      const SizedBox(width: AppSize.s16),
                                      Expanded(child: GetScreenSizeComponent(fromRoute: "New Pc Monitor", cubit: cubit)),
                                      const SizedBox(width: AppSize.s16),
                                      const Spacer(),
                                      Row(
                                        children: [
                                          Checkbox(
                                            value: cubit.isScreenCurved,
                                            activeColor: Theme.of(context).primaryColorDark,
                                            checkColor: ColorManager.blueColor,
                                            onChanged: (bool? value) async {
                                              cubit.changeCurved(value!);
                                            },
                                          ),
                                          const SizedBox(width: AppSize.s16),
                                          Text(
                                            AppStrings.isCurved,
                                            style: TextStyle(
                                                color: Theme.of(context).primaryColorDark,
                                                fontFamily: FontConstants.family,
                                                fontSize: AppSize.s20,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: AppSize.s1,
                                    width: MediaQuery.sizeOf(context).width,
                                    color: Theme.of(context).splashColor,
                                    margin: const EdgeInsets.symmetric(
                                        vertical: AppSize.s24),
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                          width: MediaQuery.sizeOf(context).width * 0.1,
                                          child: Text(
                                            AppStrings.serialNumber,
                                            style: TextStyle(
                                                color: Theme.of(context).primaryColorDark,
                                                fontFamily:
                                                FontConstants.family,
                                                fontSize: AppSize.s20,
                                                fontWeight: FontWeight.w400),
                                          )),
                                      const SizedBox(width: AppSize.s16),
                                      Expanded(
                                          child: ReusableComponents.registerTextField(
                                            context: context,
                                            background: Colors.transparent,
                                            textInputType: TextInputType.text,
                                            hintText: AppStrings.serialNumber,
                                            textInputAction: TextInputAction.next,
                                            borderColor:
                                            Theme.of(context).primaryColorDark,
                                            controller: cubit.serialNumberController,
                                            validate: (value) {
                                              if (value!.isEmpty) {
                                                return AppStrings.serialRequired;
                                              }
                                            },
                                            onChanged: (String? value) {},
                                          )),
                                      const SizedBox(width: AppSize.s16),
                                      SizedBox(
                                          width: MediaQuery.sizeOf(context).width * 0.1,
                                          child: Text(
                                            AppStrings.notes,
                                            style: TextStyle(
                                                color: Theme.of(context).primaryColorDark,
                                                fontFamily:
                                                FontConstants.family,
                                                fontSize: AppSize.s20,
                                                fontWeight: FontWeight.w400),
                                          )),
                                      const SizedBox(width: AppSize.s16),
                                      Expanded(
                                          child: ReusableComponents
                                              .registerTextField(
                                            context: context,
                                            background: Colors.transparent,
                                            textInputType: TextInputType.text,
                                            hintText: AppStrings.notes,
                                            textInputAction: TextInputAction.next,
                                            borderColor:
                                            Theme.of(context).primaryColorDark,
                                            controller: cubit.notesController,
                                            validate: (value) {},
                                            onChanged: (String? value) {},
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: AppSize.s16),
                            Align(
                                alignment: Alignment.bottomLeft,
                                child: MouseRegion(
                                  cursor: MaterialStateMouseCursor.clickable,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: AppSize.s16,
                                        vertical: AppSize.s8),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(AppSize.s8),
                                      color: Colors.transparent,
                                      border: Border.all(
                                          color: Theme.of(context)
                                              .primaryColorDark,
                                          width: AppSize.s1),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(
                                          Icons.done,
                                          color: Theme.of(context)
                                              .primaryColorDark,
                                        ),
                                        const SizedBox(width: AppSize.s8),
                                        Text(
                                          AppStrings.createDevice,
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .primaryColorDark,
                                              fontFamily: FontConstants.family,
                                              fontSize: AppSize.s20,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ),
                                ).ripple(() {
                                  if(cubit.checkValidation() == AppStrings.validationSuccess){
                                    cubit.addDevice();
                                  }else{
                                    ReusableComponents.showMToast(context, cubit.checkValidation(), TextStyle(
                                        color: Theme.of(context).primaryColorDark,
                                        fontFamily: FontConstants.family,
                                        fontSize: AppSize.s20,
                                        fontWeight: FontWeight.w400), Colors.red.shade600);
                                  }
                                },
                                    borderRadius: BorderRadius.circular(AppSize.s8),
                                    overlayColor: MaterialStateColor.resolveWith((states) => Theme.of(context).primaryColorDark.withOpacity(AppSize.s0_2))),)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
