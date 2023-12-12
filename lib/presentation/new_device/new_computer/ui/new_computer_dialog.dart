import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:it_work/presentation/shared_cubit/new_info_cubit.dart';
import 'package:it_work/resources/strings_manager.dart';
import 'package:it_work/resources/values_manager.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/service/service_locator.dart';
import '../../../../resources/color_manager.dart';
import '../../../../resources/font_manager.dart';
import '../../../../utils/components.dart';
import '../../../shared_cubit/new_info_states.dart';
import '../bloc/new_computer_cubit.dart';

class NewComputerDialog extends StatelessWidget {
  NewComputerDialog({Key? key, required this.option,this.cubit}) : super(key: key);

  final String option;
  var cubit;


  // var cubit;

  @override
  Widget build(BuildContext context) {
    late Widget dialogDetails;
    ValueNotifier<String> newSector = ValueNotifier('');
    ValueNotifier<String> newArea = ValueNotifier('');
    ValueNotifier<String> newDepartment = ValueNotifier('');
    ValueNotifier<String> newProcessorBrand = ValueNotifier('');
    ValueNotifier<String> newProcessorModel = ValueNotifier('');
    ValueNotifier<String> newProcessorGen = ValueNotifier('');
    ValueNotifier<String> newGraphicCardBrand = ValueNotifier('');
    ValueNotifier<String> newGraphicCardModel = ValueNotifier('');
    ValueNotifier<String> newGraphicCardRamSize = ValueNotifier('');
    ValueNotifier<String> newRamType = ValueNotifier('');
    ValueNotifier<String> newDeviceModel = ValueNotifier('');
    ValueNotifier<String> newHardType = ValueNotifier('');

    switch (option) {
      case AppStrings.newSector:
        {
          dialogDetails = BlocProvider(
            create: (BuildContext context) => sl<NewInfoCubit>(),
            child: BlocConsumer<NewInfoCubit, NewInfoStates>(
              builder: (context, state) {
                return SizedBox(
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        child: Text(AppStrings.newSector,style: TextStyle(fontSize: 20, color:Colors.white),),
                      ),
                      SizedBox(
                        // width: 200,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*.02,vertical: MediaQuery.of(context).size.height*.01),
                          child: TextFormField(
                              cursorColor: Colors.grey,
                              onChanged: (value) {
                                newSector.value = value;
                              },
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: AppSize.s1Height, horizontal:  AppSize.s1Width),
                                // hintText: AppStrings.department,

                                labelStyle:
                                    const TextStyle(fontSize: 18, color: Colors.grey),
                                labelText: AppStrings.sector,
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                              style: TextStyle(
                                color: Theme.of(context).primaryColorDark,
                                fontFamily: FontConstants.family,
                              )),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppSize.s20),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height*.05,
                              width: MediaQuery.of(context).size.width*.18,
                              child: ElevatedButton(
                                onPressed: () {
                                  context
                                      .read<NewInfoCubit>()
                                      .addSector(newSector.value);
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Theme.of(context).primaryColorDark,
                                    elevation: 1,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50)))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "اضافة",
                                      style: TextStyle(
                                        color: ColorManager.CARD_BG_COLOR_DARK,
                                        fontFamily: FontConstants.family,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 5.sp,
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width*.005,
                                    ),
                                    Container(
                                        height: MediaQuery.of(context).size.height*.03,
                                        width: MediaQuery.of(context).size.height*.03,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color:
                                              ColorManager.CARD_BG_COLOR_DARK,
                                        ),
                                        //
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                          size: MediaQuery.of(context).size.height*.025,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppSize.s20),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height*.05,
                              width: MediaQuery.of(context).size.width*.11,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.redAccent,
                                    elevation: 1,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50)))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "الغاء",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: FontConstants.family,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 5.sp),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width*.005,
                                    ),
                                    Container(
                                        height: MediaQuery.of(context).size.height*.03,
                                        width: MediaQuery.of(context).size.height*.03,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.white),
                                        //
                                        child: Icon(
                                          Icons.close,
                                          color:
                                              ColorManager.CARD_BG_COLOR_DARK,
                                          size: MediaQuery.of(context).size.height*.025,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              listener: (context, state) {
                if (state is NewInfoAddSectorSuccess) {
                  Navigator.pop(context);
                  cubit?.getAllSectors();
                }
              },
            ),
          );
        }
      case AppStrings.newDepartment:
        {
          dialogDetails = BlocProvider(
            create: (BuildContext context) => sl<NewInfoCubit>()..getAllAreas(),
            child: BlocConsumer<NewInfoCubit, NewInfoStates>(
                builder: (context, state) {
                  var thisCubit = NewInfoCubit.get(context);
                  return SizedBox(
                    // width: MediaQuery.sizeOf(context).width * 0.2,
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          child: Text(AppStrings.newDepartment,style: TextStyle(fontSize: 20, color:Colors.white),),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*.01,vertical: MediaQuery.of(context).size.height*.01),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height*.05,
                            width: MediaQuery.of(context).size.width*.36,
                            child: GetAreasComponent(
                              fromRoute: "New Info",
                              cubit: thisCubit,
                            ),
                          ),
                        ),
                        SizedBox(
                          // width: 200,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*.02,vertical: MediaQuery.of(context).size.height*.01),
                            child: TextFormField(
                                cursorColor: Colors.grey,
                                onChanged: (value) {
                                  newDepartment.value = value;
                                },
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: AppSize.s1Height, horizontal:  AppSize.s1Width),
                                  // hintText: AppStrings.department,

                                  labelStyle:
                                  const TextStyle(fontSize: 18, color: Colors.grey),
                                  labelText: AppStrings.department,
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                  ),
                                ),
                                style: TextStyle(
                                  color: Theme.of(context).primaryColorDark,
                                  fontFamily: FontConstants.family,
                                )),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: AppSize.s20),
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height*.05,
                                width: MediaQuery.of(context).size.width*.18,
                                child: ElevatedButton(
                                onPressed: () {
                                    context
                                        .read<NewInfoCubit>()
                                        .addDepartment(newDepartment.value);
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                      Theme.of(context).primaryColorDark,
                                      elevation: 1,
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(50)))),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "اضافة",
                                        style: TextStyle(
                                          color: ColorManager.CARD_BG_COLOR_DARK,
                                          fontFamily: FontConstants.family,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 5.sp,
                                        ),
                                      ),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width*.005,
                                      ),
                                      Container(
                                          height: MediaQuery.of(context).size.height*.03,
                                          width: MediaQuery.of(context).size.height*.03,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(20),
                                            color:
                                            ColorManager.CARD_BG_COLOR_DARK,
                                          ),
                                          //
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                            size: MediaQuery.of(context).size.height*.025,
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: AppSize.s20),
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height*.05,
                                width: MediaQuery.of(context).size.width*.11,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.redAccent,
                                      elevation: 1,
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(50)))),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "الغاء",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: FontConstants.family,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 5.sp),
                                      ),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width*.005,
                                      ),
                                      Container(
                                          height: MediaQuery.of(context).size.height*.03,
                                          width: MediaQuery.of(context).size.height*.03,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(20),
                                              color: Colors.white),
                                          //
                                          child: Icon(
                                            Icons.close,
                                            color:
                                            ColorManager.CARD_BG_COLOR_DARK,
                                            size: MediaQuery.of(context).size.height*.025,
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
            }, listener: (context, state) async {
              if (state is NewInfoAddDepartmentSuccess)  {
                int selectedAreaId = context.read<NewInfoCubit>().selectedArea!.areaId;
               String status = await context.read<NewInfoCubit>().addDepartmentArea(state.departmentId, selectedAreaId);
                if (state is NewInfoAddDepartmentAreaSuccess) {
                  Navigator.pop(context);
                }

              }
            }),
          );
        }
      case AppStrings.newArea:
        {
          dialogDetails = BlocProvider(
            create: (context) => sl<NewInfoCubit>()..getAllSectors(),
            child: BlocConsumer<NewInfoCubit, NewInfoStates>(
              builder: (context, state) {
                var thisCubit = NewInfoCubit.get(context);

                return SizedBox(
                  // width: MediaQuery.sizeOf(context).width * 0.2,
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        // width: 200,
                        child: Column(
                          children: [
                            const SizedBox(
                              child: Text(AppStrings.newArea,style: TextStyle(fontSize: 20, color:Colors.white),),
                            ),
                            SizedBox(
                              height:MediaQuery.of(context).size.height*.005,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*.01,vertical: MediaQuery.of(context).size.height*.01),
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height*.05,
                                width: MediaQuery.of(context).size.width*.36,
                                child: GetSectorsComponent(
                                  fromRoute: "New Info",
                                  cubit: thisCubit,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*.02,vertical: MediaQuery.of(context).size.height*.01),
                              child: TextFormField(
                                  cursorColor: Colors.grey,
                                  onChanged: (value) {
                                    newArea.value = value;
                                  },
                                  decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 20),
                                    // hintText: AppStrings.department,

                                    labelStyle: TextStyle(
                                        fontSize: 18, color: Colors.grey),
                                    labelText: AppStrings.newArea,
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                  ),
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColorDark,
                                    fontFamily: FontConstants.family,
                                  )),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppSize.s20),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height*.05,
                              width: MediaQuery.of(context).size.width*.18,
                              child: ElevatedButton(
                                onPressed: () {
                                  String selectedSectorName = context
                                      .read<NewInfoCubit>()
                                      .selectedSector!
                                      .sectorName;

                                  int selectedSectorId = context
                                      .read<NewInfoCubit>()
                                      .selectedSector!
                                      .sectorId;

                                  context.read<NewInfoCubit>().addArea(
                                      selectedSectorId,
                                      selectedSectorName,
                                      newArea.value);
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Theme.of(context).primaryColorDark,
                                    elevation: 1,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50)))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "اضافة",
                                      style: TextStyle(
                                        color: ColorManager.CARD_BG_COLOR_DARK,
                                        fontFamily: FontConstants.family,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 5.sp,
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width*.005,
                                    ),
                                    Container(
                                        height: MediaQuery.of(context).size.height*.03,
                                        width: MediaQuery.of(context).size.height*.03,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color:
                                              ColorManager.CARD_BG_COLOR_DARK,
                                        ),
                                        //
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                          size: MediaQuery.of(context).size.height*.025,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppSize.s20),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height*.05,
                              width: MediaQuery.of(context).size.width*.11,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.redAccent,
                                    elevation: 1,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50)))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "الغاء",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: FontConstants.family,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 19),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width*.005,
                                    ),
                                    Container(
                                        height: MediaQuery.of(context).size.height*.03,
                                        width: MediaQuery.of(context).size.height*.03,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.white),
                                        //
                                        child: Icon(
                                          Icons.close,
                                          size: MediaQuery.of(context).size.height*.025,
                                          color:
                                              ColorManager.CARD_BG_COLOR_DARK,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              listener: (context, state) {
                if (state is NewInfoAddAreaSuccess) {
                  cubit?.getAreas(cubit?.selectedSector?.sectorId??1);
                  Navigator.pop(context);
                }
              },
            ),
          );
        }
      case AppStrings.newProcessorBrand:
        {
          dialogDetails = BlocProvider(
            create: (context) => sl<NewInfoCubit>(),
            child: BlocConsumer<NewInfoCubit, NewInfoStates>(
              builder: (context, state) {
                return SizedBox(
                  // width: MediaQuery.sizeOf(context).width * 0.2,
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        child: Text(AppStrings.newProcessorBrand,style: TextStyle(fontSize: 20, color:Colors.white),),
                      ),
                      SizedBox(
                        // width: 200,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*.02,vertical: MediaQuery.of(context).size.height*.01),
                          child: TextFormField(
                              cursorColor: Colors.grey,
                              onChanged: (value) {
                                newProcessorBrand.value = value;
                              },
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: AppSize.s1Height, horizontal:  AppSize.s1Width),
                                // hintText: AppStrings.department,

                                labelStyle:
                                const TextStyle(fontSize: 18, color: Colors.grey),
                                labelText: AppStrings.processorBrand,
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                              style: TextStyle(
                                color: Theme.of(context).primaryColorDark,
                                fontFamily: FontConstants.family,
                              )),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppSize.s20),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height*.05,
                              width: MediaQuery.of(context).size.width*.18,
                              child: ElevatedButton(
                                                onPressed: () {
                                                  context
                                                      .read<NewInfoCubit>()
                                                      .addProcessorBrand(
                                                          newProcessorBrand.value);
                                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                    Theme.of(context).primaryColorDark,
                                    elevation: 1,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50)))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "اضافة",
                                      style: TextStyle(
                                        color: ColorManager.CARD_BG_COLOR_DARK,
                                        fontFamily: FontConstants.family,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 5.sp,
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width*.005,
                                    ),
                                    Container(
                                        height: MediaQuery.of(context).size.height*.03,
                                        width: MediaQuery.of(context).size.height*.03,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(20),
                                          color:
                                          ColorManager.CARD_BG_COLOR_DARK,
                                        ),
                                        //
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                          size: MediaQuery.of(context).size.height*.025,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppSize.s20),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height*.05,
                              width: MediaQuery.of(context).size.width*.11,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.redAccent,
                                    elevation: 1,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50)))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "الغاء",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: FontConstants.family,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 5.sp),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width*.005,
                                    ),
                                    Container(
                                        height: MediaQuery.of(context).size.height*.03,
                                        width: MediaQuery.of(context).size.height*.03,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(20),
                                            color: Colors.white),
                                        //
                                        child: Icon(
                                          Icons.close,
                                          color:
                                          ColorManager.CARD_BG_COLOR_DARK,
                                          size: MediaQuery.of(context).size.height*.025,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              listener: (context, state) {
                if (state is NewInfoAddProcessorBrandSuccess) {
                  cubit?.getAllProcessorBrands();
                  Navigator.pop(context);
                }
              },
            ),
          );
        }
      case AppStrings.newProcessorModel:
        {
          dialogDetails = BlocProvider(
            create: (BuildContext context) =>
                sl<NewInfoCubit>()..getAllProcessorBrands(),
            child: BlocConsumer<NewInfoCubit, NewInfoStates>(
              builder: (BuildContext context, NewInfoStates state) {
                var thisCubit = NewInfoCubit.get(context);

                return SizedBox(
                  // width: MediaQuery.sizeOf(context).width * 0.2,
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        // width: 200,
                        child: Column(
                          children: [
                            const SizedBox(
                              child: Text(AppStrings.newProcessorModel,style: TextStyle(fontSize: 20, color:Colors.white),),
                            ),
                            SizedBox(
                              height:MediaQuery.of(context).size.height*.005,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*.01,vertical: MediaQuery.of(context).size.height*.01),
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height*.05,
                                width: MediaQuery.of(context).size.width*.36,
                                child: GetProcessorBrandComponent(
                                  fromRoute: "New Info",
                                  cubit: thisCubit,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*.02,vertical: MediaQuery.of(context).size.height*.01),
                              child: TextFormField(
                                  cursorColor: Colors.grey,
                                  onChanged: (value) {
                                    newProcessorModel.value = value;
                                  },
                                  decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 20),
                                    // hintText: AppStrings.department,

                                    labelStyle: TextStyle(
                                        fontSize: 18, color: Colors.grey),
                                    labelText: AppStrings.newProcessorModel,
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.white),
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                    ),
                                  ),
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColorDark,
                                    fontFamily: FontConstants.family,
                                  )),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppSize.s20),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height*.05,
                              width: MediaQuery.of(context).size.width*.18,
                              child: ElevatedButton(
                onPressed: () {
                                  int selectedProcessorBrandId = context.read<NewInfoCubit>().selectedBrand!.processorBrandId;
                                  context
                                      .read<NewInfoCubit>()
                                      .addProcessorModel(newProcessorModel.value, selectedProcessorBrandId);
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                    Theme.of(context).primaryColorDark,
                                    elevation: 1,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50)))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "اضافة",
                                      style: TextStyle(
                                        color: ColorManager.CARD_BG_COLOR_DARK,
                                        fontFamily: FontConstants.family,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 5.sp,
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width*.005,
                                    ),
                                    Container(
                                        height: MediaQuery.of(context).size.height*.03,
                                        width: MediaQuery.of(context).size.height*.03,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(20),
                                          color:
                                          ColorManager.CARD_BG_COLOR_DARK,
                                        ),
                                        //
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                          size: MediaQuery.of(context).size.height*.025,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppSize.s20),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height*.05,
                              width: MediaQuery.of(context).size.width*.11,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.redAccent,
                                    elevation: 1,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50)))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "الغاء",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: FontConstants.family,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 19),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width*.005,
                                    ),
                                    Container(
                                        height: MediaQuery.of(context).size.height*.03,
                                        width: MediaQuery.of(context).size.height*.03,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(20),
                                            color: Colors.white),
                                        //
                                        child: Icon(
                                          Icons.close,
                                          size: MediaQuery.of(context).size.height*.025,
                                          color:
                                          ColorManager.CARD_BG_COLOR_DARK,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              listener: (BuildContext context, NewInfoStates state) {
                if (state is NewInfoAddProcessorModelSuccess) {
                  cubit?.getProcessorModels(cubit?.selectedProcessorBrand?.processorBrandId??1);
                  Navigator.pop(context);
                }
              },
            ),
          );
        }
      case AppStrings.newProcessorGen:
        {
          dialogDetails = BlocProvider(
            create: (BuildContext context) => sl<NewInfoCubit>(),
            child: BlocConsumer<NewInfoCubit, NewInfoStates>(
              builder: (context, state) {
                return SizedBox(
                  // width: MediaQuery.sizeOf(context).width * 0.2,
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        child: Text(AppStrings.newProcessorGen,style: TextStyle(fontSize: 20, color:Colors.white),),
                      ),
                      SizedBox(
                        // width: 200,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*.02,vertical: MediaQuery.of(context).size.height*.01),
                          child: TextFormField(
                              cursorColor: Colors.grey,
                              onChanged: (value) {
                                newProcessorGen.value = value;
                              },
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: AppSize.s1Height, horizontal:  AppSize.s1Width),
                                // hintText: AppStrings.department,

                                labelStyle:
                                const TextStyle(fontSize: 18, color: Colors.grey),
                                labelText: AppStrings.processorGen,
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                              style: TextStyle(
                                color: Theme.of(context).primaryColorDark,
                                fontFamily: FontConstants.family,
                              )),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppSize.s20),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height*.05,
                              width: MediaQuery.of(context).size.width*.18,
                              child: ElevatedButton(
                                onPressed: () {
                                  context
                                      .read<NewInfoCubit>()
                                      .addProcessorGen(newProcessorGen.value);
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                    Theme.of(context).primaryColorDark,
                                    elevation: 1,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50)))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "اضافة",
                                      style: TextStyle(
                                        color: ColorManager.CARD_BG_COLOR_DARK,
                                        fontFamily: FontConstants.family,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 5.sp,
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width*.005,
                                    ),
                                    Container(
                                        height: MediaQuery.of(context).size.height*.03,
                                        width: MediaQuery.of(context).size.height*.03,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(20),
                                          color:
                                          ColorManager.CARD_BG_COLOR_DARK,
                                        ),
                                        //
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                          size: MediaQuery.of(context).size.height*.025,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppSize.s20),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height*.05,
                              width: MediaQuery.of(context).size.width*.11,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.redAccent,
                                    elevation: 1,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50)))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "الغاء",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: FontConstants.family,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 5.sp),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width*.005,
                                    ),
                                    Container(
                                        height: MediaQuery.of(context).size.height*.03,
                                        width: MediaQuery.of(context).size.height*.03,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(20),
                                            color: Colors.white),
                                        //
                                        child: Icon(
                                          Icons.close,
                                          color:
                                          ColorManager.CARD_BG_COLOR_DARK,
                                          size: MediaQuery.of(context).size.height*.025,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              listener: (BuildContext context, NewInfoStates state) {
                if (state is NewInfoAddProcessorGenSuccess) {
                  cubit?.getProcessorGens();
                  Navigator.pop(context);
                }
              },
            ),
          );
        }
      case AppStrings.newGraphicCardBrand:
        {
          dialogDetails = BlocProvider(
            create: (BuildContext context) => sl<NewInfoCubit>(),
            child: BlocConsumer<NewInfoCubit, NewInfoStates>(
              builder: (context, state) {
                return SizedBox(
                  // width: MediaQuery.sizeOf(context).width * 0.2,
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        child: Text(AppStrings.newGraphicCardBrand,style: TextStyle(fontSize: 20, color:Colors.white),),
                      ),
                      SizedBox(
                        // width: 200,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*.02,vertical: MediaQuery.of(context).size.height*.01),
                          child: TextFormField(
                              cursorColor: Colors.grey,
                              onChanged: (value) {
                                newGraphicCardBrand.value = value;
                              },
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: AppSize.s1Height, horizontal:  AppSize.s1Width),
                                // hintText: AppStrings.department,

                                labelStyle:
                                const TextStyle(fontSize: 18, color: Colors.grey),
                                labelText: AppStrings.graphicCardBrand,
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                              style: TextStyle(
                                color: Theme.of(context).primaryColorDark,
                                fontFamily: FontConstants.family,
                              )),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppSize.s20),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height*.05,
                              width: MediaQuery.of(context).size.width*.18,
                              child: ElevatedButton(
                                onPressed: () {
                                  context
                                      .read<NewInfoCubit>()
                                      .addGraphicCardBrand(newGraphicCardBrand.value);
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                    Theme.of(context).primaryColorDark,
                                    elevation: 1,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50)))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "اضافة",
                                      style: TextStyle(
                                        color: ColorManager.CARD_BG_COLOR_DARK,
                                        fontFamily: FontConstants.family,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 5.sp,
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width*.005,
                                    ),
                                    Container(
                                        height: MediaQuery.of(context).size.height*.03,
                                        width: MediaQuery.of(context).size.height*.03,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(20),
                                          color:
                                          ColorManager.CARD_BG_COLOR_DARK,
                                        ),
                                        //
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                          size: MediaQuery.of(context).size.height*.025,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppSize.s20),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height*.05,
                              width: MediaQuery.of(context).size.width*.11,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.redAccent,
                                    elevation: 1,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50)))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "الغاء",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: FontConstants.family,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 5.sp),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width*.005,
                                    ),
                                    Container(
                                        height: MediaQuery.of(context).size.height*.03,
                                        width: MediaQuery.of(context).size.height*.03,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(20),
                                            color: Colors.white),
                                        //
                                        child: Icon(
                                          Icons.close,
                                          color:
                                          ColorManager.CARD_BG_COLOR_DARK,
                                          size: MediaQuery.of(context).size.height*.025,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              listener: (BuildContext context, NewInfoStates state) {
                if (state is NewInfoAddGraphicCardBrandSuccess) {
                  cubit?.getAllGraphicBrands();
                  Navigator.pop(context);
                }
              },
            ),
          );
        }
      case AppStrings.newGraphicCardModel:
        {
          dialogDetails = BlocProvider(
            create: (BuildContext context) =>
                sl<NewInfoCubit>()..getAllGraphicBrands(),
            child: BlocConsumer<NewInfoCubit, NewInfoStates>(
              builder: (BuildContext context, NewInfoStates state) {
                var thisCubit = NewInfoCubit.get(context);
                return SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        child: Column(
                          children: [
                            const SizedBox(
                              child: Text(AppStrings.newGraphicCardModel,style: TextStyle(fontSize: 20, color:Colors.white),),
                            ),
                            SizedBox(
                              height:MediaQuery.of(context).size.height*.005,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*.01,vertical: MediaQuery.of(context).size.height*.01),
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height*.05,
                                width: MediaQuery.of(context).size.width*.36,
                                child: GetGraphicBrandComponent(
                                  fromRoute: "New Info",
                                  cubit: thisCubit,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*.02,vertical: MediaQuery.of(context).size.height*.01),
                              child: TextFormField(
                                  cursorColor: Colors.grey,
                                  onChanged: (value) {
                                    newGraphicCardModel.value = value;
                                  },
                                  decoration:  InputDecoration(
                                    contentPadding:   EdgeInsets.symmetric(
                                        vertical: AppSize.s1Height, horizontal:  AppSize.s1Width),
                                    // hintText: AppStrings.department,

                                    labelStyle: const TextStyle(
                                        fontSize: 18, color: Colors.grey),
                                    labelText: AppStrings.graphicCardModel,
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.white),
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                    ),
                                  ),
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColorDark,
                                    fontFamily: FontConstants.family,
                                  )),
                            ),

                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*.02,vertical: MediaQuery.of(context).size.height*.01),
                              child: TextFormField(
                                  cursorColor: Colors.grey,
                                  onChanged: (value) {
                                    newGraphicCardRamSize.value = value;
                                  },
                                  decoration:  InputDecoration(
                                    contentPadding:   EdgeInsets.symmetric(
                                        vertical: AppSize.s1Height, horizontal:  AppSize.s1Width),

                                    labelStyle: const TextStyle(
                                        fontSize: 18, color: Colors.grey),
                                    labelText: AppStrings.ramSize,
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.white),
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                    ),
                                  ),
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColorDark,
                                    fontFamily: FontConstants.family,
                                  )),
                            ),

                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppSize.s20),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height*.05,
                              width: MediaQuery.of(context).size.width*.18,
                              child: ElevatedButton(
                                          onPressed: () {
                                            int selectedModelCardId = context
                                                .read<NewInfoCubit>()
                                                .selectedGraphicBrand!
                                                .graphicsCardBrandId;

                                            context.read<NewInfoCubit>().addGraphicCardModel(
                                                newGraphicCardModel.value,
                                                '1024',
                                                selectedModelCardId);
                                          },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                    Theme.of(context).primaryColorDark,
                                    elevation: 1,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50)))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "اضافة",
                                      style: TextStyle(
                                        color: ColorManager.CARD_BG_COLOR_DARK,
                                        fontFamily: FontConstants.family,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 5.sp,
                                      ),
                                    ),
                                     SizedBox(
                                      width: MediaQuery.of(context).size.width*.005,
                                    ),
                                    Container(
                                        // height: 30,
                                        // width: 30,
                                        height: MediaQuery.of(context).size.height*.03,
                                        width: MediaQuery.of(context).size.height*.03,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(20),
                                          color:
                                          ColorManager.CARD_BG_COLOR_DARK,
                                        ),
                                        //
                                        child:  Icon(
                                          Icons.add,
                                          color: Colors.white,
                                          size: MediaQuery.of(context).size.height*.025,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppSize.s20),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height*.05,
                              width: MediaQuery.of(context).size.width*.11,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.redAccent,
                                    elevation: 1,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50)))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                     Text(
                                      "الغاء",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: FontConstants.family,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 5.sp,),
                                    ),
                                     SizedBox(
                                      width: MediaQuery.of(context).size.width*.005,
                                    ),
                                    Container(
                                        height: MediaQuery.of(context).size.height*.03,
                                        width: MediaQuery.of(context).size.height*.03,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(20),
                                            color: Colors.white),
                                        //
                                        child: Icon(
                                          Icons.close,
                                          color:
                                          ColorManager.CARD_BG_COLOR_DARK,
                                          size: MediaQuery.of(context).size.height*.025,



                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );

              },
              listener: (BuildContext context, NewInfoStates state) {
                if (state is NewInfoAddGraphicCardModelSuccess) {
                  cubit?.getGraphicModels(cubit?.selectedGraphicBrand?.graphicsCardBrandId??1);
                  Navigator.pop(context);
                }
              },
            ),
          );
        }
      case AppStrings.newRamType:
        {
          dialogDetails = BlocProvider(
            create: (BuildContext context) => sl<NewInfoCubit>(),
            child: BlocConsumer<NewInfoCubit, NewInfoStates>(
              builder: (BuildContext context, NewInfoStates state) {
                var thisCubit = NewInfoCubit.get(context);
                return SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        child: Text(AppStrings.newRamType,style: TextStyle(fontSize: 20, color:Colors.white),),
                      ),
                      SizedBox(
                        // width: 200,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*.02,vertical: MediaQuery.of(context).size.height*.01),
                          child: TextFormField(
                              cursorColor: Colors.grey,
                              onChanged: (value) {
                                newRamType.value = value;
                              },
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: AppSize.s1Height, horizontal:  AppSize.s1Width),
                                // hintText: AppStrings.department,

                                labelStyle:
                                const TextStyle(fontSize: 18, color: Colors.grey),
                                labelText: AppStrings.ramType,
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                              style: TextStyle(
                                color: Theme.of(context).primaryColorDark,
                                fontFamily: FontConstants.family,
                              )),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppSize.s20),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height*.05,
                              width: MediaQuery.of(context).size.width*.18,
                              child: ElevatedButton(
                                onPressed: () {
                                  context
                                      .read<NewInfoCubit>()
                                      .addRamType(newRamType.value);
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                    Theme.of(context).primaryColorDark,
                                    elevation: 1,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50)))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "اضافة",
                                      style: TextStyle(
                                        color: ColorManager.CARD_BG_COLOR_DARK,
                                        fontFamily: FontConstants.family,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 5.sp,
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width*.005,
                                    ),
                                    Container(
                                        height: MediaQuery.of(context).size.height*.03,
                                        width: MediaQuery.of(context).size.height*.03,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(20),
                                          color:
                                          ColorManager.CARD_BG_COLOR_DARK,
                                        ),
                                        //
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                          size: MediaQuery.of(context).size.height*.025,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppSize.s20),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height*.05,
                              width: MediaQuery.of(context).size.width*.11,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.redAccent,
                                    elevation: 1,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50)))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "الغاء",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: FontConstants.family,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 5.sp),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width*.005,
                                    ),
                                    Container(
                                        height: MediaQuery.of(context).size.height*.03,
                                        width: MediaQuery.of(context).size.height*.03,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(20),
                                            color: Colors.white),
                                        //
                                        child: Icon(
                                          Icons.close,
                                          color:
                                          ColorManager.CARD_BG_COLOR_DARK,
                                          size: MediaQuery.of(context).size.height*.025,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              listener: (BuildContext context, NewInfoStates state) {
                if (state is NewInfoAddRamTypeSuccess) {
                  cubit?.getAllRamTypes();
                  Navigator.pop(context);
                }
              },
            ),
          );
        }
      case AppStrings.newDeviceModel:
        {
          dialogDetails = BlocProvider(
            create: (BuildContext context) => sl<NewInfoCubit>(),
            child: BlocConsumer<NewInfoCubit, NewInfoStates>(
              builder: (BuildContext context, NewInfoStates state) {
                var thisCubit = NewInfoCubit.get(context);
                return SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        child: Text(AppStrings.newDeviceModel,style: TextStyle(fontSize: 20, color:Colors.white),),
                      ),
                      SizedBox(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*.02,vertical: MediaQuery.of(context).size.height*.01),
                          child: TextFormField(
                              cursorColor: Colors.grey,
                              onChanged: (value) {
                                newDeviceModel.value = value;
                              },
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: AppSize.s1Height, horizontal:  AppSize.s1Width),

                                labelStyle:
                                const TextStyle(fontSize: 18, color: Colors.grey),
                                labelText: AppStrings.deviceModel,
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                              style: TextStyle(
                                color: Theme.of(context).primaryColorDark,
                                fontFamily: FontConstants.family,
                              )),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppSize.s20),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height*.05,
                              width: MediaQuery.of(context).size.width*.18,
                              child: ElevatedButton(
                                onPressed: () {
                                  context
                                      .read<NewInfoCubit>()
                                      .addDeviceModel(newDeviceModel.value);
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                    Theme.of(context).primaryColorDark,
                                    elevation: 1,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50)))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "اضافة",
                                      style: TextStyle(
                                        color: ColorManager.CARD_BG_COLOR_DARK,
                                        fontFamily: FontConstants.family,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 5.sp,
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width*.005,
                                    ),
                                    Container(
                                        height: MediaQuery.of(context).size.height*.03,
                                        width: MediaQuery.of(context).size.height*.03,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(20),
                                          color:
                                          ColorManager.CARD_BG_COLOR_DARK,
                                        ),
                                        //
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                          size: MediaQuery.of(context).size.height*.025,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppSize.s20),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height*.05,
                              width: MediaQuery.of(context).size.width*.11,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.redAccent,
                                    elevation: 1,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50)))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "الغاء",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: FontConstants.family,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 5.sp),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width*.005,
                                    ),
                                    Container(
                                        height: MediaQuery.of(context).size.height*.03,
                                        width: MediaQuery.of(context).size.height*.03,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(20),
                                            color: Colors.white),
                                        //
                                        child: Icon(
                                          Icons.close,
                                          color:
                                          ColorManager.CARD_BG_COLOR_DARK,
                                          size: MediaQuery.of(context).size.height*.025,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );

              },
              listener: (BuildContext context, NewInfoStates state) {
                if (state is NewInfoAddDeviceModelSuccess) {
                  cubit?.getAllPcModels();
                  Navigator.pop(context);
                }
              },
            ),
          );
        }
      case AppStrings.newPrimaryHardDriveType:
        {
          dialogDetails = BlocProvider(
            create: (BuildContext context) => sl<NewInfoCubit>(),
            child: BlocConsumer<NewInfoCubit, NewInfoStates>(
              builder: (BuildContext context, NewInfoStates state) {
                var thisCubit = NewInfoCubit.get(context);
                return SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        child: Text(AppStrings.newPrimaryHardDriveType,style: TextStyle(fontSize: 20, color:Colors.white),),
                      ),
                      SizedBox(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*.02,vertical: MediaQuery.of(context).size.height*.01),
                          child: TextFormField(
                              cursorColor: Colors.grey,
                              onChanged: (value) {
                                newHardType.value = value;
                              },
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: AppSize.s1Height, horizontal:  AppSize.s1Width),

                                labelStyle:
                                const TextStyle(fontSize: 18, color: Colors.grey),
                                labelText: AppStrings.primaryHardDriveType,
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                              style: TextStyle(
                                color: Theme.of(context).primaryColorDark,
                                fontFamily: FontConstants.family,
                              )),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppSize.s20),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height*.05,
                              width: MediaQuery.of(context).size.width*.18,
                              child: ElevatedButton(
                                onPressed: () {
                                  context
                                      .read<NewInfoCubit>()
                                      .addHardType(newHardType.value);
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                    Theme.of(context).primaryColorDark,
                                    elevation: 1,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50)))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "اضافة",
                                      style: TextStyle(
                                        color: ColorManager.CARD_BG_COLOR_DARK,
                                        fontFamily: FontConstants.family,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 5.sp,
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width*.005,
                                    ),
                                    Container(
                                        height: MediaQuery.of(context).size.height*.03,
                                        width: MediaQuery.of(context).size.height*.03,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(20),
                                          color:
                                          ColorManager.CARD_BG_COLOR_DARK,
                                        ),
                                        //
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                          size: MediaQuery.of(context).size.height*.025,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppSize.s20),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height*.05,
                              width: MediaQuery.of(context).size.width*.11,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.redAccent,
                                    elevation: 1,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50)))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "الغاء",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: FontConstants.family,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 5.sp),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width*.005,
                                    ),
                                    Container(
                                        height: MediaQuery.of(context).size.height*.03,
                                        width: MediaQuery.of(context).size.height*.03,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(20),
                                            color: Colors.white),
                                        //
                                        child: Icon(
                                          Icons.close,
                                          color:
                                          ColorManager.CARD_BG_COLOR_DARK,
                                          size: MediaQuery.of(context).size.height*.025,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              listener: (BuildContext context, NewInfoStates state) {
                if (state is NewInfoAddHardTypeSuccess) {
                  cubit?.getAllHardTypes();
                  Navigator.pop(context);
                }
              },
            ),
          );
        }
    }

    return Center(
      child: Card(
        color: ColorManager.CARD_BG_COLOR_DARK,
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: SizedBox(

          height: MediaQuery.of(context).size.height*.40,
          width: MediaQuery.of(context).size.width*.40,
          child: dialogDetails,
        ),
      ),
    );
  }
}

class AddDialog extends StatelessWidget {
  const AddDialog({
    super.key,
    required this.addNewObject,
    required this.newObjectName,
    required this.onPressed,
  });

  final ValueNotifier<String> addNewObject;
  final String newObjectName;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppSize.s15, vertical: AppSize.s1Height),
          child: TextFormField(
              onChanged: (value) {
                addNewObject.value = value;
              },
              decoration: InputDecoration(
                hintText: newObjectName,
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(7)),
                ),
              ),
              style: TextStyle(
                color: Theme.of(context).primaryColorDark,
                fontFamily: FontConstants.family,
              )),
        ),
        /*  SizedBox(
          height: AppSize.s5Height,
        ),*/
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            width: double.infinity,
            height: AppSize.s40,
            child: ElevatedButton(
              onPressed: () => onPressed(),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColorDark,
                  elevation: 20,
                  shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)))),
              child: Text(
                newObjectName,
                style: TextStyle(
                  color: ColorManager.CARD_BG_COLOR_DARK,
                  fontFamily: FontConstants.family,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}