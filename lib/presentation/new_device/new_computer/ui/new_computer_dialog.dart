import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:it_work/presentation/shared_cubit/new_info_cubit.dart';
import 'package:it_work/resources/strings_manager.dart';
import 'package:it_work/resources/values_manager.dart';

import '../../../../core/service/service_locator.dart';
import '../../../../resources/color_manager.dart';
import '../../../../resources/font_manager.dart';
import '../../../../utils/components.dart';
import '../../../shared_cubit/new_info_states.dart';
import '../bloc/new_computer_cubit.dart';

class NewComputerDialog extends StatelessWidget {
  NewComputerDialog({Key? key, required this.option})
      : super(key: key);

  final String option;
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

    switch (option) {
      case AppStrings.newSector:
        {
          dialogDetails = BlocProvider(
            create: (BuildContext context) => sl<NewInfoCubit>(),
            child: BlocConsumer<NewInfoCubit, NewInfoStates>(
              listener: (context, state) {
                if (state is NewInfoAddSectorSuccess) {
                  Navigator.pop(context);
                }
              },
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppSize.s20Width,
                          vertical: AppSize.s1Height),
                      child: TextFormField(
                          onChanged: (value) {
                            newSector.value = value;
                          },
                          decoration: InputDecoration(
                            hintText: AppStrings.sector,
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7)),
                            ),
                          ),
                          style: TextStyle(
                            color: Theme.of(context).primaryColorDark,
                            fontFamily: FontConstants.family,
                          )),
                    ),
                    SizedBox(
                      height: AppSize.s5Height,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: ElevatedButton(
                          onPressed: () {
                            context
                                .read<NewInfoCubit>()
                                .addSector(newSector.value);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColorDark,
                            elevation: 20,
                          ),
                          child: Text(
                            AppStrings.newSector,
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
              },
            ),
          );
        }
      case AppStrings.newDepartment:
        {
          dialogDetails = BlocProvider(
            create: (BuildContext context) => sl<NewInfoCubit>(),
            child: BlocConsumer<NewInfoCubit,NewInfoStates>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppSize.s15Width, vertical: AppSize.s1Height),
                      child: TextFormField(
                          onChanged: (value) {
                            newDepartment.value = value;
                          },
                          decoration: InputDecoration(
                            hintText: AppStrings.department,
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
                    SizedBox(
                      height: AppSize.s5Height,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: ElevatedButton(
                          onPressed: () {
                            context.read<NewInfoCubit>().addDepartment(newDepartment.value);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColorDark,
                            elevation: 20,
                          ),
                          child: Text(
                            AppStrings.newDepartment,
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
              },
              listener: (context, state) {
                if (state is NewInfoAddDepartmentSuccess) {
                  Navigator.pop(context);
                }
              }
            ),
          );
        }
      case AppStrings.newArea:
        {
          dialogDetails = BlocProvider(
            create: (context) => sl<NewInfoCubit>()..getAllSectors(),
            child: BlocConsumer<NewInfoCubit, NewInfoStates>(
              builder: (context, state) {
                var thisCubit = NewInfoCubit.get(context);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GetSectorsComponent(
                      fromRoute: "New Info",
                      cubit: thisCubit,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppSize.s15Width,
                          vertical: AppSize.s1Height),
                      child: TextFormField(
                          onChanged: (value) {
                            newArea.value = value;
                          },
                          decoration: InputDecoration(
                            hintText: AppStrings.area,
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7)),
                            ),
                          ),
                          style: TextStyle(
                            color: Theme.of(context).primaryColorDark,
                            fontFamily: FontConstants.family,
                          )),
                    ),
                    SizedBox(
                      height: AppSize.s5Height,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: ElevatedButton(
                          onPressed: () {
                            String selectedSectorName = context
                                .read<NewInfoCubit>()
                                .selectedSector!
                                .sectorName;

                            int selectedSectorId = context.read<NewInfoCubit>().selectedSector!.sectorId;

                            context.read<NewInfoCubit>()
                                .addArea(selectedSectorId,selectedSectorName,newArea.value);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColorDark,
                            elevation: 20,
                          ),
                          child: Text(
                            AppStrings.newArea,
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
              },
              listener: (context, state) {
                if(state is NewInfoAddAreaSuccess) {
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
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppSize.s15Width, vertical: AppSize.s1Height),
                      child: TextFormField(
                          onChanged: (value) {
                            newProcessorBrand.value = value;
                          },
                          decoration: InputDecoration(
                            hintText: AppStrings.processorBrand,
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
                    SizedBox(
                      height: AppSize.s5Height,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: ElevatedButton(
                          onPressed: () {

                            context.read<NewInfoCubit>().addProcessorBrand(newProcessorBrand.value);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColorDark,
                            elevation: 20,
                          ),
                          child: Text(
                            AppStrings.newProcessorBrand,
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
              },
              listener: (context, state) {
                if (state is NewInfoAddProcessorBrandSuccess) {
                  Navigator.pop(context);
                }
              },
            ),
          );
        }
      case AppStrings.newProcessorModel:
        {
          dialogDetails = BlocProvider(
            create: (BuildContext context) => sl<NewInfoCubit>()..getAllProcessorBrands(),
            child: BlocConsumer<NewInfoCubit, NewInfoStates>(
              builder: (BuildContext context, NewInfoStates state) {
                var thisCubit = NewInfoCubit.get(context);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GetProcessorBrandComponent(
                      fromRoute: "New Info",
                      cubit: thisCubit,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppSize.s15Width, vertical: AppSize.s1Height),
                      child: TextFormField(
                          onChanged: (value) {
                            newProcessorModel.value = value;
                          },
                          decoration: InputDecoration(
                            hintText: AppStrings.processorModel,
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
                    SizedBox(
                      height: AppSize.s5Height,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: ElevatedButton(
                          onPressed: () {
                            int selectedProcessorBrandId = context.read<NewInfoCubit>().selectedBrand!.processorBrandId;
                            context.read<NewInfoCubit>().addProcessorModel(newProcessorModel.value, selectedProcessorBrandId);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColorDark,
                            elevation: 20,
                          ),
                          child: Text(
                            AppStrings.newProcessorModel,
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
              },
              listener: (BuildContext context, NewInfoStates state) {
                if (state is NewInfoAddProcessorModelSuccess) {
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
            child: BlocConsumer<NewInfoCubit,NewInfoStates>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppSize.s15Width, vertical: AppSize.s1Height),
                      child: TextFormField(
                          onChanged: (value) {
                            newProcessorGen.value = value;
                          },
                          decoration: InputDecoration(
                            hintText: AppStrings.processorGen,
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
                    SizedBox(
                      height: AppSize.s5Height,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: ElevatedButton(
                          onPressed: () {
                            context.read<NewInfoCubit>().addProcessorGen(newProcessorGen.value);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColorDark,
                            elevation: 20,
                          ),
                          child: Text(
                            AppStrings.newProcessorGen,
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
              },
              listener: (BuildContext context, NewInfoStates state) {
                if (state is NewInfoAddProcessorGenSuccess) {
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
            child: BlocConsumer<NewInfoCubit,NewInfoStates>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppSize.s15Width, vertical: AppSize.s1Height),
                      child: TextFormField(
                          onChanged: (value) {
                          newGraphicCardBrand.value = value;
                          },
                          decoration: InputDecoration(
                            hintText: AppStrings.graphicCardBrand,
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
                    SizedBox(
                      height: AppSize.s5Height,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: ElevatedButton(
                          onPressed: () {
                            print(newGraphicCardBrand.value);
                            context.read<NewInfoCubit>().addGraphicCardBrand(newGraphicCardBrand.value);

                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColorDark,
                            elevation: 20,
                          ),
                          child: Text(
                            AppStrings.newGraphicCardBrand,
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
              },
              listener: (BuildContext context, NewInfoStates state) {
                if (state is NewInfoAddProcessorGenSuccess) {
                  Navigator.pop(context);
                }
              },
            ),
          );
        }
      case AppStrings.newGraphicCardModel:
        {
          dialogDetails = BlocProvider(
            create: (BuildContext context) => sl<NewInfoCubit>()..getAllProcessorBrands(),
            child: BlocConsumer<NewInfoCubit, NewInfoStates>(
              builder: (BuildContext context, NewInfoStates state) {
                var thisCubit = NewInfoCubit.get(context);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GetProcessorBrandComponent(
                      fromRoute: "New Info",
                      cubit: thisCubit,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppSize.s15Width, vertical: AppSize.s1Height),
                      child: TextFormField(
                          onChanged: (value) {
                            newGraphicCardModel.value = value;
                          },
                          decoration: InputDecoration(
                            hintText: AppStrings.graphicCardModel,
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
                    SizedBox(
                      height: AppSize.s5Height,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppSize.s15Width, vertical: AppSize.s1Height),
                      child: TextFormField(
                          onChanged: (value) {
                            newGraphicCardRamSize.value = value;
                          },
                          decoration: InputDecoration(
                            hintText: AppStrings.ramSize,
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
                    SizedBox(
                      height: AppSize.s5Height,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: ElevatedButton(
                          onPressed: () {

                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColorDark,
                            elevation: 20,
                          ),
                          child: Text(
                            AppStrings.newProcessorModel,
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
              },
              listener: (BuildContext context, NewInfoStates state) {
                if (state is NewInfoAddProcessorModelSuccess) {
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
        child: SizedBox(
            height: AppSize.s20Height,
            width: AppSize.s60Width,
            child: dialogDetails),
      ),
    );
  }
}
