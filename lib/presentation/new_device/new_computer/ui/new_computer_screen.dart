import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:it_work/presentation/new_device/new_computer/bloc/new_computer_cubit.dart';
import 'package:it_work/presentation/new_device/new_computer/bloc/new_computer_states.dart';
import 'package:it_work/presentation/new_device/new_computer/ui/new_computer_dialog.dart';
import 'package:it_work/resources/constants_manager.dart';
import 'package:it_work/resources/extensions.dart';
import 'package:it_work/utils/components.dart';
import '../../../../core/service/service_locator.dart';
import '../../../../resources/color_manager.dart';
import '../../../../resources/font_manager.dart';
import '../../../../resources/strings_manager.dart';
import '../../../../resources/values_manager.dart';
import '../../../../utils/constant.dart';

class NewComputerScreen extends StatelessWidget {
  NewComputerScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<NewComputerCubit>()
        ..getAllSectors()
        ..getAllProcessorBrands()
        ..getProcessorGens()
        ..getAllGraphicBrands()
        ..getAllRamTypes()
        ..getAllHardTypes()
        ..getAllPcModels(),
      child: BlocConsumer<NewComputerCubit, NewComputerStates>(
        listener: (context, state) {
          if (state is NewComputerSuccessCreateDevice) {
            Navigator.pop(context);
            ReusableComponents.showMToast(
                context,
                AppStrings.createDeviceSuccessfully,
                TextStyle(
                    color: Theme.of(context).primaryColorDark,
                    fontFamily: FontConstants.family,
                    fontSize: AppSize.s16),
                ColorManager.goldColor.withOpacity(0.3));
          }
          if (state is NewComputerLoadingCreateDevice) {
            showDialog(
                context: context,
                barrierDismissible: true,
                barrierLabel: '',
                builder: (context) =>
                    BlurryProgressDialog(title: AppStrings.loading));
          }
          if (state is NewComputerErrorCreateDevice) {
            Navigator.pop(context);
            ReusableComponents.showMToast(
                context,
                state.error,
                TextStyle(
                    color: Theme.of(context).primaryColorDark,
                    fontFamily: FontConstants.family,
                    fontSize: AppSize.s16),
                ColorManager.goldColor.withOpacity(0.3));
          }
        },
        builder: (context, state) {
          final GlobalKey<ScaffoldState> _key = GlobalKey();
          var cubit = NewComputerCubit.get(context);
          return CallbackShortcuts(
            bindings: <ShortcutActivator, VoidCallback>{
              const SingleActivator(LogicalKeyboardKey.escape): () {
                Navigator.pop(context);
              },
            },
            child: Focus(
              autofocus: true,
              child: Form(
                key: formKey,
                child: Scaffold(
                  key: _key,
                  drawer: Drawer(
                    child: ListView(
                      children: [
                        InkWell(
                          onTap: () {
                            showDialog(context: context, builder: (_) => NewComputerDialog(option: AppStrings.newSector, cubit: cubit));
                          },
                          child: ListTile(
                            title: Text(
                              AppStrings.newSector,
                              style: TextStyle(
                                color: ColorManager.CARD_BG_COLOR_DARK,
                                fontFamily: FontConstants.family,
                                fontSize: AppSize.s16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const Divider(),
                        InkWell(
                          onTap: () {
                            showDialog(context: context, builder: (_) => NewComputerDialog(option: AppStrings.newDepartment, cubit: cubit));
                          },
                          child: ListTile(
                            title: Text(
                              AppStrings.newDepartment,
                              style: TextStyle(
                                color: ColorManager.CARD_BG_COLOR_DARK,
                                fontFamily: FontConstants.family,
                                fontSize: AppSize.s16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const Divider(),
                        InkWell(
                          onTap: (){
                            showDialog(context: context, builder: (_) => NewComputerDialog(option: AppStrings.newArea, cubit: cubit));
                          },
                          child: ListTile(
                            title: Text(
                              AppStrings.newArea,
                              style: TextStyle(
                                color: ColorManager.CARD_BG_COLOR_DARK,
                                fontFamily: FontConstants.family,
                                fontSize: AppSize.s16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const Divider(),
                        InkWell(
                          onTap: () {
                            showDialog(context: context, builder: (_) => NewComputerDialog(option: AppStrings.newProcessorBrand, cubit: cubit));
                          },
                          child: ListTile(
                            title: Text(
                              AppStrings.newProcessorBrand,
                              style: TextStyle(
                                color: ColorManager.CARD_BG_COLOR_DARK,
                                fontFamily: FontConstants.family,
                                fontSize: AppSize.s16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const Divider(),
                        InkWell(
                          onTap: () {
                            showDialog(context: context, builder: (_) => NewComputerDialog(option: AppStrings.newProcessorModel, cubit: cubit));
                          },
                          child: ListTile(
                            title: Text(
                              AppStrings.newProcessorModel,
                              style: TextStyle(
                                color: ColorManager.CARD_BG_COLOR_DARK,
                                fontFamily: FontConstants.family,
                                fontSize: AppSize.s16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const Divider(),
                        InkWell(
                          onTap: () {
                            showDialog(context: context, builder: (_) => NewComputerDialog(option: AppStrings.newProcessorGen, cubit: cubit));
                          },
                          child: ListTile(
                            title: Text(
                              AppStrings.newProcessorGen,
                              style: TextStyle(
                                color: ColorManager.CARD_BG_COLOR_DARK,
                                fontFamily: FontConstants.family,
                                fontSize: AppSize.s16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const Divider(),
                        InkWell(
                          child: ListTile(
                            title: Text(
                              AppStrings.newGraphicCardBrand,
                              style: TextStyle(
                                color: ColorManager.CARD_BG_COLOR_DARK,
                                fontFamily: FontConstants.family,
                                fontSize: AppSize.s16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const Divider(),
                        InkWell(
                          child: ListTile(
                            title: Text(
                              AppStrings.newGraphicCardModel,
                              style: TextStyle(
                                color: ColorManager.CARD_BG_COLOR_DARK,
                                fontFamily: FontConstants.family,
                                fontSize: AppSize.s16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const Divider(),
                        InkWell(
                          child: ListTile(
                            title: Text(
                              AppStrings.newGraphicCardSize,
                              style: TextStyle(
                                color: ColorManager.CARD_BG_COLOR_DARK,
                                fontFamily: FontConstants.family,
                                fontSize: AppSize.s16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const Divider(),
                        InkWell(
                          child: ListTile(
                            title: Text(
                              AppStrings.newRamType,
                              style: TextStyle(
                                color: ColorManager.CARD_BG_COLOR_DARK,
                                fontFamily: FontConstants.family,
                                fontSize: AppSize.s16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const Divider(),
                        InkWell(
                          child: ListTile(
                            title: Text(
                              AppStrings.newRamSize,
                              style: TextStyle(
                                color: ColorManager.CARD_BG_COLOR_DARK,
                                fontFamily: FontConstants.family,
                                fontSize: AppSize.s16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const Divider(),
                        InkWell(
                          child: ListTile(
                            title: Text(
                              AppStrings.newDeviceModel,
                              style: TextStyle(
                                color: ColorManager.CARD_BG_COLOR_DARK,
                                fontFamily: FontConstants.family,
                                fontSize: AppSize.s16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const Divider(),
                        InkWell(
                          child: ListTile(
                            title: Text(
                              AppStrings.newPrimaryHardDriveType,
                              style: TextStyle(
                                color: ColorManager.CARD_BG_COLOR_DARK,
                                fontFamily: FontConstants.family,
                                fontSize: AppSize.s16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const Divider(),
                        InkWell(
                          child: ListTile(
                            title: Text(
                              AppStrings.newPrimaryHardDriveSize,
                              style: TextStyle(
                                color: ColorManager.CARD_BG_COLOR_DARK,
                                fontFamily: FontConstants.family,
                                fontSize: AppSize.s16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  appBar: AppBar(
                    backgroundColor: ColorManager.CARD_BG_COLOR_DARK,
                    elevation: 2,
                    title: Text(
                      AppStrings.newComputer,
                      style: TextStyle(
                          color: Theme.of(context).primaryColorDark,
                          fontFamily: FontConstants.family,
                          fontWeight: FontWeight.bold,
                          fontSize: AppSize.s18),
                    ),
                    leading: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Constants.currentLocale == 'ar'
                          ? const Icon(Icons.arrow_back)
                          : const Icon(Icons.arrow_forward),
                    ),
                    actions: [
                      GestureDetector(
                        onTap: () {
                          _key.currentState!.openDrawer();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: ShapeDecoration(
                                shape: const StadiumBorder(),
                                color: Theme.of(context).primaryColorDark,
                                shadows: const [
                                  BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 6,
                                    spreadRadius: 1,
                                    offset: Offset(0, 3),
                                  ),
                                ]),
                            width: AppSize.s15Width,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  AppStrings.add,
                                  style: TextStyle(
                                      color: ColorManager.CARD_BG_COLOR_DARK,
                                      fontFamily: FontConstants.family,
                                      fontWeight: FontWeight.bold,
                                      fontSize: AppSize.s18),
                                ),
                                const Spacer(),
                                Icon(
                                  Icons.add,
                                  color: ColorManager.CARD_BG_COLOR_DARK,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.1,
                                          child: Text(
                                            AppStrings.sector,
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
                                          child: GetSectorsComponent(
                                              fromRoute: "New Computer",
                                              cubit: cubit)),
                                      const SizedBox(width: AppSize.s16),
                                      SizedBox(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.1,
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
                                              fromRoute: "New Computer",
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
                                      Expanded(
                                          child: GetAreasComponent(
                                              fromRoute: "New Computer",
                                              cubit: cubit)),
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
                                            color: Theme.of(context)
                                                .primaryColorDark,
                                            fontFamily: FontConstants.family,
                                            fontSize: AppSize.s22,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  const SizedBox(height: AppSize.s24),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.1,
                                          child: Text(
                                            AppStrings.processorBrand,
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
                                          child: GetProcessorBrandComponent(
                                              fromRoute: "New Computer",
                                              cubit: cubit)),
                                      const SizedBox(width: AppSize.s16),
                                      SizedBox(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.1,
                                          child: Text(
                                            AppStrings.processorModel,
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
                                          child: GetProcessorModelComponent(
                                              fromRoute: "New Computer",
                                              cubit: cubit)),
                                      const SizedBox(width: AppSize.s16),
                                      SizedBox(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.1,
                                          child: Text(
                                            AppStrings.processorGen,
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
                                          child: GetProcessorGenComponent(
                                              fromRoute: "New Computer",
                                              cubit: cubit)),
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
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.1,
                                          child: Text(
                                            AppStrings.graphicCardBrand,
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
                                          child: GetGraphicBrandComponent(
                                              fromRoute: "New Computer",
                                              cubit: cubit)),
                                      const SizedBox(width: AppSize.s16),
                                      SizedBox(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.1,
                                          child: Text(
                                            AppStrings.graphicCardModel,
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
                                          child: GetGraphicModelComponent(
                                              fromRoute: "New Computer",
                                              cubit: cubit)),
                                      const SizedBox(width: AppSize.s16),
                                      SizedBox(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.1,
                                          child: Text(
                                            AppStrings.graphicCardSize,
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
                                          child: GetGraphicSizeComponent(
                                              fromRoute: "New Computer",
                                              cubit: cubit)),
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
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.1,
                                          child: Text(
                                            AppStrings.ramType,
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
                                          child: GetRamBrandComponent(
                                              fromRoute: "New Computer",
                                              cubit: cubit)),
                                      const SizedBox(width: AppSize.s16),
                                      SizedBox(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.1,
                                          child: Text(
                                            AppStrings.ramSize,
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
                                          child: GetRamSizeComponent(
                                              fromRoute: "New Computer",
                                              cubit: cubit)),
                                      const SizedBox(width: AppSize.s16),
                                      SizedBox(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.1,
                                          child: Text(
                                            AppStrings.deviceModel,
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
                                          child: GetDeviceModelComponent(
                                              fromRoute: "New Computer",
                                              cubit: cubit)),
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
                                    children: [
                                      SizedBox(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.1,
                                          child: Text(
                                            AppStrings.primaryHardDriveType,
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
                                          child: GetPrimaryHardBrandComponent(
                                              fromRoute: "New Computer",
                                              cubit: cubit)),
                                      const SizedBox(width: AppSize.s16),
                                      SizedBox(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.1,
                                          child: Text(
                                            AppStrings.primaryHardDriveSize,
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
                                          child: GetPrimaryHardSizeComponent(
                                              fromRoute: "New Computer",
                                              cubit: cubit)),
                                      const SizedBox(width: AppSize.s16),
                                      const Spacer(),
                                      Row(
                                        children: [
                                          Checkbox(
                                            value: cubit.hasSecondaryHard,
                                            activeColor: Theme.of(context)
                                                .primaryColorDark,
                                            checkColor: ColorManager.blueColor,
                                            onChanged: (bool? value) async {
                                              cubit.changeSecondaryHard(value!);
                                            },
                                          ),
                                          const SizedBox(width: AppSize.s16),
                                          Text(
                                            AppStrings.hasSecHard,
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .primaryColorDark,
                                                fontFamily:
                                                    FontConstants.family,
                                                fontSize: AppSize.s20,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  cubit.hasSecondaryHard
                                      ? Container(
                                          height: AppSize.s1,
                                          width:
                                              MediaQuery.sizeOf(context).width,
                                          color: Theme.of(context).splashColor,
                                          margin: const EdgeInsets.symmetric(
                                              vertical: AppSize.s24),
                                        )
                                      : const SizedBox.shrink(),
                                  if (cubit.hasSecondaryHard)
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        SizedBox(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.1,
                                            child: Text(
                                              AppStrings.secondaryHardDriveType,
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
                                            child:
                                                GetSecondaryHardBrandComponent(
                                                    fromRoute: "New Computer",
                                                    cubit: cubit)),
                                        const SizedBox(width: AppSize.s16),
                                        SizedBox(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.1,
                                            child: Text(
                                              AppStrings.secondaryHardDriveSize,
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
                                            child:
                                                GetSecondaryHardSizeComponent(
                                                    fromRoute: "New Computer",
                                                    cubit: cubit)),
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
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.1,
                                          child: Text(
                                            AppStrings.macAddress,
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
                                          child: ReusableComponents
                                              .registerTextField(
                                        context: context,
                                        background: Colors.transparent,
                                        textInputType: TextInputType.text,
                                        hintText: AppStrings.macAddress,
                                        textInputAction: TextInputAction.next,
                                        borderColor:
                                            Theme.of(context).primaryColorDark,
                                        controller: cubit.macAddressController,
                                        validate: (value) {
                                          if (value!.isEmpty) {
                                            return AppStrings.macRequired;
                                          }
                                        },
                                        onChanged: (String? value) {},
                                      )),
                                      const SizedBox(width: AppSize.s16),
                                      SizedBox(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.1,
                                          child: Text(
                                            AppStrings.serialNumber,
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
                                          child: ReusableComponents
                                              .registerTextField(
                                        context: context,
                                        background: Colors.transparent,
                                        textInputType: TextInputType.text,
                                        hintText: AppStrings.serialNumber,
                                        textInputAction: TextInputAction.next,
                                        borderColor:
                                            Theme.of(context).primaryColorDark,
                                        controller:
                                            cubit.serialNumberController,
                                        validate: (value) {
                                          if (value!.isEmpty) {
                                            return AppStrings.serialRequired;
                                          }
                                        },
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
                                        color:
                                            Theme.of(context).primaryColorDark,
                                        width: AppSize.s1),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(
                                        Icons.done,
                                        color:
                                            Theme.of(context).primaryColorDark,
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
                                if (cubit.checkValidation() ==
                                    AppStrings.validationSuccess) {
                                  cubit.addDevice();
                                } else {
                                  ReusableComponents.showMToast(
                                      context,
                                      cubit.checkValidation(),
                                      TextStyle(
                                          color: Theme.of(context)
                                              .primaryColorDark,
                                          fontFamily: FontConstants.family,
                                          fontSize: AppSize.s20,
                                          fontWeight: FontWeight.w400),
                                      Colors.red.shade600);
                                }
                              },
                                  borderRadius:
                                      BorderRadius.circular(AppSize.s8),
                                  overlayColor: MaterialStateColor.resolveWith(
                                      (states) => Theme.of(context)
                                          .primaryColorDark
                                          .withOpacity(AppSize.s0_2))),
                            )
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
