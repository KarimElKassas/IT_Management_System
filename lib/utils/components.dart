import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:iconly/iconly.dart';
import 'package:it_work/data/models/area_model.dart';
import 'package:it_work/data/models/department_model.dart';
import 'package:it_work/data/models/graphic_card_size_model.dart';
import 'package:it_work/data/models/graphics_card_brand_model.dart';
import 'package:it_work/data/models/graphics_card_model_device_model.dart';
import 'package:it_work/data/models/hard_drive_size_model.dart';
import 'package:it_work/data/models/hard_drive_type_model.dart';
import 'package:it_work/data/models/pc_model_device_model.dart';
import 'package:it_work/data/models/processor_brand_model.dart';
import 'package:it_work/data/models/processor_core_gen_model.dart';
import 'package:it_work/data/models/processor_model_device_model.dart';
import 'package:it_work/data/models/ram_type_model.dart';
import 'package:it_work/data/models/screen_brand_model.dart';
import 'package:it_work/data/models/screen_size_model.dart';
import 'package:it_work/data/models/sector_model.dart';
import 'package:it_work/presentation/new_device/new_computer/bloc/new_computer_cubit.dart';
import 'package:it_work/presentation/new_device/new_computer/bloc/new_computer_states.dart';
import 'package:it_work/presentation/new_device/new_laptop/bloc/new_laptop_states.dart';
import 'package:it_work/presentation/new_device/new_pc_screen/bloc/new_pc_screen_cubit.dart';
import 'package:it_work/presentation/new_device/new_pc_screen/bloc/new_pc_screen_states.dart';
import 'dart:ui' as ui;
import '../presentation/new_device/new_laptop/bloc/new_laptop_cubit.dart';
import '../presentation/shared_cubit/new_info_cubit.dart';
import '../presentation/shared_cubit/new_info_states.dart';
import '../resources/asset_manager.dart';
import '../resources/color_manager.dart';
import '../resources/constants_manager.dart';
import '../resources/font_manager.dart';
import '../resources/language_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/values_manager.dart';
import 'constant.dart';
import 'package:dropdown_button2/dropdown_button2.dart';


class GetSectorsComponent extends StatelessWidget {
  GetSectorsComponent({Key? key,required this.fromRoute,  required this.cubit}) : super(key: key);
  final String fromRoute;
  dynamic cubit;
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    switch(fromRoute){
      case "New Pc Monitor":
        return BlocConsumer<NewPcScreenCubit, NewPcScreenStates>(
          bloc: cubit as NewPcScreenCubit,
          listener: (context, state){},
          builder: (context, state){
            return DropdownButtonHideUnderline(
              child: DropdownButton2<SectorModel>(
                isExpanded: true,
                hint: Text(
                  (cubit as NewPcScreenCubit).selectedSector == null ? AppStrings.selectSector : (cubit as NewPcScreenCubit).selectedSector!.sectorName,
                  style: TextStyle(
                    fontSize: AppSize.s14,
                    fontFamily: FontConstants.family,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                items: (cubit as NewPcScreenCubit).sectorsList
                    .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(
                    item.sectorName,
                    style: const TextStyle(
                      fontSize: AppSize.s14,
                    ),
                  ),
                ))
                    .toList(),
                value: (cubit as NewPcScreenCubit).selectedSector,
                onChanged: (value) {
                  (cubit as NewPcScreenCubit).changeSelectedSector(value!);
                },
                buttonStyleData: ButtonStyleData(
                    height: 40,
                    width: 220,
                    padding: const EdgeInsets.symmetric(horizontal: AppSize.s6, vertical: AppSize.s2),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorDark,
                      border: Border.all(color: Theme.of(context).primaryColorDark, width: AppSize.s1),
                      borderRadius: const BorderRadius.all(Radius.circular(AppSize.s6)),
                    )
                ),
                dropdownStyleData: DropdownStyleData(
                    maxHeight: 300,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorDark,
                        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(AppSize.s6), bottomRight: Radius.circular(AppSize.s6))
                    )
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                ),
                style: TextStyle(color: ColorManager.darkSecondColor),
                dropdownSearchData: DropdownSearchData(
                  searchController: textEditingController,
                  searchInnerWidgetHeight: 50,
                  searchInnerWidget: Container(
                    height: 50,
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 4,
                      right: 8,
                      left: 8,
                    ),
                    child: ReusableComponents.registerTextField(
                        context: context,
                        background: Colors.transparent,
                        borderColor: ColorManager.darkSecondColor,
                        textInputType: TextInputType.text,
                        hintText: AppStrings.searchForSector,
                        textStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        hintStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        textInputAction: TextInputAction.next,
                        suffixIcon: Icon(IconlyBroken.search, color: Theme.of(context).primaryColorLight),
                        controller: textEditingController,
                        validate: (value) {}, onChanged: (String? value) {}),
                  ),
                  searchMatchFn: (item, searchValue) {
                    return (item.value.toString().contains(searchValue));
                  },
                ),
                //This to clear the search value when you close the menu
                onMenuStateChange: (isOpen) {
                  if (!isOpen) {
                    textEditingController.clear();
                  }
                },
              ),
            );
          },
        );
      case "New Computer":
        return BlocConsumer<NewComputerCubit, NewComputerStates>(
          bloc: cubit as NewComputerCubit,
          listener: (context, state){},
          builder: (context, state){
            return DropdownButtonHideUnderline(
              child: DropdownButton2<SectorModel>(
                isExpanded: true,
                hint: Text(
                  (cubit as NewComputerCubit).selectedSector == null ? AppStrings.selectSector : (cubit as NewComputerCubit).selectedSector!.sectorName,
                  style: TextStyle(
                    fontSize: AppSize.s14,
                    fontFamily: FontConstants.family,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                items: (cubit as NewComputerCubit).sectorsList
                    .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(
                    item.sectorName,
                    style: const TextStyle(
                      fontSize: AppSize.s14,
                    ),
                  ),
                ))
                    .toList(),
                value: (cubit as NewComputerCubit).selectedSector,
                onChanged: (value) {
                  (cubit as NewComputerCubit).changeSelectedSector(value!);
                },
                buttonStyleData: ButtonStyleData(
                    height: 40,
                    width: 220,
                    padding: const EdgeInsets.symmetric(horizontal: AppSize.s6, vertical: AppSize.s2),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorDark,
                      border: Border.all(color: Theme.of(context).primaryColorDark, width: AppSize.s1),
                      borderRadius: const BorderRadius.all(Radius.circular(AppSize.s6)),
                    )
                ),
                dropdownStyleData: DropdownStyleData(
                    maxHeight: 300,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorDark,
                        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(AppSize.s6), bottomRight: Radius.circular(AppSize.s6))
                    )
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                ),
                style: TextStyle(color: ColorManager.darkSecondColor),
                dropdownSearchData: DropdownSearchData(
                  searchController: textEditingController,
                  searchInnerWidgetHeight: 50,
                  searchInnerWidget: Container(
                    height: 50,
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 4,
                      right: 8,
                      left: 8,
                    ),
                    child: ReusableComponents.registerTextField(
                        context: context,
                        background: Colors.transparent,
                        borderColor: ColorManager.darkSecondColor,
                        textInputType: TextInputType.text,
                        hintText: AppStrings.searchForSector,
                        textStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        hintStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        textInputAction: TextInputAction.next,
                        suffixIcon: Icon(IconlyBroken.search, color: Theme.of(context).primaryColorLight),
                        controller: textEditingController,
                        validate: (value) {}, onChanged: (String? value) {}),
                  ),
                  searchMatchFn: (item, searchValue) {
                    return (item.value.toString().contains(searchValue));
                  },
                ),
                //This to clear the search value when you close the menu
                onMenuStateChange: (isOpen) {
                  if (!isOpen) {
                    textEditingController.clear();
                  }
                },
              ),
            );
          },
        );
      case "New Info":
      return BlocConsumer<NewInfoCubit, NewInfoStates>(
        bloc: cubit as NewInfoCubit,
        listener: (context, state){},
        builder: (context, state){
          return DropdownButtonHideUnderline(
            child: DropdownButton2<SectorModel>(
              isExpanded: true,
              hint: Text(
                (cubit as NewInfoCubit).selectedSector == null ? AppStrings.selectSector : (cubit as NewInfoCubit).selectedSector!.sectorName,
                style: TextStyle(
                  fontSize: AppSize.s14,
                  fontFamily: FontConstants.family,
                  color: Theme.of(context).hintColor,
                ),
              ),
              items: (cubit as NewInfoCubit).sectorsList
                  .map((item) => DropdownMenuItem(
                value: item,
                child: Text(
                  item.sectorName,
                  style: const TextStyle(
                    fontSize: AppSize.s14,
                  ),
                ),
              ))
                  .toList(),
              value: (cubit as NewInfoCubit).selectedSector,
              onChanged: (value) {
                (cubit as NewInfoCubit).changeSelectedSector(value!);
              },
              buttonStyleData: ButtonStyleData(
                  height: 40,
                  width: 220,
                  padding: const EdgeInsets.symmetric(horizontal: AppSize.s6, vertical: AppSize.s2),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorDark,
                    border: Border.all(color: Theme.of(context).primaryColorDark, width: AppSize.s1),
                    borderRadius: const BorderRadius.all(Radius.circular(AppSize.s6)),
                  )
              ),
              dropdownStyleData: DropdownStyleData(
                  maxHeight: 300,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorDark,
                      borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(AppSize.s6), bottomRight: Radius.circular(AppSize.s6))
                  )
              ),
              menuItemStyleData: const MenuItemStyleData(
                height: 40,
              ),
              style: TextStyle(color: ColorManager.darkSecondColor),
              dropdownSearchData: DropdownSearchData(
                searchController: textEditingController,
                searchInnerWidgetHeight: 50,
                searchInnerWidget: Container(
                  height: 50,
                  padding: const EdgeInsets.only(
                    top: 8,
                    bottom: 4,
                    right: 8,
                    left: 8,
                  ),
                  child: ReusableComponents.registerTextField(
                      context: context,
                      background: Colors.transparent,
                      borderColor: ColorManager.darkSecondColor,
                      textInputType: TextInputType.text,
                      hintText: AppStrings.searchForSector,
                      textStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                      hintStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                      textInputAction: TextInputAction.next,
                      suffixIcon: Icon(IconlyBroken.search, color: Theme.of(context).primaryColorLight),
                      controller: textEditingController,
                      validate: (value) {}, onChanged: (String? value) {}),
                ),
                searchMatchFn: (item, searchValue) {
                  return (item.value.toString().contains(searchValue));
                },
              ),
              //This to clear the search value when you close the menu
              onMenuStateChange: (isOpen) {
                if (!isOpen) {
                  textEditingController.clear();
                }
              },
            ),
          );
        },
      );
      case "New Laptop":
      default:
        return BlocConsumer<NewLaptopCubit, NewLaptopStates>(
          bloc: cubit as NewLaptopCubit,
          listener: (context, state){},
          builder: (context, state){
            return DropdownButtonHideUnderline(
              child: DropdownButton2<SectorModel>(
                isExpanded: true,
                hint: Text(
                  (cubit as NewLaptopCubit).selectedSector == null ? AppStrings.selectSector : (cubit as NewLaptopCubit).selectedSector!.sectorName,
                  style: TextStyle(
                    fontSize: AppSize.s14,
                    fontFamily: FontConstants.family,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                items: (cubit as NewLaptopCubit).sectorsList
                    .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(
                    item.sectorName,
                    style: const TextStyle(
                      fontSize: AppSize.s14,
                    ),
                  ),
                ))
                    .toList(),
                value: (cubit as NewLaptopCubit).selectedSector,
                onChanged: (value) {
                  (cubit as NewLaptopCubit).changeSelectedSector(value!);
                },
                buttonStyleData: ButtonStyleData(
                    height: 40,
                    width: 220,
                    padding: const EdgeInsets.symmetric(horizontal: AppSize.s6, vertical: AppSize.s2),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorDark,
                      border: Border.all(color: Theme.of(context).primaryColorDark, width: AppSize.s1),
                      borderRadius: const BorderRadius.all(Radius.circular(AppSize.s6)),
                    )
                ),
                dropdownStyleData: DropdownStyleData(
                    maxHeight: 300,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorDark,
                        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(AppSize.s6), bottomRight: Radius.circular(AppSize.s6))
                    )
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                ),
                style: TextStyle(color: ColorManager.darkSecondColor),
                dropdownSearchData: DropdownSearchData(
                  searchController: textEditingController,
                  searchInnerWidgetHeight: 50,
                  searchInnerWidget: Container(
                    height: 50,
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 4,
                      right: 8,
                      left: 8,
                    ),
                    child: ReusableComponents.registerTextField(
                        context: context,
                        background: Colors.transparent,
                        borderColor: ColorManager.darkSecondColor,
                        textInputType: TextInputType.text,
                        hintText: AppStrings.searchForSector,
                        textStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        hintStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        textInputAction: TextInputAction.next,
                        suffixIcon: Icon(IconlyBroken.search, color: Theme.of(context).primaryColorLight),
                        controller: textEditingController,
                        validate: (value) {}, onChanged: (String? value) {}),
                  ),
                  searchMatchFn: (item, searchValue) {
                    return (item.value.toString().contains(searchValue));
                  },
                ),
                //This to clear the search value when you close the menu
                onMenuStateChange: (isOpen) {
                  if (!isOpen) {
                    textEditingController.clear();
                  }
                },
              ),
            );
          },
        );
    }
  }
}
class GetDepartmentsComponent extends StatelessWidget {
  GetDepartmentsComponent({Key? key,required this.fromRoute,  required this.cubit}) : super(key: key);
  final String fromRoute;
  dynamic cubit;
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    switch(fromRoute){
      case "New Pc Monitor":
        return BlocConsumer<NewPcScreenCubit, NewPcScreenStates>(
          bloc: cubit as NewPcScreenCubit,
          listener: (context, state){},
          builder: (context, state){
            return DropdownButtonHideUnderline(
              child: DropdownButton2<DepartmentModel>(
                isExpanded: true,
                hint: Text(
                  (cubit as NewPcScreenCubit).selectedDepartment == null ? AppStrings.selectDepartment : (cubit as NewPcScreenCubit).selectedDepartment!.departmentName,
                  style: TextStyle(
                    fontSize: AppSize.s14,
                    fontFamily: FontConstants.family,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                items: (cubit as NewPcScreenCubit).departmentsList
                    .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(
                    item.departmentName,
                    style: const TextStyle(
                      fontSize: AppSize.s14,
                    ),
                  ),
                ))
                    .toList(),
                value: (cubit as NewPcScreenCubit).selectedDepartment,
                onChanged: (value) {
                  (cubit as NewPcScreenCubit).changeSelectedDepartment(value!);
                },
                buttonStyleData: ButtonStyleData(
                    height: 40,
                    width: 220,
                    padding: const EdgeInsets.symmetric(horizontal: AppSize.s6, vertical: AppSize.s2),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorDark,
                      border: Border.all(color: Theme.of(context).primaryColorDark, width: AppSize.s1),
                      borderRadius: const BorderRadius.all(Radius.circular(AppSize.s6)),
                    )
                ),
                dropdownStyleData: DropdownStyleData(
                    maxHeight: 300,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorDark,
                        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(AppSize.s6), bottomRight: Radius.circular(AppSize.s6))
                    )
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                ),
                style: TextStyle(color: ColorManager.darkSecondColor),
                dropdownSearchData: DropdownSearchData(
                  searchController: textEditingController,
                  searchInnerWidgetHeight: 50,
                  searchInnerWidget: Container(
                    height: 50,
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 4,
                      right: 8,
                      left: 8,
                    ),
                    child: ReusableComponents.registerTextField(
                        context: context,
                        background: Colors.transparent,
                        borderColor: ColorManager.darkSecondColor,
                        textInputType: TextInputType.text,
                        hintText: AppStrings.searchForDepartment,
                        textStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        hintStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        textInputAction: TextInputAction.next,
                        suffixIcon: Icon(IconlyBroken.search, color: Theme.of(context).primaryColorLight),
                        controller: textEditingController,
                        validate: (value) {}, onChanged: (String? value) {}),
                  ),
                  searchMatchFn: (item, searchValue) {
                    return (item.value.toString().contains(searchValue));
                  },
                ),
                //This to clear the search value when you close the menu
                onMenuStateChange: (isOpen) {
                  if (!isOpen) {
                    textEditingController.clear();
                  }
                },
              ),
            );
          },
        );
      case "New Laptop":
        return BlocConsumer<NewLaptopCubit, NewLaptopStates>(
          bloc: cubit as NewLaptopCubit,
          listener: (context, state){},
          builder: (context, state){
            return DropdownButtonHideUnderline(
              child: DropdownButton2<DepartmentModel>(
                isExpanded: true,
                hint: Text(
                  (cubit as NewLaptopCubit).selectedDepartment == null ? AppStrings.selectDepartment : (cubit as NewLaptopCubit).selectedDepartment!.departmentName,
                  style: TextStyle(
                    fontSize: AppSize.s14,
                    fontFamily: FontConstants.family,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                items: (cubit as NewLaptopCubit).departmentsList
                    .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(
                    item.departmentName,
                    style: const TextStyle(
                      fontSize: AppSize.s14,
                    ),
                  ),
                ))
                    .toList(),
                value: (cubit as NewLaptopCubit).selectedDepartment,
                onChanged: (value) {
                  (cubit as NewLaptopCubit).changeSelectedDepartment(value!);
                },
                buttonStyleData: ButtonStyleData(
                    height: 40,
                    width: 220,
                    padding: const EdgeInsets.symmetric(horizontal: AppSize.s6, vertical: AppSize.s2),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorDark,
                      border: Border.all(color: Theme.of(context).primaryColorDark, width: AppSize.s1),
                      borderRadius: const BorderRadius.all(Radius.circular(AppSize.s6)),
                    )
                ),
                dropdownStyleData: DropdownStyleData(
                    maxHeight: 300,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorDark,
                        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(AppSize.s6), bottomRight: Radius.circular(AppSize.s6))
                    )
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                ),
                style: TextStyle(color: ColorManager.darkSecondColor),
                dropdownSearchData: DropdownSearchData(
                  searchController: textEditingController,
                  searchInnerWidgetHeight: 50,
                  searchInnerWidget: Container(
                    height: 50,
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 4,
                      right: 8,
                      left: 8,
                    ),
                    child: ReusableComponents.registerTextField(
                        context: context,
                        background: Colors.transparent,
                        borderColor: ColorManager.darkSecondColor,
                        textInputType: TextInputType.text,
                        hintText: AppStrings.searchForDepartment,
                        textStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        hintStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        textInputAction: TextInputAction.next,
                        suffixIcon: Icon(IconlyBroken.search, color: Theme.of(context).primaryColorLight),
                        controller: textEditingController,
                        validate: (value) {}, onChanged: (String? value) {}),
                  ),
                  searchMatchFn: (item, searchValue) {
                    return (item.value.toString().contains(searchValue));
                  },
                ),
                //This to clear the search value when you close the menu
                onMenuStateChange: (isOpen) {
                  if (!isOpen) {
                    textEditingController.clear();
                  }
                },
              ),
            );
          },
        );
      case "New Computer":
      default:
        return BlocConsumer<NewComputerCubit, NewComputerStates>(
          bloc: cubit as NewComputerCubit,
          listener: (context, state){},
          builder: (context, state){
            return DropdownButtonHideUnderline(
              child: DropdownButton2<DepartmentModel>(
                isExpanded: true,
                hint: Text(
                  (cubit as NewComputerCubit).selectedDepartment == null ? AppStrings.selectDepartment : (cubit as NewComputerCubit).selectedDepartment!.departmentName,
                  style: TextStyle(
                    fontSize: AppSize.s14,
                    fontFamily: FontConstants.family,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                items: (cubit as NewComputerCubit).departmentsList
                    .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(
                    item.departmentName,
                    style: const TextStyle(
                      fontSize: AppSize.s14,
                    ),
                  ),
                ))
                    .toList(),
                value: (cubit as NewComputerCubit).selectedDepartment,
                onChanged: (value) {
                  (cubit as NewComputerCubit).changeSelectedDepartment(value!);
                },
                buttonStyleData: ButtonStyleData(
                    height: 40,
                    width: 220,
                    padding: const EdgeInsets.symmetric(horizontal: AppSize.s6, vertical: AppSize.s2),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorDark,
                      border: Border.all(color: Theme.of(context).primaryColorDark, width: AppSize.s1),
                      borderRadius: const BorderRadius.all(Radius.circular(AppSize.s6)),
                    )
                ),
                dropdownStyleData: DropdownStyleData(
                    maxHeight: 300,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorDark,
                        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(AppSize.s6), bottomRight: Radius.circular(AppSize.s6))
                    )
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                ),
                style: TextStyle(color: ColorManager.darkSecondColor),
                dropdownSearchData: DropdownSearchData(
                  searchController: textEditingController,
                  searchInnerWidgetHeight: 50,
                  searchInnerWidget: Container(
                    height: 50,
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 4,
                      right: 8,
                      left: 8,
                    ),
                    child: ReusableComponents.registerTextField(
                        context: context,
                        background: Colors.transparent,
                        borderColor: ColorManager.darkSecondColor,
                        textInputType: TextInputType.text,
                        hintText: AppStrings.searchForDepartment,
                        textStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        hintStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        textInputAction: TextInputAction.next,
                        suffixIcon: Icon(IconlyBroken.search, color: Theme.of(context).primaryColorLight),
                        controller: textEditingController,
                        validate: (value) {}, onChanged: (String? value) {}),
                  ),
                  searchMatchFn: (item, searchValue) {
                    return (item.value.toString().contains(searchValue));
                  },
                ),
                //This to clear the search value when you close the menu
                onMenuStateChange: (isOpen) {
                  if (!isOpen) {
                    textEditingController.clear();
                  }
                },
              ),
            );
          },
        );

    }
  }
}
class GetAreasComponent extends StatelessWidget {
  GetAreasComponent({Key? key,required this.fromRoute,  required this.cubit}) : super(key: key);
  final String fromRoute;
  dynamic cubit;
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    switch(fromRoute){
      case "New Pc Monitor":
        return BlocConsumer<NewPcScreenCubit, NewPcScreenStates>(
          bloc: cubit as NewPcScreenCubit,
          listener: (context, state){},
          builder: (context, state){
            return DropdownButtonHideUnderline(
              child: DropdownButton2<AreaModel>(
                isExpanded: true,
                hint: Text(
                  (cubit as NewPcScreenCubit).selectedArea == null ? AppStrings.selectArea : (cubit as NewPcScreenCubit).selectedArea!.areaName,
                  style: TextStyle(
                    fontSize: AppSize.s14,
                    fontFamily: FontConstants.family,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                items: (cubit as NewPcScreenCubit).areasList
                    .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(
                    item.areaName,
                    style: const TextStyle(
                      fontSize: AppSize.s14,
                    ),
                  ),
                ))
                    .toList(),
                value: (cubit as NewPcScreenCubit).selectedArea,
                onChanged: (value) {
                  (cubit as NewPcScreenCubit).changeSelectedArea(value!);
                },
                buttonStyleData: ButtonStyleData(
                    height: 40,
                    width: 220,
                    padding: const EdgeInsets.symmetric(horizontal: AppSize.s6, vertical: AppSize.s2),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorDark,
                      border: Border.all(color: Theme.of(context).primaryColorDark, width: AppSize.s1),
                      borderRadius: const BorderRadius.all(Radius.circular(AppSize.s6)),
                    )
                ),
                dropdownStyleData: DropdownStyleData(
                    maxHeight: 300,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorDark,
                        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(AppSize.s6), bottomRight: Radius.circular(AppSize.s6))
                    )
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                ),
                style: TextStyle(color: ColorManager.darkSecondColor),
                dropdownSearchData: DropdownSearchData(
                  searchController: textEditingController,
                  searchInnerWidgetHeight: 50,
                  searchInnerWidget: Container(
                    height: 50,
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 4,
                      right: 8,
                      left: 8,
                    ),
                    child: ReusableComponents.registerTextField(
                        context: context,
                        background: Colors.transparent,
                        borderColor: ColorManager.darkSecondColor,
                        textInputType: TextInputType.text,
                        hintText: AppStrings.searchForArea,
                        textStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        hintStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        textInputAction: TextInputAction.next,
                        suffixIcon: Icon(IconlyBroken.search, color: Theme.of(context).primaryColorLight),
                        controller: textEditingController,
                        validate: (value) {}, onChanged: (String? value) {}),
                  ),
                  searchMatchFn: (item, searchValue) {
                    return (item.value.toString().contains(searchValue));
                  },
                ),
                //This to clear the search value when you close the menu
                onMenuStateChange: (isOpen) {
                  if (!isOpen) {
                    textEditingController.clear();
                  }
                },
              ),
            );
          },
        );
      case "New Laptop":
        return BlocConsumer<NewLaptopCubit, NewLaptopStates>(
          bloc: cubit as NewLaptopCubit,
          listener: (context, state){},
          builder: (context, state){
            return DropdownButtonHideUnderline(
              child: DropdownButton2<AreaModel>(
                isExpanded: true,
                hint: Text(
                  (cubit as NewLaptopCubit).selectedArea == null ? AppStrings.selectArea : (cubit as NewLaptopCubit).selectedArea!.areaName,
                  style: TextStyle(
                    fontSize: AppSize.s14,
                    fontFamily: FontConstants.family,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                items: (cubit as NewLaptopCubit).areasList
                    .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(
                    item.areaName,
                    style: const TextStyle(
                      fontSize: AppSize.s14,
                    ),
                  ),
                ))
                    .toList(),
                value: (cubit as NewLaptopCubit).selectedArea,
                onChanged: (value) {
                  (cubit as NewLaptopCubit).changeSelectedArea(value!);
                },
                buttonStyleData: ButtonStyleData(
                    height: 40,
                    width: 220,
                    padding: const EdgeInsets.symmetric(horizontal: AppSize.s6, vertical: AppSize.s2),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorDark,
                      border: Border.all(color: Theme.of(context).primaryColorDark, width: AppSize.s1),
                      borderRadius: const BorderRadius.all(Radius.circular(AppSize.s6)),
                    )
                ),
                dropdownStyleData: DropdownStyleData(
                    maxHeight: 300,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorDark,
                        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(AppSize.s6), bottomRight: Radius.circular(AppSize.s6))
                    )
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                ),
                style: TextStyle(color: ColorManager.darkSecondColor),
                dropdownSearchData: DropdownSearchData(
                  searchController: textEditingController,
                  searchInnerWidgetHeight: 50,
                  searchInnerWidget: Container(
                    height: 50,
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 4,
                      right: 8,
                      left: 8,
                    ),
                    child: ReusableComponents.registerTextField(
                        context: context,
                        background: Colors.transparent,
                        borderColor: ColorManager.darkSecondColor,
                        textInputType: TextInputType.text,
                        hintText: AppStrings.searchForArea,
                        textStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        hintStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        textInputAction: TextInputAction.next,
                        suffixIcon: Icon(IconlyBroken.search, color: Theme.of(context).primaryColorLight),
                        controller: textEditingController,
                        validate: (value) {}, onChanged: (String? value) {}),
                  ),
                  searchMatchFn: (item, searchValue) {
                    return (item.value.toString().contains(searchValue));
                  },
                ),
                //This to clear the search value when you close the menu
                onMenuStateChange: (isOpen) {
                  if (!isOpen) {
                    textEditingController.clear();
                  }
                },
              ),
            );
          },
        );
      case "New Computer":
      default:
        return BlocConsumer<NewComputerCubit, NewComputerStates>(
          bloc: cubit as NewComputerCubit,
          listener: (context, state){},
          builder: (context, state){
            return DropdownButtonHideUnderline(
              child: DropdownButton2<AreaModel>(
                isExpanded: true,
                hint: Text(
                  (cubit as NewComputerCubit).selectedArea == null ? AppStrings.selectArea : (cubit as NewComputerCubit).selectedArea!.areaName,
                  style: TextStyle(
                    fontSize: AppSize.s14,
                    fontFamily: FontConstants.family,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                items: (cubit as NewComputerCubit).areasList
                    .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(
                    item.areaName,
                    style: const TextStyle(
                      fontSize: AppSize.s14,
                    ),
                  ),
                ))
                    .toList(),
                value: (cubit as NewComputerCubit).selectedArea,
                onChanged: (value) {
                  (cubit as NewComputerCubit).changeSelectedArea(value!);
                },
                buttonStyleData: ButtonStyleData(
                    height: 40,
                    width: 220,
                    padding: const EdgeInsets.symmetric(horizontal: AppSize.s6, vertical: AppSize.s2),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorDark,
                      border: Border.all(color: Theme.of(context).primaryColorDark, width: AppSize.s1),
                      borderRadius: const BorderRadius.all(Radius.circular(AppSize.s6)),
                    )
                ),
                dropdownStyleData: DropdownStyleData(
                    maxHeight: 300,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorDark,
                        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(AppSize.s6), bottomRight: Radius.circular(AppSize.s6))
                    )
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                ),
                style: TextStyle(color: ColorManager.darkSecondColor),
                dropdownSearchData: DropdownSearchData(
                  searchController: textEditingController,
                  searchInnerWidgetHeight: 50,
                  searchInnerWidget: Container(
                    height: 50,
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 4,
                      right: 8,
                      left: 8,
                    ),
                    child: ReusableComponents.registerTextField(
                        context: context,
                        background: Colors.transparent,
                        borderColor: ColorManager.darkSecondColor,
                        textInputType: TextInputType.text,
                        hintText: AppStrings.searchForArea,
                        textStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        hintStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        textInputAction: TextInputAction.next,
                        suffixIcon: Icon(IconlyBroken.search, color: Theme.of(context).primaryColorLight),
                        controller: textEditingController,
                        validate: (value) {}, onChanged: (String? value) {}),
                  ),
                  searchMatchFn: (item, searchValue) {
                    return (item.value.toString().contains(searchValue));
                  },
                ),
                //This to clear the search value when you close the menu
                onMenuStateChange: (isOpen) {
                  if (!isOpen) {
                    textEditingController.clear();
                  }
                },
              ),
            );
          },
        );
    }
  }
}

class GetProcessorBrandComponent extends StatelessWidget {
  GetProcessorBrandComponent({Key? key,required this.fromRoute,  required this.cubit}) : super(key: key);
  final String fromRoute;
  dynamic cubit;
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    switch(fromRoute){
      case "New Laptop":
        return BlocConsumer<NewLaptopCubit, NewLaptopStates>(
          bloc: cubit as NewLaptopCubit,
          listener: (context, state){},
          builder: (context, state){
            return DropdownButtonHideUnderline(
              child: DropdownButton2<ProcessorBrandModel>(
                isExpanded: true,
                hint: Text(
                  (cubit as NewLaptopCubit).selectedProcessorBrand == null ? AppStrings.selectBrand : (cubit as NewLaptopCubit).selectedProcessorBrand!.processorBrandName,
                  style: TextStyle(
                    fontSize: AppSize.s14,
                    fontFamily: FontConstants.family,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                items: (cubit as NewLaptopCubit).processorBrandList
                    .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(
                    item.processorBrandName,
                    style: const TextStyle(
                      fontSize: AppSize.s14,
                    ),
                  ),
                ))
                    .toList(),
                value: (cubit as NewLaptopCubit).selectedProcessorBrand,
                onChanged: (value) {
                  (cubit as NewLaptopCubit).changeSelectedProcessorBrand(value!);
                },
                buttonStyleData: ButtonStyleData(
                    height: 40,
                    width: 220,
                    padding: const EdgeInsets.symmetric(horizontal: AppSize.s6, vertical: AppSize.s2),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorDark,
                      border: Border.all(color: Theme.of(context).primaryColorDark, width: AppSize.s1),
                      borderRadius: const BorderRadius.all(Radius.circular(AppSize.s6)),
                    )
                ),
                dropdownStyleData: DropdownStyleData(
                    maxHeight: 300,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorDark,
                        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(AppSize.s6), bottomRight: Radius.circular(AppSize.s6))
                    )
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                ),
                style: TextStyle(color: ColorManager.darkSecondColor),
                dropdownSearchData: DropdownSearchData(
                  searchController: textEditingController,
                  searchInnerWidgetHeight: 50,
                  searchInnerWidget: Container(
                    height: 50,
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 4,
                      right: 8,
                      left: 8,
                    ),
                    child: ReusableComponents.registerTextField(
                        context: context,
                        background: Colors.transparent,
                        borderColor: ColorManager.darkSecondColor,
                        textInputType: TextInputType.text,
                        hintText: AppStrings.searchForBrand,
                        textStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        hintStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        textInputAction: TextInputAction.next,
                        suffixIcon: Icon(IconlyBroken.search, color: Theme.of(context).primaryColorLight),
                        controller: textEditingController,
                        validate: (value) {}, onChanged: (String? value) {}),
                  ),
                  searchMatchFn: (item, searchValue) {
                    return (item.value.toString().contains(searchValue));
                  },
                ),
                //This to clear the search value when you close the menu
                onMenuStateChange: (isOpen) {
                  if (!isOpen) {
                    textEditingController.clear();
                  }
                },
              ),
            );
          },
        );
      case "New Computer":
        return BlocConsumer<NewComputerCubit, NewComputerStates>(
          bloc: cubit as NewComputerCubit,
          listener: (context, state){},
          builder: (context, state){
            return DropdownButtonHideUnderline(
              child: DropdownButton2<ProcessorBrandModel>(
                isExpanded: true,
                hint: Text(
                  (cubit as NewComputerCubit).selectedProcessorBrand == null ? AppStrings.selectBrand : (cubit as NewComputerCubit).selectedProcessorBrand!.processorBrandName,
                  style: TextStyle(
                    fontSize: AppSize.s14,
                    fontFamily: FontConstants.family,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                items: (cubit as NewComputerCubit).processorBrandList
                    .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(
                    item.processorBrandName,
                    style: const TextStyle(
                      fontSize: AppSize.s14,
                    ),
                  ),
                ))
                    .toList(),
                value: (cubit as NewComputerCubit).selectedProcessorBrand,
                onChanged: (value) {
                  (cubit as NewComputerCubit).changeSelectedProcessorBrand(value!);
                },
                buttonStyleData: ButtonStyleData(
                    height: 40,
                    width: 220,
                    padding: const EdgeInsets.symmetric(horizontal: AppSize.s6, vertical: AppSize.s2),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorDark,
                      border: Border.all(color: Theme.of(context).primaryColorDark, width: AppSize.s1),
                      borderRadius: const BorderRadius.all(Radius.circular(AppSize.s6)),
                    )
                ),
                dropdownStyleData: DropdownStyleData(
                    maxHeight: 300,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorDark,
                        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(AppSize.s6), bottomRight: Radius.circular(AppSize.s6))
                    )
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                ),
                style: TextStyle(color: ColorManager.darkSecondColor),
                dropdownSearchData: DropdownSearchData(
                  searchController: textEditingController,
                  searchInnerWidgetHeight: 50,
                  searchInnerWidget: Container(
                    height: 50,
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 4,
                      right: 8,
                      left: 8,
                    ),
                    child: ReusableComponents.registerTextField(
                        context: context,
                        background: Colors.transparent,
                        borderColor: ColorManager.darkSecondColor,
                        textInputType: TextInputType.text,
                        hintText: AppStrings.searchForBrand,
                        textStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        hintStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        textInputAction: TextInputAction.next,
                        suffixIcon: Icon(IconlyBroken.search, color: Theme.of(context).primaryColorLight),
                        controller: textEditingController,
                        validate: (value) {}, onChanged: (String? value) {}),
                  ),
                  searchMatchFn: (item, searchValue) {
                    return (item.value.toString().contains(searchValue));
                  },
                ),
                //This to clear the search value when you close the menu
                onMenuStateChange: (isOpen) {
                  if (!isOpen) {
                    textEditingController.clear();
                  }
                },
              ),
            );
          },
        );
      case "New Info":
        return BlocConsumer<NewInfoCubit, NewInfoStates>(
          bloc: cubit as NewInfoCubit,
          listener: (context, state){},
          builder: (context, state){
            return DropdownButtonHideUnderline(
              child: DropdownButton2<ProcessorBrandModel>(
                isExpanded: true,
                autofocus: true,
                hint: Text(
                  (cubit as NewInfoCubit).selectedBrand == null ? AppStrings.selectBrand : (cubit as NewInfoCubit).selectedBrand!.processorBrandName,
                  style: TextStyle(
                    fontSize: AppSize.s14,
                    fontFamily: FontConstants.family,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                items: (cubit as NewInfoCubit).brandsList
                    .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(
                    item.processorBrandName,
                    style: const TextStyle(
                      fontSize: AppSize.s14,
                    ),
                  ),
                ))
                    .toList(),
                value: (cubit as NewInfoCubit).selectedBrand,
                onChanged: (value) {
                  (cubit as NewInfoCubit).changeSelectedProcessorBrand(value!);
                },
                buttonStyleData: ButtonStyleData(
                    height: 40,
                    width: 220,
                    padding: const EdgeInsets.symmetric(horizontal: AppSize.s6, vertical: AppSize.s2),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorDark,
                      border: Border.all(color: Theme.of(context).primaryColorDark, width: AppSize.s1),
                      borderRadius: const BorderRadius.all(Radius.circular(AppSize.s6)),
                    )
                ),
                dropdownStyleData: DropdownStyleData(
                    maxHeight: 300,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorDark,
                        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(AppSize.s6), bottomRight: Radius.circular(AppSize.s6))
                    )
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                ),
                style: TextStyle(color: ColorManager.darkSecondColor),
                dropdownSearchData: DropdownSearchData(
                  searchController: textEditingController,
                  searchInnerWidgetHeight: 50,
                  searchInnerWidget: Container(
                    height: 50,
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 4,
                      right: 8,
                      left: 8,
                    ),
                    child: ReusableComponents.registerTextField(
                        context: context,
                        background: Colors.transparent,
                        borderColor: ColorManager.darkSecondColor,
                        textInputType: TextInputType.text,
                        hintText: AppStrings.searchForSector,
                        textStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        hintStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        textInputAction: TextInputAction.next,
                        suffixIcon: Icon(IconlyBroken.search, color: Theme.of(context).primaryColorLight),
                        controller: textEditingController,
                        validate: (value) {}, onChanged: (String? value) {}),
                  ),
                  searchMatchFn: (item, searchValue) {
                    return (item.value.toString().contains(searchValue));
                  },
                ),
                //This to clear the search value when you close the menu
                onMenuStateChange: (isOpen) {
                  if (!isOpen) {
                    textEditingController.clear();
                  }
                },
              ),
            );
          },
        );
      default:
        return BlocConsumer<NewComputerCubit, NewComputerStates>(
          bloc: cubit as NewComputerCubit,
          listener: (context, state){},
          builder: (context, state){
            return DropdownButtonHideUnderline(
              child: DropdownButton2<ProcessorBrandModel>(
                isExpanded: true,
                hint: Text(
                  (cubit as NewComputerCubit).selectedProcessorBrand == null ? AppStrings.selectBrand : (cubit as NewComputerCubit).selectedProcessorBrand!.processorBrandName,
                  style: TextStyle(
                    fontSize: AppSize.s14,
                    fontFamily: FontConstants.family,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                items: (cubit as NewComputerCubit).processorBrandList
                    .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(
                    item.processorBrandName,
                    style: const TextStyle(
                      fontSize: AppSize.s14,
                    ),
                  ),
                ))
                    .toList(),
                value: (cubit as NewComputerCubit).selectedProcessorBrand,
                onChanged: (value) {
                  (cubit as NewComputerCubit).changeSelectedProcessorBrand(value!);
                },
                buttonStyleData: ButtonStyleData(
                    height: 40,
                    width: 220,
                    padding: const EdgeInsets.symmetric(horizontal: AppSize.s6, vertical: AppSize.s2),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorDark,
                      border: Border.all(color: Theme.of(context).primaryColorDark, width: AppSize.s1),
                      borderRadius: const BorderRadius.all(Radius.circular(AppSize.s6)),
                    )
                ),
                dropdownStyleData: DropdownStyleData(
                    maxHeight: 300,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorDark,
                        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(AppSize.s6), bottomRight: Radius.circular(AppSize.s6))
                    )
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                ),
                style: TextStyle(color: ColorManager.darkSecondColor),
                dropdownSearchData: DropdownSearchData(
                  searchController: textEditingController,
                  searchInnerWidgetHeight: 50,
                  searchInnerWidget: Container(
                    height: 50,
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 4,
                      right: 8,
                      left: 8,
                    ),
                    child: ReusableComponents.registerTextField(
                        context: context,
                        background: Colors.transparent,
                        borderColor: ColorManager.darkSecondColor,
                        textInputType: TextInputType.text,
                        hintText: AppStrings.searchForBrand,
                        textStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        hintStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        textInputAction: TextInputAction.next,
                        suffixIcon: Icon(IconlyBroken.search, color: Theme.of(context).primaryColorLight),
                        controller: textEditingController,
                        validate: (value) {}, onChanged: (String? value) {}),
                  ),
                  searchMatchFn: (item, searchValue) {
                    return (item.value.toString().contains(searchValue));
                  },
                ),
                //This to clear the search value when you close the menu
                onMenuStateChange: (isOpen) {
                  if (!isOpen) {
                    textEditingController.clear();
                  }
                },
              ),
            );
          },
        );
    }
  }
}
class GetProcessorModelComponent extends StatelessWidget {
  GetProcessorModelComponent({Key? key,required this.fromRoute,  required this.cubit}) : super(key: key);
  final String fromRoute;
  dynamic cubit;
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    switch(fromRoute){
      case "New Laptop":
        return BlocConsumer<NewLaptopCubit, NewLaptopStates>(
          bloc: cubit as NewLaptopCubit,
          listener: (context, state){},
          builder: (context, state){
            return DropdownButtonHideUnderline(
              child: DropdownButton2<ProcessorModelDeviceModel>(
                isExpanded: true,
                hint: Text(
                  (cubit as NewLaptopCubit).selectedProcessorModel == null ? AppStrings.selectModel : (cubit as NewLaptopCubit).selectedProcessorModel!.processorModelName,
                  style: TextStyle(
                    fontSize: AppSize.s14,
                    fontFamily: FontConstants.family,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                items: (cubit as NewLaptopCubit).processorModelList
                    .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(
                    item.processorModelName,
                    style: const TextStyle(
                      fontSize: AppSize.s14,
                    ),
                  ),
                ))
                    .toList(),
                value: (cubit as NewLaptopCubit).selectedProcessorModel,
                onChanged: (value) {
                  (cubit as NewLaptopCubit).changeSelectedProcessorModel(value!);
                },
                buttonStyleData: ButtonStyleData(
                    height: 40,
                    width: 220,
                    padding: const EdgeInsets.symmetric(horizontal: AppSize.s6, vertical: AppSize.s2),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorDark,
                      border: Border.all(color: Theme.of(context).primaryColorDark, width: AppSize.s1),
                      borderRadius: const BorderRadius.all(Radius.circular(AppSize.s6)),
                    )
                ),
                dropdownStyleData: DropdownStyleData(
                    maxHeight: 300,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorDark,
                        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(AppSize.s6), bottomRight: Radius.circular(AppSize.s6))
                    )
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                ),
                style: TextStyle(color: ColorManager.darkSecondColor),
                dropdownSearchData: DropdownSearchData(
                  searchController: textEditingController,
                  searchInnerWidgetHeight: 50,
                  searchInnerWidget: Container(
                    height: 50,
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 4,
                      right: 8,
                      left: 8,
                    ),
                    child: ReusableComponents.registerTextField(
                        context: context,
                        background: Colors.transparent,
                        borderColor: ColorManager.darkSecondColor,
                        textInputType: TextInputType.text,
                        hintText: AppStrings.searchForModel,
                        textStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        hintStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        textInputAction: TextInputAction.next,
                        suffixIcon: Icon(IconlyBroken.search, color: Theme.of(context).primaryColorLight),
                        controller: textEditingController,
                        validate: (value) {}, onChanged: (String? value) {}),
                  ),
                  searchMatchFn: (item, searchValue) {
                    return (item.value.toString().contains(searchValue));
                  },
                ),
                //This to clear the search value when you close the menu
                onMenuStateChange: (isOpen) {
                  if (!isOpen) {
                    textEditingController.clear();
                  }
                },
              ),
            );
          },
        );
      case "New Computer":
      default:
        return BlocConsumer<NewComputerCubit, NewComputerStates>(
          bloc: cubit as NewComputerCubit,
          listener: (context, state){},
          builder: (context, state){
            return DropdownButtonHideUnderline(
              child: DropdownButton2<ProcessorModelDeviceModel>(
                isExpanded: true,
                hint: Text(
                  (cubit as NewComputerCubit).selectedProcessorModel == null ? AppStrings.selectModel : (cubit as NewComputerCubit).selectedProcessorModel!.processorModelName,
                  style: TextStyle(
                    fontSize: AppSize.s14,
                    fontFamily: FontConstants.family,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                items: (cubit as NewComputerCubit).processorModelList
                    .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(
                    item.processorModelName,
                    style: const TextStyle(
                      fontSize: AppSize.s14,
                    ),
                  ),
                ))
                    .toList(),
                value: (cubit as NewComputerCubit).selectedProcessorModel,
                onChanged: (value) {
                  (cubit as NewComputerCubit).changeSelectedProcessorModel(value!);
                },
                buttonStyleData: ButtonStyleData(
                    height: 40,
                    width: 220,
                    padding: const EdgeInsets.symmetric(horizontal: AppSize.s6, vertical: AppSize.s2),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorDark,
                      border: Border.all(color: Theme.of(context).primaryColorDark, width: AppSize.s1),
                      borderRadius: const BorderRadius.all(Radius.circular(AppSize.s6)),
                    )
                ),
                dropdownStyleData: DropdownStyleData(
                    maxHeight: 300,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorDark,
                        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(AppSize.s6), bottomRight: Radius.circular(AppSize.s6))
                    )
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                ),
                style: TextStyle(color: ColorManager.darkSecondColor),
                dropdownSearchData: DropdownSearchData(
                  searchController: textEditingController,
                  searchInnerWidgetHeight: 50,
                  searchInnerWidget: Container(
                    height: 50,
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 4,
                      right: 8,
                      left: 8,
                    ),
                    child: ReusableComponents.registerTextField(
                        context: context,
                        background: Colors.transparent,
                        borderColor: ColorManager.darkSecondColor,
                        textInputType: TextInputType.text,
                        hintText: AppStrings.searchForModel,
                        textStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        hintStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        textInputAction: TextInputAction.next,
                        suffixIcon: Icon(IconlyBroken.search, color: Theme.of(context).primaryColorLight),
                        controller: textEditingController,
                        validate: (value) {}, onChanged: (String? value) {}),
                  ),
                  searchMatchFn: (item, searchValue) {
                    return (item.value.toString().contains(searchValue));
                  },
                ),
                //This to clear the search value when you close the menu
                onMenuStateChange: (isOpen) {
                  if (!isOpen) {
                    textEditingController.clear();
                  }
                },
              ),
            );
          },
        );
    }
  }
}
class GetProcessorGenComponent extends StatelessWidget {
  GetProcessorGenComponent({Key? key,required this.fromRoute,  required this.cubit}) : super(key: key);
  final String fromRoute;
  dynamic cubit;
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    switch(fromRoute){
      case "New Laptop":
        return BlocConsumer<NewLaptopCubit, NewLaptopStates>(
          bloc: cubit as NewLaptopCubit,
          listener: (context, state){},
          builder: (context, state){
            return DropdownButtonHideUnderline(
              child: DropdownButton2<ProcessorCoreGenModel>(
                isExpanded: true,
                hint: Text(
                  (cubit as NewLaptopCubit).selectedProcessorCoreGen == null ? AppStrings.selectGen : (cubit as NewLaptopCubit).selectedProcessorCoreGen!.processorCoreGenName,
                  style: TextStyle(
                    fontSize: AppSize.s14,
                    fontFamily: FontConstants.family,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                items: (cubit as NewLaptopCubit).processorCoreGenList
                    .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(
                    item.processorCoreGenName,
                    style: const TextStyle(
                      fontSize: AppSize.s14,
                    ),
                  ),
                ))
                    .toList(),
                value: (cubit as NewLaptopCubit).selectedProcessorCoreGen,
                onChanged: (value) {
                  (cubit as NewLaptopCubit).changeSelectedProcessorCoreGen(value!);
                },
                buttonStyleData: ButtonStyleData(
                    height: 40,
                    width: 220,
                    padding: const EdgeInsets.symmetric(horizontal: AppSize.s6, vertical: AppSize.s2),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorDark,
                      border: Border.all(color: Theme.of(context).primaryColorDark, width: AppSize.s1),
                      borderRadius: const BorderRadius.all(Radius.circular(AppSize.s6)),
                    )
                ),
                dropdownStyleData: DropdownStyleData(
                    maxHeight: 300,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorDark,
                        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(AppSize.s6), bottomRight: Radius.circular(AppSize.s6))
                    )
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                ),
                style: TextStyle(color: ColorManager.darkSecondColor),
                dropdownSearchData: DropdownSearchData(
                  searchController: textEditingController,
                  searchInnerWidgetHeight: 50,
                  searchInnerWidget: Container(
                    height: 50,
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 4,
                      right: 8,
                      left: 8,
                    ),
                    child: ReusableComponents.registerTextField(
                        context: context,
                        background: Colors.transparent,
                        borderColor: ColorManager.darkSecondColor,
                        textInputType: TextInputType.text,
                        hintText: AppStrings.searchForGen,
                        textStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        hintStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        textInputAction: TextInputAction.next,
                        suffixIcon: Icon(IconlyBroken.search, color: Theme.of(context).primaryColorLight),
                        controller: textEditingController,
                        validate: (value) {}, onChanged: (String? value) {}),
                  ),
                  searchMatchFn: (item, searchValue) {
                    return (item.value.toString().contains(searchValue));
                  },
                ),
                //This to clear the search value when you close the menu
                onMenuStateChange: (isOpen) {
                  if (!isOpen) {
                    textEditingController.clear();
                  }
                },
              ),
            );
          },
        );
      case "New Computer":
      default:
        return BlocConsumer<NewComputerCubit, NewComputerStates>(
          bloc: cubit as NewComputerCubit,
          listener: (context, state){},
          builder: (context, state){
            return DropdownButtonHideUnderline(
              child: DropdownButton2<ProcessorCoreGenModel>(
                isExpanded: true,
                hint: Text(
                  (cubit as NewComputerCubit).selectedProcessorCoreGen == null ? AppStrings.selectGen : (cubit as NewComputerCubit).selectedProcessorCoreGen!.processorCoreGenName,
                  style: TextStyle(
                    fontSize: AppSize.s14,
                    fontFamily: FontConstants.family,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                items: (cubit as NewComputerCubit).processorCoreGenList
                    .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(
                    item.processorCoreGenName,
                    style: const TextStyle(
                      fontSize: AppSize.s14,
                    ),
                  ),
                ))
                    .toList(),
                value: (cubit as NewComputerCubit).selectedProcessorCoreGen,
                onChanged: (value) {
                  (cubit as NewComputerCubit).changeSelectedProcessorCoreGen(value!);
                },
                buttonStyleData: ButtonStyleData(
                    height: 40,
                    width: 220,
                    padding: const EdgeInsets.symmetric(horizontal: AppSize.s6, vertical: AppSize.s2),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorDark,
                      border: Border.all(color: Theme.of(context).primaryColorDark, width: AppSize.s1),
                      borderRadius: const BorderRadius.all(Radius.circular(AppSize.s6)),
                    )
                ),
                dropdownStyleData: DropdownStyleData(
                    maxHeight: 300,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorDark,
                        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(AppSize.s6), bottomRight: Radius.circular(AppSize.s6))
                    )
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                ),
                style: TextStyle(color: ColorManager.darkSecondColor),
                dropdownSearchData: DropdownSearchData(
                  searchController: textEditingController,
                  searchInnerWidgetHeight: 50,
                  searchInnerWidget: Container(
                    height: 50,
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 4,
                      right: 8,
                      left: 8,
                    ),
                    child: ReusableComponents.registerTextField(
                        context: context,
                        background: Colors.transparent,
                        borderColor: ColorManager.darkSecondColor,
                        textInputType: TextInputType.text,
                        hintText: AppStrings.searchForGen,
                        textStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        hintStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        textInputAction: TextInputAction.next,
                        suffixIcon: Icon(IconlyBroken.search, color: Theme.of(context).primaryColorLight),
                        controller: textEditingController,
                        validate: (value) {}, onChanged: (String? value) {}),
                  ),
                  searchMatchFn: (item, searchValue) {
                    return (item.value.toString().contains(searchValue));
                  },
                ),
                //This to clear the search value when you close the menu
                onMenuStateChange: (isOpen) {
                  if (!isOpen) {
                    textEditingController.clear();
                  }
                },
              ),
            );
          },
        );
    }
  }
}

class GetGraphicBrandComponent extends StatelessWidget {
  GetGraphicBrandComponent({Key? key,required this.fromRoute,  required this.cubit}) : super(key: key);
  final String fromRoute;
  dynamic cubit;
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    switch(fromRoute){
      case "New Laptop":
        return BlocConsumer<NewLaptopCubit, NewLaptopStates>(
          bloc: cubit as NewLaptopCubit,
          listener: (context, state){},
          builder: (context, state){
            return DropdownButtonHideUnderline(
              child: DropdownButton2<GraphicsCardBrandModel>(
                isExpanded: true,
                hint: Text(
                  (cubit as NewLaptopCubit).selectedGraphicBrand == null ? AppStrings.selectBrand : (cubit as NewLaptopCubit).selectedGraphicBrand!.graphicsCardBrandName,
                  style: TextStyle(
                    fontSize: AppSize.s14,
                    fontFamily: FontConstants.family,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                items: (cubit as NewLaptopCubit).graphicBrandsList
                    .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(
                    item.graphicsCardBrandName,
                    style: const TextStyle(
                      fontSize: AppSize.s14,
                    ),
                  ),
                ))
                    .toList(),
                value: (cubit as NewLaptopCubit).selectedGraphicBrand,
                onChanged: (value) {
                  (cubit as NewLaptopCubit).changeSelectedGraphicBrand(value!);
                },
                buttonStyleData: ButtonStyleData(
                    height: 40,
                    width: 220,
                    padding: const EdgeInsets.symmetric(horizontal: AppSize.s6, vertical: AppSize.s2),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorDark,
                      border: Border.all(color: Theme.of(context).primaryColorDark, width: AppSize.s1),
                      borderRadius: const BorderRadius.all(Radius.circular(AppSize.s6)),
                    )
                ),
                dropdownStyleData: DropdownStyleData(
                    maxHeight: 300,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorDark,
                        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(AppSize.s6), bottomRight: Radius.circular(AppSize.s6))
                    )
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                ),
                style: TextStyle(color: ColorManager.darkSecondColor),
                dropdownSearchData: DropdownSearchData(
                  searchController: textEditingController,
                  searchInnerWidgetHeight: 50,
                  searchInnerWidget: Container(
                    height: 50,
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 4,
                      right: 8,
                      left: 8,
                    ),
                    child: ReusableComponents.registerTextField(
                        context: context,
                        background: Colors.transparent,
                        borderColor: ColorManager.darkSecondColor,
                        textInputType: TextInputType.text,
                        hintText: AppStrings.searchForBrand,
                        textStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        hintStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        textInputAction: TextInputAction.next,
                        suffixIcon: Icon(IconlyBroken.search, color: Theme.of(context).primaryColorLight),
                        controller: textEditingController,
                        validate: (value) {}, onChanged: (String? value) {}),
                  ),
                  searchMatchFn: (item, searchValue) {
                    return (item.value.toString().contains(searchValue));
                  },
                ),
                //This to clear the search value when you close the menu
                onMenuStateChange: (isOpen) {
                  if (!isOpen) {
                    textEditingController.clear();
                  }
                },
              ),
            );
          },
        );
      case "New Computer":
        return BlocConsumer<NewComputerCubit, NewComputerStates>(
          bloc: cubit as NewComputerCubit,
          listener: (context, state){},
          builder: (context, state){
            return DropdownButtonHideUnderline(
              child: DropdownButton2<GraphicsCardBrandModel>(
                isExpanded: true,
                hint: Text(
                  (cubit as NewComputerCubit).selectedGraphicBrand == null ? AppStrings.selectBrand : (cubit as NewComputerCubit).selectedGraphicBrand!.graphicsCardBrandName,
                  style: TextStyle(
                    fontSize: AppSize.s14,
                    fontFamily: FontConstants.family,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                items: (cubit as NewComputerCubit).graphicBrandsList
                    .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(
                    item.graphicsCardBrandName,
                    style: const TextStyle(
                      fontSize: AppSize.s14,
                    ),
                  ),
                ))
                    .toList(),
                value: (cubit as NewComputerCubit).selectedGraphicBrand,
                onChanged: (value) {
                  (cubit as NewComputerCubit).changeSelectedGraphicBrand(value!);
                },
                buttonStyleData: ButtonStyleData(
                    height: 40,
                    width: 220,
                    padding: const EdgeInsets.symmetric(horizontal: AppSize.s6, vertical: AppSize.s2),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorDark,
                      border: Border.all(color: Theme.of(context).primaryColorDark, width: AppSize.s1),
                      borderRadius: const BorderRadius.all(Radius.circular(AppSize.s6)),
                    )
                ),
                dropdownStyleData: DropdownStyleData(
                    maxHeight: 300,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorDark,
                        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(AppSize.s6), bottomRight: Radius.circular(AppSize.s6))
                    )
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                ),
                style: TextStyle(color: ColorManager.darkSecondColor),
                dropdownSearchData: DropdownSearchData(
                  searchController: textEditingController,
                  searchInnerWidgetHeight: 50,
                  searchInnerWidget: Container(
                    height: 50,
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 4,
                      right: 8,
                      left: 8,
                    ),
                    child: ReusableComponents.registerTextField(
                        context: context,
                        background: Colors.transparent,
                        borderColor: ColorManager.darkSecondColor,
                        textInputType: TextInputType.text,
                        hintText: AppStrings.searchForBrand,
                        textStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        hintStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        textInputAction: TextInputAction.next,
                        suffixIcon: Icon(IconlyBroken.search, color: Theme.of(context).primaryColorLight),
                        controller: textEditingController,
                        validate: (value) {}, onChanged: (String? value) {}),
                  ),
                  searchMatchFn: (item, searchValue) {
                    return (item.value.toString().contains(searchValue));
                  },
                ),
                //This to clear the search value when you close the menu
                onMenuStateChange: (isOpen) {
                  if (!isOpen) {
                    textEditingController.clear();
                  }
                },
              ),
            );
          },
        );
      case "New Info" :
        return BlocConsumer<NewInfoCubit, NewInfoStates>(
          bloc: cubit as NewInfoCubit,
          listener: (context, state){},
          builder: (context, state){
            return DropdownButtonHideUnderline(
              child: DropdownButton2<GraphicsCardBrandModel>(
                isExpanded: true,
                autofocus: true,
                hint: Text(
                  (cubit as NewInfoCubit).selectedGraphicBrand == null ? AppStrings.selectBrand : (cubit as NewInfoCubit).selectedGraphicBrand!.graphicsCardBrandName,
                  style: TextStyle(
                    fontSize: AppSize.s14,
                    fontFamily: FontConstants.family,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                items: (cubit as NewInfoCubit).graphicBrandsList
                    .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(
                    item.graphicsCardBrandName,
                    style: const TextStyle(
                      fontSize: AppSize.s14,
                    ),
                  ),
                ))
                    .toList(),
                value: (cubit as NewInfoCubit).selectedGraphicBrand,
                onChanged: (value) {
                  (cubit as NewInfoCubit).changeSelectedGraphicBrand(value!);
                },
                buttonStyleData: ButtonStyleData(
                    height: 40,
                    width: 220,
                    padding: const EdgeInsets.symmetric(horizontal: AppSize.s6, vertical: AppSize.s2),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorDark,
                      border: Border.all(color: Theme.of(context).primaryColorDark, width: AppSize.s1),
                      borderRadius: const BorderRadius.all(Radius.circular(AppSize.s6)),
                    )
                ),
                dropdownStyleData: DropdownStyleData(
                    maxHeight: 300,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorDark,
                        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(AppSize.s6), bottomRight: Radius.circular(AppSize.s6))
                    )
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                ),
                style: TextStyle(color: ColorManager.darkSecondColor),
                dropdownSearchData: DropdownSearchData(
                  searchController: textEditingController,
                  searchInnerWidgetHeight: 50,
                  searchInnerWidget: Container(
                    height: 50,
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 4,
                      right: 8,
                      left: 8,
                    ),
                    child: ReusableComponents.registerTextField(
                        context: context,
                        background: Colors.transparent,
                        borderColor: ColorManager.darkSecondColor,
                        textInputType: TextInputType.text,
                        hintText: AppStrings.searchForSector,
                        textStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        hintStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        textInputAction: TextInputAction.next,
                        suffixIcon: Icon(IconlyBroken.search, color: Theme.of(context).primaryColorLight),
                        controller: textEditingController,
                        validate: (value) {}, onChanged: (String? value) {}),
                  ),
                  searchMatchFn: (item, searchValue) {
                    return (item.value.toString().contains(searchValue));
                  },
                ),
                //This to clear the search value when you close the menu
                onMenuStateChange: (isOpen) {
                  if (!isOpen) {
                    textEditingController.clear();
                  }
                },
              ),
            );
          },
        );
      default:
        return BlocConsumer<NewComputerCubit, NewComputerStates>(
          bloc: cubit as NewComputerCubit,
          listener: (context, state){},
          builder: (context, state){
            return DropdownButtonHideUnderline(
              child: DropdownButton2<GraphicsCardBrandModel>(
                isExpanded: true,
                hint: Text(
                  (cubit as NewComputerCubit).selectedGraphicBrand == null ? AppStrings.selectBrand : (cubit as NewComputerCubit).selectedGraphicBrand!.graphicsCardBrandName,
                  style: TextStyle(
                    fontSize: AppSize.s14,
                    fontFamily: FontConstants.family,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                items: (cubit as NewComputerCubit).graphicBrandsList
                    .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(
                    item.graphicsCardBrandName,
                    style: const TextStyle(
                      fontSize: AppSize.s14,
                    ),
                  ),
                ))
                    .toList(),
                value: (cubit as NewComputerCubit).selectedGraphicBrand,
                onChanged: (value) {
                  (cubit as NewComputerCubit).changeSelectedGraphicBrand(value!);
                },
                buttonStyleData: ButtonStyleData(
                    height: 40,
                    width: 220,
                    padding: const EdgeInsets.symmetric(horizontal: AppSize.s6, vertical: AppSize.s2),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorDark,
                      border: Border.all(color: Theme.of(context).primaryColorDark, width: AppSize.s1),
                      borderRadius: const BorderRadius.all(Radius.circular(AppSize.s6)),
                    )
                ),
                dropdownStyleData: DropdownStyleData(
                    maxHeight: 300,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorDark,
                        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(AppSize.s6), bottomRight: Radius.circular(AppSize.s6))
                    )
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                ),
                style: TextStyle(color: ColorManager.darkSecondColor),
                dropdownSearchData: DropdownSearchData(
                  searchController: textEditingController,
                  searchInnerWidgetHeight: 50,
                  searchInnerWidget: Container(
                    height: 50,
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 4,
                      right: 8,
                      left: 8,
                    ),
                    child: ReusableComponents.registerTextField(
                        context: context,
                        background: Colors.transparent,
                        borderColor: ColorManager.darkSecondColor,
                        textInputType: TextInputType.text,
                        hintText: AppStrings.searchForBrand,
                        textStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        hintStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        textInputAction: TextInputAction.next,
                        suffixIcon: Icon(IconlyBroken.search, color: Theme.of(context).primaryColorLight),
                        controller: textEditingController,
                        validate: (value) {}, onChanged: (String? value) {}),
                  ),
                  searchMatchFn: (item, searchValue) {
                    return (item.value.toString().contains(searchValue));
                  },
                ),
                //This to clear the search value when you close the menu
                onMenuStateChange: (isOpen) {
                  if (!isOpen) {
                    textEditingController.clear();
                  }
                },
              ),
            );
          },
        );

    }

  }
}
class GetGraphicModelComponent extends StatelessWidget {
  GetGraphicModelComponent({Key? key,required this.fromRoute,  required this.cubit}) : super(key: key);
  final String fromRoute;
  dynamic cubit;
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    switch(fromRoute){
      case "New Laptop":
        return BlocConsumer<NewLaptopCubit, NewLaptopStates>(
          bloc: cubit as NewLaptopCubit,
          listener: (context, state){},
          builder: (context, state){
            return DropdownButtonHideUnderline(
              child: DropdownButton2<GraphicsCardModelDeviceModel>(
                isExpanded: true,
                hint: Text(
                  (cubit as NewLaptopCubit).selectedGraphicModel == null ? AppStrings.selectModel : (cubit as NewLaptopCubit).selectedGraphicModel!.graphicsCardModelDeviceName,
                  style: TextStyle(
                    fontSize: AppSize.s14,
                    fontFamily: FontConstants.family,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                items: (cubit as NewLaptopCubit).graphicModelList
                    .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(
                    item.graphicsCardModelDeviceName,
                    style: const TextStyle(
                      fontSize: AppSize.s14,
                    ),
                  ),
                ))
                    .toList(),
                value: (cubit as NewLaptopCubit).selectedGraphicModel,
                onChanged: (value) {
                  (cubit as NewLaptopCubit).changeSelectedGraphicModel(value!);
                },
                buttonStyleData: ButtonStyleData(
                    height: 40,
                    width: 220,
                    padding: const EdgeInsets.symmetric(horizontal: AppSize.s6, vertical: AppSize.s2),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorDark,
                      border: Border.all(color: Theme.of(context).primaryColorDark, width: AppSize.s1),
                      borderRadius: const BorderRadius.all(Radius.circular(AppSize.s6)),
                    )
                ),
                dropdownStyleData: DropdownStyleData(
                    maxHeight: 300,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorDark,
                        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(AppSize.s6), bottomRight: Radius.circular(AppSize.s6))
                    )
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                ),
                style: TextStyle(color: ColorManager.darkSecondColor),
                dropdownSearchData: DropdownSearchData(
                  searchController: textEditingController,
                  searchInnerWidgetHeight: 50,
                  searchInnerWidget: Container(
                    height: 50,
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 4,
                      right: 8,
                      left: 8,
                    ),
                    child: ReusableComponents.registerTextField(
                        context: context,
                        background: Colors.transparent,
                        borderColor: ColorManager.darkSecondColor,
                        textInputType: TextInputType.text,
                        hintText: AppStrings.searchForModel,
                        textStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        hintStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        textInputAction: TextInputAction.next,
                        suffixIcon: Icon(IconlyBroken.search, color: Theme.of(context).primaryColorLight),
                        controller: textEditingController,
                        validate: (value) {}, onChanged: (String? value) {}),
                  ),
                  searchMatchFn: (item, searchValue) {
                    return (item.value.toString().contains(searchValue));
                  },
                ),
                //This to clear the search value when you close the menu
                onMenuStateChange: (isOpen) {
                  if (!isOpen) {
                    textEditingController.clear();
                  }
                },
              ),
            );
          },
        );
      case "New Computer":
      default:
        return BlocConsumer<NewComputerCubit, NewComputerStates>(
          bloc: cubit as NewComputerCubit,
          listener: (context, state){},
          builder: (context, state){
            return DropdownButtonHideUnderline(
              child: DropdownButton2<GraphicsCardModelDeviceModel>(
                isExpanded: true,
                hint: Text(
                  (cubit as NewComputerCubit).selectedGraphicModel == null ? AppStrings.selectModel : (cubit as NewComputerCubit).selectedGraphicModel!.graphicsCardModelDeviceName,
                  style: TextStyle(
                    fontSize: AppSize.s14,
                    fontFamily: FontConstants.family,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                items: (cubit as NewComputerCubit).graphicModelList
                    .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(
                    item.graphicsCardModelDeviceName,
                    style: const TextStyle(
                      fontSize: AppSize.s14,
                    ),
                  ),
                ))
                    .toList(),
                value: (cubit as NewComputerCubit).selectedGraphicModel,
                onChanged: (value) {
                  (cubit as NewComputerCubit).changeSelectedGraphicModel(value!);
                },
                buttonStyleData: ButtonStyleData(
                    height: 40,
                    width: 220,
                    padding: const EdgeInsets.symmetric(horizontal: AppSize.s6, vertical: AppSize.s2),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorDark,
                      border: Border.all(color: Theme.of(context).primaryColorDark, width: AppSize.s1),
                      borderRadius: const BorderRadius.all(Radius.circular(AppSize.s6)),
                    )
                ),
                dropdownStyleData: DropdownStyleData(
                    maxHeight: 300,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorDark,
                        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(AppSize.s6), bottomRight: Radius.circular(AppSize.s6))
                    )
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                ),
                style: TextStyle(color: ColorManager.darkSecondColor),
                dropdownSearchData: DropdownSearchData(
                  searchController: textEditingController,
                  searchInnerWidgetHeight: 50,
                  searchInnerWidget: Container(
                    height: 50,
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 4,
                      right: 8,
                      left: 8,
                    ),
                    child: ReusableComponents.registerTextField(
                        context: context,
                        background: Colors.transparent,
                        borderColor: ColorManager.darkSecondColor,
                        textInputType: TextInputType.text,
                        hintText: AppStrings.searchForModel,
                        textStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        hintStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        textInputAction: TextInputAction.next,
                        suffixIcon: Icon(IconlyBroken.search, color: Theme.of(context).primaryColorLight),
                        controller: textEditingController,
                        validate: (value) {}, onChanged: (String? value) {}),
                  ),
                  searchMatchFn: (item, searchValue) {
                    return (item.value.toString().contains(searchValue));
                  },
                ),
                //This to clear the search value when you close the menu
                onMenuStateChange: (isOpen) {
                  if (!isOpen) {
                    textEditingController.clear();
                  }
                },
              ),
            );
          },
        );
    }
  }
}
class GetGraphicSizeComponent extends StatelessWidget {
  GetGraphicSizeComponent({Key? key,required this.fromRoute,  required this.cubit}) : super(key: key);
  final String fromRoute;
  dynamic cubit;
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    switch(fromRoute){
      case "New Laptop":
        return BlocConsumer<NewLaptopCubit, NewLaptopStates>(
          bloc: cubit as NewLaptopCubit,
          listener: (context, state){},
          builder: (context, state){
            return DropdownButtonHideUnderline(
              child: DropdownButton2<GraphicCardSizeModel>(
                isExpanded: true,
                hint: Text(
                  (cubit as NewLaptopCubit).selectedGraphicSize == null ? AppStrings.selectSize : (cubit as NewLaptopCubit).selectedGraphicSize!.sizeNumber,
                  style: TextStyle(
                    fontSize: AppSize.s14,
                    fontFamily: FontConstants.family,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                items: (cubit as NewLaptopCubit).graphicSizeList
                    .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(
                    item.sizeNumber,
                    style: const TextStyle(
                      fontSize: AppSize.s14,
                    ),
                  ),
                ))
                    .toList(),
                value: (cubit as NewLaptopCubit).selectedGraphicSize,
                onChanged: (value) {
                  (cubit as NewLaptopCubit).changeSelectedGraphicSize(value!);
                },
                buttonStyleData: ButtonStyleData(
                    height: 40,
                    width: 220,
                    padding: const EdgeInsets.symmetric(horizontal: AppSize.s6, vertical: AppSize.s2),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorDark,
                      border: Border.all(color: Theme.of(context).primaryColorDark, width: AppSize.s1),
                      borderRadius: const BorderRadius.all(Radius.circular(AppSize.s6)),
                    )
                ),
                dropdownStyleData: DropdownStyleData(
                    maxHeight: 300,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorDark,
                        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(AppSize.s6), bottomRight: Radius.circular(AppSize.s6))
                    )
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                ),
                style: TextStyle(color: ColorManager.darkSecondColor),
                dropdownSearchData: DropdownSearchData(
                  searchController: textEditingController,
                  searchInnerWidgetHeight: 50,
                  searchInnerWidget: Container(
                    height: 50,
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 4,
                      right: 8,
                      left: 8,
                    ),
                    child: ReusableComponents.registerTextField(
                        context: context,
                        background: Colors.transparent,
                        borderColor: ColorManager.darkSecondColor,
                        textInputType: TextInputType.text,
                        hintText: AppStrings.searchForSize,
                        textStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        hintStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        textInputAction: TextInputAction.next,
                        suffixIcon: Icon(IconlyBroken.search, color: Theme.of(context).primaryColorLight),
                        controller: textEditingController,
                        validate: (value) {}, onChanged: (String? value) {}),
                  ),
                  searchMatchFn: (item, searchValue) {
                    return (item.value.toString().contains(searchValue));
                  },
                ),
                //This to clear the search value when you close the menu
                onMenuStateChange: (isOpen) {
                  if (!isOpen) {
                    textEditingController.clear();
                  }
                },
              ),
            );
          },
        );
      case "New Computer":
      default:
        return BlocConsumer<NewComputerCubit, NewComputerStates>(
          bloc: cubit as NewComputerCubit,
          listener: (context, state){},
          builder: (context, state){
            return DropdownButtonHideUnderline(
              child: DropdownButton2<GraphicCardSizeModel>(
                isExpanded: true,
                hint: Text(
                  (cubit as NewComputerCubit).selectedGraphicSize == null ? AppStrings.selectSize : (cubit as NewComputerCubit).selectedGraphicSize!.sizeNumber,
                  style: TextStyle(
                    fontSize: AppSize.s14,
                    fontFamily: FontConstants.family,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                items: (cubit as NewComputerCubit).graphicSizeList
                    .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(
                    item.sizeNumber,
                    style: const TextStyle(
                      fontSize: AppSize.s14,
                    ),
                  ),
                ))
                    .toList(),
                value: (cubit as NewComputerCubit).selectedGraphicSize,
                onChanged: (value) {
                  (cubit as NewComputerCubit).changeSelectedGraphicSize(value!);
                },
                buttonStyleData: ButtonStyleData(
                    height: 40,
                    width: 220,
                    padding: const EdgeInsets.symmetric(horizontal: AppSize.s6, vertical: AppSize.s2),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorDark,
                      border: Border.all(color: Theme.of(context).primaryColorDark, width: AppSize.s1),
                      borderRadius: const BorderRadius.all(Radius.circular(AppSize.s6)),
                    )
                ),
                dropdownStyleData: DropdownStyleData(
                    maxHeight: 300,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorDark,
                        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(AppSize.s6), bottomRight: Radius.circular(AppSize.s6))
                    )
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                ),
                style: TextStyle(color: ColorManager.darkSecondColor),
                dropdownSearchData: DropdownSearchData(
                  searchController: textEditingController,
                  searchInnerWidgetHeight: 50,
                  searchInnerWidget: Container(
                    height: 50,
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 4,
                      right: 8,
                      left: 8,
                    ),
                    child: ReusableComponents.registerTextField(
                        context: context,
                        background: Colors.transparent,
                        borderColor: ColorManager.darkSecondColor,
                        textInputType: TextInputType.text,
                        hintText: AppStrings.searchForSize,
                        textStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        hintStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        textInputAction: TextInputAction.next,
                        suffixIcon: Icon(IconlyBroken.search, color: Theme.of(context).primaryColorLight),
                        controller: textEditingController,
                        validate: (value) {}, onChanged: (String? value) {}),
                  ),
                  searchMatchFn: (item, searchValue) {
                    return (item.value.toString().contains(searchValue));
                  },
                ),
                //This to clear the search value when you close the menu
                onMenuStateChange: (isOpen) {
                  if (!isOpen) {
                    textEditingController.clear();
                  }
                },
              ),
            );
          },
        );
    }
  }
}

class GetRamBrandComponent extends StatelessWidget {
  GetRamBrandComponent({Key? key,required this.fromRoute,  required this.cubit}) : super(key: key);
  final String fromRoute;
  dynamic cubit;
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    switch(fromRoute){
      case "New Laptop":
        return BlocConsumer<NewLaptopCubit, NewLaptopStates>(
          bloc: cubit as NewLaptopCubit,
          listener: (context, state){},
          builder: (context, state){
            return DropdownButtonHideUnderline(
              child: DropdownButton2<RamTypeModel>(
                isExpanded: true,
                hint: Text(
                  (cubit as NewLaptopCubit).selectedRamType == null ? AppStrings.selectBrand : (cubit as NewLaptopCubit).selectedRamType!.ramTypeName,
                  style: TextStyle(
                    fontSize: AppSize.s14,
                    fontFamily: FontConstants.family,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                items: (cubit as NewLaptopCubit).ramTypeList
                    .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(
                    item.ramTypeName,
                    style: const TextStyle(
                      fontSize: AppSize.s14,
                    ),
                  ),
                ))
                    .toList(),
                value: (cubit as NewLaptopCubit).selectedRamType,
                onChanged: (value) {
                  (cubit as NewLaptopCubit).changeSelectedRamType(value!);
                },
                buttonStyleData: ButtonStyleData(
                    height: 40,
                    width: 220,
                    padding: const EdgeInsets.symmetric(horizontal: AppSize.s6, vertical: AppSize.s2),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorDark,
                      border: Border.all(color: Theme.of(context).primaryColorDark, width: AppSize.s1),
                      borderRadius: const BorderRadius.all(Radius.circular(AppSize.s6)),
                    )
                ),
                dropdownStyleData: DropdownStyleData(
                    maxHeight: 300,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorDark,
                        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(AppSize.s6), bottomRight: Radius.circular(AppSize.s6))
                    )
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                ),
                style: TextStyle(color: ColorManager.darkSecondColor),
                dropdownSearchData: DropdownSearchData(
                  searchController: textEditingController,
                  searchInnerWidgetHeight: 50,
                  searchInnerWidget: Container(
                    height: 50,
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 4,
                      right: 8,
                      left: 8,
                    ),
                    child: ReusableComponents.registerTextField(
                        context: context,
                        background: Colors.transparent,
                        borderColor: ColorManager.darkSecondColor,
                        textInputType: TextInputType.text,
                        hintText: AppStrings.searchForBrand,
                        textStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        hintStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        textInputAction: TextInputAction.next,
                        suffixIcon: Icon(IconlyBroken.search, color: Theme.of(context).primaryColorLight),
                        controller: textEditingController,
                        validate: (value) {}, onChanged: (String? value) {}),
                  ),
                  searchMatchFn: (item, searchValue) {
                    return (item.value.toString().contains(searchValue));
                  },
                ),
                //This to clear the search value when you close the menu
                onMenuStateChange: (isOpen) {
                  if (!isOpen) {
                    textEditingController.clear();
                  }
                },
              ),
            );
          },
        );
      case "New Computer":
      default:
        return BlocConsumer<NewComputerCubit, NewComputerStates>(
          bloc: cubit as NewComputerCubit,
          listener: (context, state){},
          builder: (context, state){
            return DropdownButtonHideUnderline(
              child: DropdownButton2<RamTypeModel>(
                isExpanded: true,
                hint: Text(
                  (cubit as NewComputerCubit).selectedRamType == null ? AppStrings.selectBrand : (cubit as NewComputerCubit).selectedRamType!.ramTypeName,
                  style: TextStyle(
                    fontSize: AppSize.s14,
                    fontFamily: FontConstants.family,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                items: (cubit as NewComputerCubit).ramTypeList
                    .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(
                    item.ramTypeName,
                    style: const TextStyle(
                      fontSize: AppSize.s14,
                    ),
                  ),
                ))
                    .toList(),
                value: (cubit as NewComputerCubit).selectedRamType,
                onChanged: (value) {
                  (cubit as NewComputerCubit).changeSelectedRamType(value!);
                },
                buttonStyleData: ButtonStyleData(
                    height: 40,
                    width: 220,
                    padding: const EdgeInsets.symmetric(horizontal: AppSize.s6, vertical: AppSize.s2),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorDark,
                      border: Border.all(color: Theme.of(context).primaryColorDark, width: AppSize.s1),
                      borderRadius: const BorderRadius.all(Radius.circular(AppSize.s6)),
                    )
                ),
                dropdownStyleData: DropdownStyleData(
                    maxHeight: 300,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorDark,
                        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(AppSize.s6), bottomRight: Radius.circular(AppSize.s6))
                    )
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                ),
                style: TextStyle(color: ColorManager.darkSecondColor),
                dropdownSearchData: DropdownSearchData(
                  searchController: textEditingController,
                  searchInnerWidgetHeight: 50,
                  searchInnerWidget: Container(
                    height: 50,
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 4,
                      right: 8,
                      left: 8,
                    ),
                    child: ReusableComponents.registerTextField(
                        context: context,
                        background: Colors.transparent,
                        borderColor: ColorManager.darkSecondColor,
                        textInputType: TextInputType.text,
                        hintText: AppStrings.searchForBrand,
                        textStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        hintStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        textInputAction: TextInputAction.next,
                        suffixIcon: Icon(IconlyBroken.search, color: Theme.of(context).primaryColorLight),
                        controller: textEditingController,
                        validate: (value) {}, onChanged: (String? value) {}),
                  ),
                  searchMatchFn: (item, searchValue) {
                    return (item.value.toString().contains(searchValue));
                  },
                ),
                //This to clear the search value when you close the menu
                onMenuStateChange: (isOpen) {
                  if (!isOpen) {
                    textEditingController.clear();
                  }
                },
              ),
            );
          },
        );
    }
  }
}
class GetRamSizeComponent extends StatelessWidget {
  GetRamSizeComponent({Key? key,required this.fromRoute,  required this.cubit}) : super(key: key);
  final String fromRoute;
  dynamic cubit;
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    switch(fromRoute){
      case "New Laptop":
        return BlocConsumer<NewLaptopCubit, NewLaptopStates>(
          bloc: cubit as NewLaptopCubit,
          listener: (context, state){},
          builder: (context, state){
            return DropdownButtonHideUnderline(
              child: DropdownButton2<GraphicCardSizeModel>(
                isExpanded: true,
                hint: Text(
                  (cubit as NewLaptopCubit).selectedRamSize == null ? AppStrings.selectSize : (cubit as NewLaptopCubit).selectedRamSize!.sizeNumber,
                  style: TextStyle(
                    fontSize: AppSize.s14,
                    fontFamily: FontConstants.family,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                items: (cubit as NewLaptopCubit).ramSizeList
                    .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(
                    item.sizeNumber,
                    style: const TextStyle(
                      fontSize: AppSize.s14,
                    ),
                  ),
                ))
                    .toList(),
                value: (cubit as NewLaptopCubit).selectedRamSize,
                onChanged: (value) {
                  (cubit as NewLaptopCubit).changeSelectedRamSize(value!);
                },
                buttonStyleData: ButtonStyleData(
                    height: 40,
                    width: 220,
                    padding: const EdgeInsets.symmetric(horizontal: AppSize.s6, vertical: AppSize.s2),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorDark,
                      border: Border.all(color: Theme.of(context).primaryColorDark, width: AppSize.s1),
                      borderRadius: const BorderRadius.all(Radius.circular(AppSize.s6)),
                    )
                ),
                dropdownStyleData: DropdownStyleData(
                    maxHeight: 300,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorDark,
                        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(AppSize.s6), bottomRight: Radius.circular(AppSize.s6))
                    )
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                ),
                style: TextStyle(color: ColorManager.darkSecondColor),
                dropdownSearchData: DropdownSearchData(
                  searchController: textEditingController,
                  searchInnerWidgetHeight: 50,
                  searchInnerWidget: Container(
                    height: 50,
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 4,
                      right: 8,
                      left: 8,
                    ),
                    child: ReusableComponents.registerTextField(
                        context: context,
                        background: Colors.transparent,
                        borderColor: ColorManager.darkSecondColor,
                        textInputType: TextInputType.text,
                        hintText: AppStrings.searchForSize,
                        textStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        hintStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        textInputAction: TextInputAction.next,
                        suffixIcon: Icon(IconlyBroken.search, color: Theme.of(context).primaryColorLight),
                        controller: textEditingController,
                        validate: (value) {}, onChanged: (String? value) {}),
                  ),
                  searchMatchFn: (item, searchValue) {
                    return (item.value.toString().contains(searchValue));
                  },
                ),
                //This to clear the search value when you close the menu
                onMenuStateChange: (isOpen) {
                  if (!isOpen) {
                    textEditingController.clear();
                  }
                },
              ),
            );
          },
        );
      case "New Computer":
      default:
        return BlocConsumer<NewComputerCubit, NewComputerStates>(
          bloc: cubit as NewComputerCubit,
          listener: (context, state){},
          builder: (context, state){
            return DropdownButtonHideUnderline(
              child: DropdownButton2<GraphicCardSizeModel>(
                isExpanded: true,
                hint: Text(
                  (cubit as NewComputerCubit).selectedRamSize == null ? AppStrings.selectSize : (cubit as NewComputerCubit).selectedRamSize!.sizeNumber,
                  style: TextStyle(
                    fontSize: AppSize.s14,
                    fontFamily: FontConstants.family,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                items: (cubit as NewComputerCubit).ramSizeList
                    .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(
                    item.sizeNumber,
                    style: const TextStyle(
                      fontSize: AppSize.s14,
                    ),
                  ),
                ))
                    .toList(),
                value: (cubit as NewComputerCubit).selectedRamSize,
                onChanged: (value) {
                  (cubit as NewComputerCubit).changeSelectedRamSize(value!);
                },
                buttonStyleData: ButtonStyleData(
                    height: 40,
                    width: 220,
                    padding: const EdgeInsets.symmetric(horizontal: AppSize.s6, vertical: AppSize.s2),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorDark,
                      border: Border.all(color: Theme.of(context).primaryColorDark, width: AppSize.s1),
                      borderRadius: const BorderRadius.all(Radius.circular(AppSize.s6)),
                    )
                ),
                dropdownStyleData: DropdownStyleData(
                    maxHeight: 300,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorDark,
                        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(AppSize.s6), bottomRight: Radius.circular(AppSize.s6))
                    )
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                ),
                style: TextStyle(color: ColorManager.darkSecondColor),
                dropdownSearchData: DropdownSearchData(
                  searchController: textEditingController,
                  searchInnerWidgetHeight: 50,
                  searchInnerWidget: Container(
                    height: 50,
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 4,
                      right: 8,
                      left: 8,
                    ),
                    child: ReusableComponents.registerTextField(
                        context: context,
                        background: Colors.transparent,
                        borderColor: ColorManager.darkSecondColor,
                        textInputType: TextInputType.text,
                        hintText: AppStrings.searchForSize,
                        textStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        hintStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        textInputAction: TextInputAction.next,
                        suffixIcon: Icon(IconlyBroken.search, color: Theme.of(context).primaryColorLight),
                        controller: textEditingController,
                        validate: (value) {}, onChanged: (String? value) {}),
                  ),
                  searchMatchFn: (item, searchValue) {
                    return (item.value.toString().contains(searchValue));
                  },
                ),
                //This to clear the search value when you close the menu
                onMenuStateChange: (isOpen) {
                  if (!isOpen) {
                    textEditingController.clear();
                  }
                },
              ),
            );
          },
        );
    }
  }
}

class GetDeviceModelComponent extends StatelessWidget {
  GetDeviceModelComponent({Key? key,required this.fromRoute,  required this.cubit}) : super(key: key);
  final String fromRoute;
  dynamic cubit;
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    switch(fromRoute){
      case "New Laptop":
        return BlocConsumer<NewLaptopCubit, NewLaptopStates>(
          bloc: cubit as NewLaptopCubit,
          listener: (context, state){},
          builder: (context, state){
            return DropdownButtonHideUnderline(
              child: DropdownButton2<PcModelDeviceModel>(
                isExpanded: true,
                hint: Text(
                  (cubit as NewLaptopCubit).selectedDeviceModel == null ? AppStrings.selectBrand : (cubit as NewLaptopCubit).selectedDeviceModel!.pcModelName,
                  style: TextStyle(
                    fontSize: AppSize.s14,
                    fontFamily: FontConstants.family,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                items: (cubit as NewLaptopCubit).pcModelList
                    .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(
                    item.pcModelName,
                    style: const TextStyle(
                      fontSize: AppSize.s14,
                    ),
                  ),
                ))
                    .toList(),
                value: (cubit as NewLaptopCubit).selectedDeviceModel,
                onChanged: (value) {
                  (cubit as NewLaptopCubit).changeSelectedDeviceModel(value!);
                },
                buttonStyleData: ButtonStyleData(
                    height: 40,
                    width: 220,
                    padding: const EdgeInsets.symmetric(horizontal: AppSize.s6, vertical: AppSize.s2),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorDark,
                      border: Border.all(color: Theme.of(context).primaryColorDark, width: AppSize.s1),
                      borderRadius: const BorderRadius.all(Radius.circular(AppSize.s6)),
                    )
                ),
                dropdownStyleData: DropdownStyleData(
                    maxHeight: 300,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorDark,
                        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(AppSize.s6), bottomRight: Radius.circular(AppSize.s6))
                    )
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                ),
                style: TextStyle(color: ColorManager.darkSecondColor),
                dropdownSearchData: DropdownSearchData(
                  searchController: textEditingController,
                  searchInnerWidgetHeight: 50,
                  searchInnerWidget: Container(
                    height: 50,
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 4,
                      right: 8,
                      left: 8,
                    ),
                    child: ReusableComponents.registerTextField(
                        context: context,
                        background: Colors.transparent,
                        borderColor: ColorManager.darkSecondColor,
                        textInputType: TextInputType.text,
                        hintText: AppStrings.searchForBrand,
                        textStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        hintStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        textInputAction: TextInputAction.next,
                        suffixIcon: Icon(IconlyBroken.search, color: Theme.of(context).primaryColorLight),
                        controller: textEditingController,
                        validate: (value) {}, onChanged: (String? value) {}),
                  ),
                  searchMatchFn: (item, searchValue) {
                    return (item.value.toString().contains(searchValue));
                  },
                ),
                //This to clear the search value when you close the menu
                onMenuStateChange: (isOpen) {
                  if (!isOpen) {
                    textEditingController.clear();
                  }
                },
              ),
            );
          },
        );
      case "New Computer":
      default:
        return BlocConsumer<NewComputerCubit, NewComputerStates>(
          bloc: cubit as NewComputerCubit,
          listener: (context, state){},
          builder: (context, state){
            return DropdownButtonHideUnderline(
              child: DropdownButton2<PcModelDeviceModel>(
                isExpanded: true,
                hint: Text(
                  (cubit as NewComputerCubit).selectedDeviceModel == null ? AppStrings.selectBrand : (cubit as NewComputerCubit).selectedDeviceModel!.pcModelName,
                  style: TextStyle(
                    fontSize: AppSize.s14,
                    fontFamily: FontConstants.family,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                items: (cubit as NewComputerCubit).pcModelList
                    .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(
                    item.pcModelName,
                    style: const TextStyle(
                      fontSize: AppSize.s14,
                    ),
                  ),
                ))
                    .toList(),
                value: (cubit as NewComputerCubit).selectedDeviceModel,
                onChanged: (value) {
                  (cubit as NewComputerCubit).changeSelectedDeviceModel(value!);
                },
                buttonStyleData: ButtonStyleData(
                    height: 40,
                    width: 220,
                    padding: const EdgeInsets.symmetric(horizontal: AppSize.s6, vertical: AppSize.s2),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorDark,
                      border: Border.all(color: Theme.of(context).primaryColorDark, width: AppSize.s1),
                      borderRadius: const BorderRadius.all(Radius.circular(AppSize.s6)),
                    )
                ),
                dropdownStyleData: DropdownStyleData(
                    maxHeight: 300,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorDark,
                        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(AppSize.s6), bottomRight: Radius.circular(AppSize.s6))
                    )
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                ),
                style: TextStyle(color: ColorManager.darkSecondColor),
                dropdownSearchData: DropdownSearchData(
                  searchController: textEditingController,
                  searchInnerWidgetHeight: 50,
                  searchInnerWidget: Container(
                    height: 50,
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 4,
                      right: 8,
                      left: 8,
                    ),
                    child: ReusableComponents.registerTextField(
                        context: context,
                        background: Colors.transparent,
                        borderColor: ColorManager.darkSecondColor,
                        textInputType: TextInputType.text,
                        hintText: AppStrings.searchForBrand,
                        textStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        hintStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        textInputAction: TextInputAction.next,
                        suffixIcon: Icon(IconlyBroken.search, color: Theme.of(context).primaryColorLight),
                        controller: textEditingController,
                        validate: (value) {}, onChanged: (String? value) {}),
                  ),
                  searchMatchFn: (item, searchValue) {
                    return (item.value.toString().contains(searchValue));
                  },
                ),
                //This to clear the search value when you close the menu
                onMenuStateChange: (isOpen) {
                  if (!isOpen) {
                    textEditingController.clear();
                  }
                },
              ),
            );
          },
        );
    }
  }
}

class GetPrimaryHardBrandComponent extends StatelessWidget {
  GetPrimaryHardBrandComponent({Key? key,required this.fromRoute,  required this.cubit}) : super(key: key);
  final String fromRoute;
  dynamic cubit;
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    switch(fromRoute){
      case "New Laptop":
        return BlocConsumer<NewLaptopCubit, NewLaptopStates>(
          bloc: cubit as NewLaptopCubit,
          listener: (context, state){},
          builder: (context, state){
            return DropdownButtonHideUnderline(
              child: DropdownButton2<HardDriveTypeModel>(
                isExpanded: true,
                hint: Text(
                  (cubit as NewLaptopCubit).selectedPrimaryHardType == null ? AppStrings.selectBrand : (cubit as NewLaptopCubit).selectedPrimaryHardType!.hardDriveTypeName,
                  style: TextStyle(
                    fontSize: AppSize.s14,
                    fontFamily: FontConstants.family,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                items: (cubit as NewLaptopCubit).hardTypeList
                    .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(
                    item.hardDriveTypeName,
                    style: const TextStyle(
                      fontSize: AppSize.s14,
                    ),
                  ),
                ))
                    .toList(),
                value: (cubit as NewLaptopCubit).selectedPrimaryHardType,
                onChanged: (value) {
                  (cubit as NewLaptopCubit).changeSelectedPrimaryHardType(value!);
                },
                buttonStyleData: ButtonStyleData(
                    height: 40,
                    width: 220,
                    padding: const EdgeInsets.symmetric(horizontal: AppSize.s6, vertical: AppSize.s2),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorDark,
                      border: Border.all(color: Theme.of(context).primaryColorDark, width: AppSize.s1),
                      borderRadius: const BorderRadius.all(Radius.circular(AppSize.s6)),
                    )
                ),
                dropdownStyleData: DropdownStyleData(
                    maxHeight: 300,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorDark,
                        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(AppSize.s6), bottomRight: Radius.circular(AppSize.s6))
                    )
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                ),
                style: TextStyle(color: ColorManager.darkSecondColor),
                dropdownSearchData: DropdownSearchData(
                  searchController: textEditingController,
                  searchInnerWidgetHeight: 50,
                  searchInnerWidget: Container(
                    height: 50,
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 4,
                      right: 8,
                      left: 8,
                    ),
                    child: ReusableComponents.registerTextField(
                        context: context,
                        background: Colors.transparent,
                        borderColor: ColorManager.darkSecondColor,
                        textInputType: TextInputType.text,
                        hintText: AppStrings.searchForBrand,
                        textStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        hintStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        textInputAction: TextInputAction.next,
                        suffixIcon: Icon(IconlyBroken.search, color: Theme.of(context).primaryColorLight),
                        controller: textEditingController,
                        validate: (value) {}, onChanged: (String? value) {}),
                  ),
                  searchMatchFn: (item, searchValue) {
                    return (item.value.toString().contains(searchValue));
                  },
                ),
                //This to clear the search value when you close the menu
                onMenuStateChange: (isOpen) {
                  if (!isOpen) {
                    textEditingController.clear();
                  }
                },
              ),
            );
          },
        );
      case "New Computer":
      default:
        return BlocConsumer<NewComputerCubit, NewComputerStates>(
          bloc: cubit as NewComputerCubit,
          listener: (context, state){},
          builder: (context, state){
            return DropdownButtonHideUnderline(
              child: DropdownButton2<HardDriveTypeModel>(
                isExpanded: true,
                hint: Text(
                  (cubit as NewComputerCubit).selectedPrimaryHardType == null ? AppStrings.selectBrand : (cubit as NewComputerCubit).selectedPrimaryHardType!.hardDriveTypeName,
                  style: TextStyle(
                    fontSize: AppSize.s14,
                    fontFamily: FontConstants.family,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                items: (cubit as NewComputerCubit).hardTypeList
                    .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(
                    item.hardDriveTypeName,
                    style: const TextStyle(
                      fontSize: AppSize.s14,
                    ),
                  ),
                ))
                    .toList(),
                value: (cubit as NewComputerCubit).selectedPrimaryHardType,
                onChanged: (value) {
                  (cubit as NewComputerCubit).changeSelectedPrimaryHardType(value!);
                },
                buttonStyleData: ButtonStyleData(
                    height: 40,
                    width: 220,
                    padding: const EdgeInsets.symmetric(horizontal: AppSize.s6, vertical: AppSize.s2),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorDark,
                      border: Border.all(color: Theme.of(context).primaryColorDark, width: AppSize.s1),
                      borderRadius: const BorderRadius.all(Radius.circular(AppSize.s6)),
                    )
                ),
                dropdownStyleData: DropdownStyleData(
                    maxHeight: 300,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorDark,
                        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(AppSize.s6), bottomRight: Radius.circular(AppSize.s6))
                    )
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                ),
                style: TextStyle(color: ColorManager.darkSecondColor),
                dropdownSearchData: DropdownSearchData(
                  searchController: textEditingController,
                  searchInnerWidgetHeight: 50,
                  searchInnerWidget: Container(
                    height: 50,
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 4,
                      right: 8,
                      left: 8,
                    ),
                    child: ReusableComponents.registerTextField(
                        context: context,
                        background: Colors.transparent,
                        borderColor: ColorManager.darkSecondColor,
                        textInputType: TextInputType.text,
                        hintText: AppStrings.searchForBrand,
                        textStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        hintStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        textInputAction: TextInputAction.next,
                        suffixIcon: Icon(IconlyBroken.search, color: Theme.of(context).primaryColorLight),
                        controller: textEditingController,
                        validate: (value) {}, onChanged: (String? value) {}),
                  ),
                  searchMatchFn: (item, searchValue) {
                    return (item.value.toString().contains(searchValue));
                  },
                ),
                //This to clear the search value when you close the menu
                onMenuStateChange: (isOpen) {
                  if (!isOpen) {
                    textEditingController.clear();
                  }
                },
              ),
            );
          },
        );
    }
  }
}
class GetSecondaryHardBrandComponent extends StatelessWidget {
  GetSecondaryHardBrandComponent({Key? key,required this.fromRoute,  required this.cubit}) : super(key: key);
  final String fromRoute;
  dynamic cubit;
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    switch(fromRoute){
      case "New Laptop":
        return BlocConsumer<NewLaptopCubit, NewLaptopStates>(
          bloc: cubit as NewLaptopCubit,
          listener: (context, state){},
          builder: (context, state){
            return DropdownButtonHideUnderline(
              child: DropdownButton2<HardDriveTypeModel>(
                isExpanded: true,
                hint: Text(
                  (cubit as NewLaptopCubit).selectedSecondaryHardType == null ? AppStrings.selectBrand : (cubit as NewLaptopCubit).selectedSecondaryHardType!.hardDriveTypeName,
                  style: TextStyle(
                    fontSize: AppSize.s14,
                    fontFamily: FontConstants.family,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                items: (cubit as NewLaptopCubit).hardTypeList
                    .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(
                    item.hardDriveTypeName,
                    style: const TextStyle(
                      fontSize: AppSize.s14,
                    ),
                  ),
                ))
                    .toList(),
                value: (cubit as NewLaptopCubit).selectedSecondaryHardType,
                onChanged: (value) {
                  (cubit as NewLaptopCubit).changeSelectedSecondaryHardType(value!);
                },
                buttonStyleData: ButtonStyleData(
                    height: 40,
                    width: 220,
                    padding: const EdgeInsets.symmetric(horizontal: AppSize.s6, vertical: AppSize.s2),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorDark,
                      border: Border.all(color: Theme.of(context).primaryColorDark, width: AppSize.s1),
                      borderRadius: const BorderRadius.all(Radius.circular(AppSize.s6)),
                    )
                ),
                dropdownStyleData: DropdownStyleData(
                    maxHeight: 300,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorDark,
                        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(AppSize.s6), bottomRight: Radius.circular(AppSize.s6))
                    )
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                ),
                style: TextStyle(color: ColorManager.darkSecondColor),
                dropdownSearchData: DropdownSearchData(
                  searchController: textEditingController,
                  searchInnerWidgetHeight: 50,
                  searchInnerWidget: Container(
                    height: 50,
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 4,
                      right: 8,
                      left: 8,
                    ),
                    child: ReusableComponents.registerTextField(
                        context: context,
                        background: Colors.transparent,
                        borderColor: ColorManager.darkSecondColor,
                        textInputType: TextInputType.text,
                        hintText: AppStrings.searchForBrand,
                        textStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        hintStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        textInputAction: TextInputAction.next,
                        suffixIcon: Icon(IconlyBroken.search, color: Theme.of(context).primaryColorLight),
                        controller: textEditingController,
                        validate: (value) {}, onChanged: (String? value) {}),
                  ),
                  searchMatchFn: (item, searchValue) {
                    return (item.value.toString().contains(searchValue));
                  },
                ),
                //This to clear the search value when you close the menu
                onMenuStateChange: (isOpen) {
                  if (!isOpen) {
                    textEditingController.clear();
                  }
                },
              ),
            );
          },
        );
      case "New Computer":
      default:
        return BlocConsumer<NewComputerCubit, NewComputerStates>(
          bloc: cubit as NewComputerCubit,
          listener: (context, state){},
          builder: (context, state){
            return DropdownButtonHideUnderline(
              child: DropdownButton2<HardDriveTypeModel>(
                isExpanded: true,
                hint: Text(
                  (cubit as NewComputerCubit).selectedSecondaryHardType == null ? AppStrings.selectBrand : (cubit as NewComputerCubit).selectedSecondaryHardType!.hardDriveTypeName,
                  style: TextStyle(
                    fontSize: AppSize.s14,
                    fontFamily: FontConstants.family,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                items: (cubit as NewComputerCubit).hardTypeList
                    .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(
                    item.hardDriveTypeName,
                    style: const TextStyle(
                      fontSize: AppSize.s14,
                    ),
                  ),
                ))
                    .toList(),
                value: (cubit as NewComputerCubit).selectedSecondaryHardType,
                onChanged: (value) {
                  (cubit as NewComputerCubit).changeSelectedSecondaryHardType(value!);
                },
                buttonStyleData: ButtonStyleData(
                    height: 40,
                    width: 220,
                    padding: const EdgeInsets.symmetric(horizontal: AppSize.s6, vertical: AppSize.s2),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorDark,
                      border: Border.all(color: Theme.of(context).primaryColorDark, width: AppSize.s1),
                      borderRadius: const BorderRadius.all(Radius.circular(AppSize.s6)),
                    )
                ),
                dropdownStyleData: DropdownStyleData(
                    maxHeight: 300,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorDark,
                        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(AppSize.s6), bottomRight: Radius.circular(AppSize.s6))
                    )
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                ),
                style: TextStyle(color: ColorManager.darkSecondColor),
                dropdownSearchData: DropdownSearchData(
                  searchController: textEditingController,
                  searchInnerWidgetHeight: 50,
                  searchInnerWidget: Container(
                    height: 50,
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 4,
                      right: 8,
                      left: 8,
                    ),
                    child: ReusableComponents.registerTextField(
                        context: context,
                        background: Colors.transparent,
                        borderColor: ColorManager.darkSecondColor,
                        textInputType: TextInputType.text,
                        hintText: AppStrings.searchForBrand,
                        textStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        hintStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        textInputAction: TextInputAction.next,
                        suffixIcon: Icon(IconlyBroken.search, color: Theme.of(context).primaryColorLight),
                        controller: textEditingController,
                        validate: (value) {}, onChanged: (String? value) {}),
                  ),
                  searchMatchFn: (item, searchValue) {
                    return (item.value.toString().contains(searchValue));
                  },
                ),
                //This to clear the search value when you close the menu
                onMenuStateChange: (isOpen) {
                  if (!isOpen) {
                    textEditingController.clear();
                  }
                },
              ),
            );
          },
        );
    }
  }
}
class GetPrimaryHardSizeComponent extends StatelessWidget {
  GetPrimaryHardSizeComponent({Key? key,required this.fromRoute,  required this.cubit}) : super(key: key);
  final String fromRoute;
  dynamic cubit;
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    switch(fromRoute){
      case "New Laptop":
        return BlocConsumer<NewLaptopCubit, NewLaptopStates>(
          bloc: cubit as NewLaptopCubit,
          listener: (context, state){},
          builder: (context, state){
            return DropdownButtonHideUnderline(
              child: DropdownButton2<HardDriveSizeModel>(
                isExpanded: true,
                hint: Text(
                  (cubit as NewLaptopCubit).selectedPrimaryHardSize == null ? AppStrings.selectSize : (cubit as NewLaptopCubit).selectedPrimaryHardSize!.sizeNumber,
                  style: TextStyle(
                    fontSize: AppSize.s14,
                    fontFamily: FontConstants.family,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                items: (cubit as NewLaptopCubit).hardSizeList
                    .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(
                    item.sizeNumber,
                    style: const TextStyle(
                      fontSize: AppSize.s14,
                    ),
                  ),
                ))
                    .toList(),
                value: (cubit as NewLaptopCubit).selectedPrimaryHardSize,
                onChanged: (value) {
                  (cubit as NewLaptopCubit).changeSelectedPrimaryHardSize(value!);
                },
                buttonStyleData: ButtonStyleData(
                    height: 40,
                    width: 220,
                    padding: const EdgeInsets.symmetric(horizontal: AppSize.s6, vertical: AppSize.s2),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorDark,
                      border: Border.all(color: Theme.of(context).primaryColorDark, width: AppSize.s1),
                      borderRadius: const BorderRadius.all(Radius.circular(AppSize.s6)),
                    )
                ),
                dropdownStyleData: DropdownStyleData(
                    maxHeight: 300,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorDark,
                        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(AppSize.s6), bottomRight: Radius.circular(AppSize.s6))
                    )
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                ),
                style: TextStyle(color: ColorManager.darkSecondColor),
                dropdownSearchData: DropdownSearchData(
                  searchController: textEditingController,
                  searchInnerWidgetHeight: 50,
                  searchInnerWidget: Container(
                    height: 50,
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 4,
                      right: 8,
                      left: 8,
                    ),
                    child: ReusableComponents.registerTextField(
                        context: context,
                        background: Colors.transparent,
                        borderColor: ColorManager.darkSecondColor,
                        textInputType: TextInputType.text,
                        hintText: AppStrings.searchForSize,
                        textStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        hintStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        textInputAction: TextInputAction.next,
                        suffixIcon: Icon(IconlyBroken.search, color: Theme.of(context).primaryColorLight),
                        controller: textEditingController,
                        validate: (value) {}, onChanged: (String? value) {}),
                  ),
                  searchMatchFn: (item, searchValue) {
                    return (item.value.toString().contains(searchValue));
                  },
                ),
                //This to clear the search value when you close the menu
                onMenuStateChange: (isOpen) {
                  if (!isOpen) {
                    textEditingController.clear();
                  }
                },
              ),
            );
          },
        );
      case "New Computer":
      default:
        return BlocConsumer<NewComputerCubit, NewComputerStates>(
          bloc: cubit as NewComputerCubit,
          listener: (context, state){},
          builder: (context, state){
            return DropdownButtonHideUnderline(
              child: DropdownButton2<HardDriveSizeModel>(
                isExpanded: true,
                hint: Text(
                  (cubit as NewComputerCubit).selectedPrimaryHardSize == null ? AppStrings.selectSize : (cubit as NewComputerCubit).selectedPrimaryHardSize!.sizeNumber,
                  style: TextStyle(
                    fontSize: AppSize.s14,
                    fontFamily: FontConstants.family,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                items: (cubit as NewComputerCubit).hardSizeList
                    .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(
                    item.sizeNumber,
                    style: const TextStyle(
                      fontSize: AppSize.s14,
                    ),
                  ),
                ))
                    .toList(),
                value: (cubit as NewComputerCubit).selectedPrimaryHardSize,
                onChanged: (value) {
                  (cubit as NewComputerCubit).changeSelectedPrimaryHardSize(value!);
                },
                buttonStyleData: ButtonStyleData(
                    height: 40,
                    width: 220,
                    padding: const EdgeInsets.symmetric(horizontal: AppSize.s6, vertical: AppSize.s2),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorDark,
                      border: Border.all(color: Theme.of(context).primaryColorDark, width: AppSize.s1),
                      borderRadius: const BorderRadius.all(Radius.circular(AppSize.s6)),
                    )
                ),
                dropdownStyleData: DropdownStyleData(
                    maxHeight: 300,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorDark,
                        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(AppSize.s6), bottomRight: Radius.circular(AppSize.s6))
                    )
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                ),
                style: TextStyle(color: ColorManager.darkSecondColor),
                dropdownSearchData: DropdownSearchData(
                  searchController: textEditingController,
                  searchInnerWidgetHeight: 50,
                  searchInnerWidget: Container(
                    height: 50,
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 4,
                      right: 8,
                      left: 8,
                    ),
                    child: ReusableComponents.registerTextField(
                        context: context,
                        background: Colors.transparent,
                        borderColor: ColorManager.darkSecondColor,
                        textInputType: TextInputType.text,
                        hintText: AppStrings.searchForSize,
                        textStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        hintStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        textInputAction: TextInputAction.next,
                        suffixIcon: Icon(IconlyBroken.search, color: Theme.of(context).primaryColorLight),
                        controller: textEditingController,
                        validate: (value) {}, onChanged: (String? value) {}),
                  ),
                  searchMatchFn: (item, searchValue) {
                    return (item.value.toString().contains(searchValue));
                  },
                ),
                //This to clear the search value when you close the menu
                onMenuStateChange: (isOpen) {
                  if (!isOpen) {
                    textEditingController.clear();
                  }
                },
              ),
            );
          },
        );
    }
  }
}
class GetSecondaryHardSizeComponent extends StatelessWidget {
  GetSecondaryHardSizeComponent({Key? key,required this.fromRoute,  required this.cubit}) : super(key: key);
  final String fromRoute;
  dynamic cubit;
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    switch(fromRoute){
      case "New Laptop":
        return BlocConsumer<NewLaptopCubit, NewLaptopStates>(
          bloc: cubit as NewLaptopCubit,
          listener: (context, state){},
          builder: (context, state){
            return DropdownButtonHideUnderline(
              child: DropdownButton2<HardDriveSizeModel>(
                isExpanded: true,
                hint: Text(
                  (cubit as NewLaptopCubit).selectedSecondaryHardSize == null ? AppStrings.selectSize : (cubit as NewLaptopCubit).selectedSecondaryHardSize!.sizeNumber,
                  style: TextStyle(
                    fontSize: AppSize.s14,
                    fontFamily: FontConstants.family,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                items: (cubit as NewLaptopCubit).hardSizeList
                    .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(
                    item.sizeNumber,
                    style: const TextStyle(
                      fontSize: AppSize.s14,
                    ),
                  ),
                ))
                    .toList(),
                value: (cubit as NewLaptopCubit).selectedSecondaryHardSize,
                onChanged: (value) {
                  (cubit as NewLaptopCubit).changeSelectedSecondaryHardSize(value!);
                },
                buttonStyleData: ButtonStyleData(
                    height: 40,
                    width: 220,
                    padding: const EdgeInsets.symmetric(horizontal: AppSize.s6, vertical: AppSize.s2),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorDark,
                      border: Border.all(color: Theme.of(context).primaryColorDark, width: AppSize.s1),
                      borderRadius: const BorderRadius.all(Radius.circular(AppSize.s6)),
                    )
                ),
                dropdownStyleData: DropdownStyleData(
                    maxHeight: 300,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorDark,
                        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(AppSize.s6), bottomRight: Radius.circular(AppSize.s6))
                    )
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                ),
                style: TextStyle(color: ColorManager.darkSecondColor),
                dropdownSearchData: DropdownSearchData(
                  searchController: textEditingController,
                  searchInnerWidgetHeight: 50,
                  searchInnerWidget: Container(
                    height: 50,
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 4,
                      right: 8,
                      left: 8,
                    ),
                    child: ReusableComponents.registerTextField(
                        context: context,
                        background: Colors.transparent,
                        borderColor: ColorManager.darkSecondColor,
                        textInputType: TextInputType.text,
                        hintText: AppStrings.searchForSize,
                        textStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        hintStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        textInputAction: TextInputAction.next,
                        suffixIcon: Icon(IconlyBroken.search, color: Theme.of(context).primaryColorLight),
                        controller: textEditingController,
                        validate: (value) {}, onChanged: (String? value) {}),
                  ),
                  searchMatchFn: (item, searchValue) {
                    return (item.value.toString().contains(searchValue));
                  },
                ),
                //This to clear the search value when you close the menu
                onMenuStateChange: (isOpen) {
                  if (!isOpen) {
                    textEditingController.clear();
                  }
                },
              ),
            );
          },
        );
      case "New Computer":
      default:
        return BlocConsumer<NewComputerCubit, NewComputerStates>(
          bloc: cubit as NewComputerCubit,
          listener: (context, state){},
          builder: (context, state){
            return DropdownButtonHideUnderline(
              child: DropdownButton2<HardDriveSizeModel>(
                isExpanded: true,
                hint: Text(
                  (cubit as NewComputerCubit).selectedSecondaryHardSize == null ? AppStrings.selectSize : (cubit as NewComputerCubit).selectedSecondaryHardSize!.sizeNumber,
                  style: TextStyle(
                    fontSize: AppSize.s14,
                    fontFamily: FontConstants.family,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                items: (cubit as NewComputerCubit).hardSizeList
                    .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(
                    item.sizeNumber,
                    style: const TextStyle(
                      fontSize: AppSize.s14,
                    ),
                  ),
                ))
                    .toList(),
                value: (cubit as NewComputerCubit).selectedSecondaryHardSize,
                onChanged: (value) {
                  (cubit as NewComputerCubit).changeSelectedSecondaryHardSize(value!);
                },
                buttonStyleData: ButtonStyleData(
                    height: 40,
                    width: 220,
                    padding: const EdgeInsets.symmetric(horizontal: AppSize.s6, vertical: AppSize.s2),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorDark,
                      border: Border.all(color: Theme.of(context).primaryColorDark, width: AppSize.s1),
                      borderRadius: const BorderRadius.all(Radius.circular(AppSize.s6)),
                    )
                ),
                dropdownStyleData: DropdownStyleData(
                    maxHeight: 300,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorDark,
                        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(AppSize.s6), bottomRight: Radius.circular(AppSize.s6))
                    )
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                ),
                style: TextStyle(color: ColorManager.darkSecondColor),
                dropdownSearchData: DropdownSearchData(
                  searchController: textEditingController,
                  searchInnerWidgetHeight: 50,
                  searchInnerWidget: Container(
                    height: 50,
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 4,
                      right: 8,
                      left: 8,
                    ),
                    child: ReusableComponents.registerTextField(
                        context: context,
                        background: Colors.transparent,
                        borderColor: ColorManager.darkSecondColor,
                        textInputType: TextInputType.text,
                        hintText: AppStrings.searchForSize,
                        textStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        hintStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        textInputAction: TextInputAction.next,
                        suffixIcon: Icon(IconlyBroken.search, color: Theme.of(context).primaryColorLight),
                        controller: textEditingController,
                        validate: (value) {}, onChanged: (String? value) {}),
                  ),
                  searchMatchFn: (item, searchValue) {
                    return (item.value.toString().contains(searchValue));
                  },
                ),
                //This to clear the search value when you close the menu
                onMenuStateChange: (isOpen) {
                  if (!isOpen) {
                    textEditingController.clear();
                  }
                },
              ),
            );
          },
        );
    }
  }
}

class GetScreenBrandComponent extends StatelessWidget {
  GetScreenBrandComponent({Key? key,required this.fromRoute,  required this.cubit}) : super(key: key);
  final String fromRoute;
  dynamic cubit;
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    switch(fromRoute){

      case "New Pc Monitor":
      default:
        return BlocConsumer<NewPcScreenCubit, NewPcScreenStates>(
          bloc: cubit as NewPcScreenCubit,
          listener: (context, state){},
          builder: (context, state){
            return DropdownButtonHideUnderline(
              child: DropdownButton2<ScreenBrandModel>(
                isExpanded: true,
                hint: Text(
                  (cubit as NewPcScreenCubit).selectedBrand == null ? AppStrings.selectBrand : (cubit as NewPcScreenCubit).selectedBrand!.screenBrandName,
                  style: TextStyle(
                    fontSize: AppSize.s14,
                    fontFamily: FontConstants.family,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                items: (cubit as NewPcScreenCubit).brandsList
                    .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(
                    item.screenBrandName,
                    style: const TextStyle(
                      fontSize: AppSize.s14,
                    ),
                  ),
                ))
                    .toList(),
                value: (cubit as NewPcScreenCubit).selectedBrand,
                onChanged: (value) {
                  (cubit as NewPcScreenCubit).changeSelectedBrand(value!);
                },
                buttonStyleData: ButtonStyleData(
                    height: 40,
                    width: 220,
                    padding: const EdgeInsets.symmetric(horizontal: AppSize.s6, vertical: AppSize.s2),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorDark,
                      border: Border.all(color: Theme.of(context).primaryColorDark, width: AppSize.s1),
                      borderRadius: const BorderRadius.all(Radius.circular(AppSize.s6)),
                    )
                ),
                dropdownStyleData: DropdownStyleData(
                    maxHeight: 300,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorDark,
                        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(AppSize.s6), bottomRight: Radius.circular(AppSize.s6))
                    )
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                ),
                style: TextStyle(color: ColorManager.darkSecondColor),
                dropdownSearchData: DropdownSearchData(
                  searchController: textEditingController,
                  searchInnerWidgetHeight: 50,
                  searchInnerWidget: Container(
                    height: 50,
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 4,
                      right: 8,
                      left: 8,
                    ),
                    child: ReusableComponents.registerTextField(
                        context: context,
                        background: Colors.transparent,
                        borderColor: ColorManager.darkSecondColor,
                        textInputType: TextInputType.text,
                        hintText: AppStrings.searchForBrand,
                        textStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        hintStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        textInputAction: TextInputAction.next,
                        suffixIcon: Icon(IconlyBroken.search, color: Theme.of(context).primaryColorLight),
                        controller: textEditingController,
                        validate: (value) {}, onChanged: (String? value) {}),
                  ),
                  searchMatchFn: (item, searchValue) {
                    return (item.value.toString().contains(searchValue));
                  },
                ),
                //This to clear the search value when you close the menu
                onMenuStateChange: (isOpen) {
                  if (!isOpen) {
                    textEditingController.clear();
                  }
                },
              ),
            );
          },
        );
    }
  }
}
class GetScreenSizeComponent extends StatelessWidget {
  GetScreenSizeComponent({Key? key,required this.fromRoute,  required this.cubit}) : super(key: key);
  final String fromRoute;
  dynamic cubit;
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    switch(fromRoute){

      case "New Pc Monitor":
      default:
        return BlocConsumer<NewPcScreenCubit, NewPcScreenStates>(
          bloc: cubit as NewPcScreenCubit,
          listener: (context, state){},
          builder: (context, state){
            return DropdownButtonHideUnderline(
              child: DropdownButton2<ScreenSizeModel>(
                isExpanded: true,
                hint: Text(
                  (cubit as NewPcScreenCubit).selectedSize == null ? AppStrings.selectSize : (cubit as NewPcScreenCubit).selectedSize!.sizeNumber,
                  style: TextStyle(
                    fontSize: AppSize.s14,
                    fontFamily: FontConstants.family,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                items: (cubit as NewPcScreenCubit).sizeList
                    .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(
                    item.sizeNumber,
                    style: const TextStyle(
                      fontSize: AppSize.s14,
                    ),
                  ),
                ))
                    .toList(),
                value: (cubit as NewPcScreenCubit).selectedSize,
                onChanged: (value) {
                  (cubit as NewPcScreenCubit).changeSelectedSize(value!);
                },
                buttonStyleData: ButtonStyleData(
                    height: 40,
                    width: 220,
                    padding: const EdgeInsets.symmetric(horizontal: AppSize.s6, vertical: AppSize.s2),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorDark,
                      border: Border.all(color: Theme.of(context).primaryColorDark, width: AppSize.s1),
                      borderRadius: const BorderRadius.all(Radius.circular(AppSize.s6)),
                    )
                ),
                dropdownStyleData: DropdownStyleData(
                    maxHeight: 300,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorDark,
                        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(AppSize.s6), bottomRight: Radius.circular(AppSize.s6))
                    )
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                ),
                style: TextStyle(color: ColorManager.darkSecondColor),
                dropdownSearchData: DropdownSearchData(
                  searchController: textEditingController,
                  searchInnerWidgetHeight: 50,
                  searchInnerWidget: Container(
                    height: 50,
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 4,
                      right: 8,
                      left: 8,
                    ),
                    child: ReusableComponents.registerTextField(
                        context: context,
                        background: Colors.transparent,
                        borderColor: ColorManager.darkSecondColor,
                        textInputType: TextInputType.text,
                        hintText: AppStrings.searchForSize,
                        textStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        hintStyle: TextStyle(color: ColorManager.darkSecondColor, fontSize: 14, fontFamily: FontConstants.family),
                        textInputAction: TextInputAction.next,
                        suffixIcon: Icon(IconlyBroken.search, color: Theme.of(context).primaryColorLight),
                        controller: textEditingController,
                        validate: (value) {}, onChanged: (String? value) {}),
                  ),
                  searchMatchFn: (item, searchValue) {
                    return (item.value.toString().contains(searchValue));
                  },
                ),
                //This to clear the search value when you close the menu
                onMenuStateChange: (isOpen) {
                  if (!isOpen) {
                    textEditingController.clear();
                  }
                },
              ),
            );
          },
        );
    }
  }
}

void scaleDialog(BuildContext context, bool dismissible, Widget content) {
  showGeneralDialog(
    barrierLabel: '',
    barrierDismissible: dismissible,
    barrierColor: Colors.black.withOpacity(0.2),
    context: context,
    pageBuilder: (ctx, a1, a2) {
      return Container();
    },
    transitionBuilder: (ctx, a1, a2, child) {
      var curve = Curves.easeInOut.transform(a1.value);
      return Transform.scale(
        scale: curve,
        child: Directionality(
          textDirection: !AppConstants.isArabic()
              ? ui.TextDirection.rtl
              : ui.TextDirection.ltr,
          child: content,
        ),
      );
    },
    transitionDuration: const Duration(milliseconds: 300),
  );
}

class ReusableComponents {
  static SnackBar resultSnackBar(String error, Color color){
    return SnackBar(content: Text(error,
        style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: AppSize.s18,fontFamily: FontConstants.family)),
      backgroundColor: color,
      duration: const Duration(seconds: 5),
      showCloseIcon: true,
      closeIconColor: Colors.white,);
  }

  static Widget registerTextField(
      {required BuildContext context,
      required TextInputType textInputType,
      required String hintText,
      required TextInputAction textInputAction,
      required Function(String? value) validate,
      required Function(String? value) onChanged,
        List<TextInputFormatter>? inputFormatter,
        FocusNode? focusNode,
        TextStyle? textStyle,
        TextStyle? hintStyle,
        String? labelText,
        Widget? suffixIcon,
        Widget? prefixIcon,
        bool? isPassword,
        bool showLabel = false,
        Color? background,
        Color? borderColor,
        Color? cursorColor,
        BorderStyle? borderStyle,
        EdgeInsetsGeometry? contentPadding,
        double? borderRadius,
        int? maxLines,
        TextEditingController? controller}) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      inputFormatters: inputFormatter,
      cursorWidth: AppSize.s1,
      maxLines: maxLines ?? 1,
      cursorColor: cursorColor ?? Theme.of(context).primaryColorDark.withOpacity(AppSize.s0_8),
      textDirection: Constants.currentLocale ==
          LanguageType.ARABIC.getValue()
          ? ui.TextDirection.rtl
          : ui.TextDirection.ltr,
      keyboardType: textInputType,
      textInputAction: textInputAction,
      obscureText: isPassword ?? false,
      textAlignVertical: TextAlignVertical.center,
      textAlign: TextAlign.start, //Constants.currentLocale == LanguageType.ARABIC.getValue() ? ,
      validator: (value) => validate(value),
      onChanged: (value) => onChanged(value),
      decoration: InputDecoration(
          filled: true,
          fillColor: background ?? ColorManager.white.withOpacity(AppSize.s0_8),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? AppSize.s8)),
            borderSide: BorderSide(
                width: AppSize.s0_2,
                style: borderStyle ?? BorderStyle.solid,
                color: borderColor ?? Theme.of(context).primaryColorDark),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(borderRadius ?? AppSize.s8)),
            borderSide: BorderSide(
              width: AppSize.s0_2,
              style: borderStyle ?? BorderStyle.solid,
              color: ColorManager.error,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(borderRadius ?? AppSize.s8)),
            borderSide: BorderSide(
                width: AppSize.s0_2,
                style: borderStyle ?? BorderStyle.solid,
                color: ColorManager.error),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(borderRadius ?? AppSize.s8)),
            borderSide: BorderSide(
                width: AppSize.s0_2,
                style: borderStyle ?? BorderStyle.solid,
                color: borderColor ?? Theme.of(context).primaryColorDark),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(borderRadius ?? AppSize.s8)),
            borderSide: BorderSide(
                width: AppSize.s0_2,
                style: borderStyle ?? BorderStyle.solid,
                color: borderColor ?? Theme.of(context).primaryColorDark),
          ),
          labelText: showLabel ? labelText : hintText,
          labelStyle: hintStyle ?? TextStyle(
              fontSize: AppSize.s14,
              backgroundColor: Colors.transparent,
              color: Theme.of(context).primaryColorDark.withOpacity(AppSize.s0_8),
              fontFamily: FontConstants.family,
              fontWeight: FontWeightManager.bold),
          floatingLabelStyle: TextStyle(fontSize: AppSize.s14, color: Theme.of(context).primaryColorDark),
          hintText: hintText,
          hintStyle: hintStyle ?? TextStyle(
              fontSize: AppSize.s14,
              backgroundColor: Colors.transparent,
              color: Theme.of(context).primaryColorDark.withOpacity(AppSize.s0_8),
              fontFamily: FontConstants.family,
              fontWeight: FontWeightManager.bold),
          //alignLabelWithHint: true,
          errorStyle: TextStyle(
              fontSize: AppSize.s12,
              color: ColorManager.error,
              fontFamily: FontConstants.family,
              fontWeight: FontWeightManager.bold),
          floatingLabelBehavior: showLabel ? FloatingLabelBehavior.always : FloatingLabelBehavior.never,

          hintTextDirection: Constants.currentLocale ==
              LanguageType.ARABIC.getValue()
              ? ui.TextDirection.rtl
              : ui.TextDirection.ltr,
          border: OutlineInputBorder(
              borderSide: BorderSide(
                width: AppSize.s0_2,
                color: borderColor ?? Theme.of(context).primaryColorDark,
                style: BorderStyle.none,
              ),
              borderRadius: BorderRadius.all(
                  Radius.circular(borderRadius ?? AppSize.s8))),
          prefixIcon: prefixIcon,
          contentPadding: contentPadding ?? const EdgeInsets.symmetric(horizontal: AppSize.s12),
          suffixIcon: suffixIcon,
          errorMaxLines: 2),
      style: textStyle ??
          TextStyle(
              fontSize: AppSize.s14,
              color: Theme.of(context).primaryColorDark.withOpacity(AppSize.s0_8),
              fontFamily: FontConstants.family,
              fontWeight: FontWeightManager.bold),
    );
  }
  static void showMToast(
      BuildContext context, String message,TextStyle textStyle, Color background) {
    showToast(
      message,
      textStyle: textStyle,
      backgroundColor: background,
      context: context,
      position: StyledToastPosition.bottom,
      animDuration: const Duration(milliseconds: 500),
      duration: const Duration(milliseconds: 2500),
      animationBuilder: (
          BuildContext context,
          AnimationController controller,
          Duration duration,
          Widget child,
          ) {
        return SlideTransition(
          position: getAnimation<Offset>(
              const Offset(0.0, 3.0), const Offset(0, 0), controller,
              curve: Curves.bounceInOut),
          child: child,
        );
      },
      reverseAnimBuilder: (
          BuildContext context,
          AnimationController controller,
          Duration duration,
          Widget child,
          ) {
        return SlideTransition(
          position: AppConstants.isArabic()
              ? (getAnimation<Offset>(
              const Offset(0.0, 0.0), const Offset(-3.0, 0), controller,
              curve: Curves.easeInOut))
              : (getAnimation<Offset>(
              const Offset(0.0, 0.0), const Offset(3.0, 0), controller,
              curve: Curves.easeInOut)),
          child: child,
        );
      },
    );
  }

  static AppBar appBar({
    Color? statusBarColor,
    Color? backgroundColor,
    Brightness? statusBarIconBrightness,
    Brightness? statusBarBrightness,
    double? toolBarHeight,
    double? elevation,
    Widget? flexibleSpace
  }) {
    return AppBar(
      automaticallyImplyLeading: false,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: statusBarColor,
        statusBarIconBrightness: statusBarIconBrightness,
        // For Android (dark icons)
        statusBarBrightness: statusBarBrightness, // For iOS (dark icons)
      ),
      toolbarHeight: toolBarHeight,
      elevation: elevation ?? AppSize.s0,
      backgroundColor: backgroundColor,
      flexibleSpace: flexibleSpace,
    );
  }

  static Widget defaultButton({
    double? width,
    double height = AppSize.s50,
    Color background = Colors.deepPurple,
    Color textColor = Colors.white,
    Color borderColor = Colors.white,
    TextStyle? textStyle,
    double radius = AppSize.s8,
    bool isUpperCase = false,
    bool outline = false,
    required VoidCallback function,
    required String text,
  }) =>
      Container(
        padding: EdgeInsets.zero,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(radius)),
            color: outline ? Colors.transparent : background,
            border: Border.all(
              color: borderColor,
              width: AppSize.s0_8,
            )),
        child: MaterialButton(
          onPressed: function,
          height: height,
          child: Text(
            isUpperCase ? text.toUpperCase() : text,
            textAlign: TextAlign.center,
            style: textStyle ??
                TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    letterSpacing: 2,
                    color: textColor),
          ),
        ),
      );

  static Widget cachedImage(
      {required String url,
        required BorderRadius borderRadius,
        BoxFit? fit,
        double? height, double? width}) {
    return CachedNetworkImage(
      imageUrl: url,
      imageBuilder: (context, imageProvider) => ClipRRect(
        borderRadius: borderRadius,
        child: FadeInImage(
          height: height,
          width: width,
          fit: fit??BoxFit.fill,
          image: imageProvider,
          placeholder: const AssetImage(ImageAsset.placeholder),
          imageErrorBuilder: (context, error, stackTrace) {
            return Image.asset(
              ImageAsset.error,
              fit: BoxFit.fill,
              height: height,
              width: width,
            );
          },
        ),
      ),
      placeholder: (context, url) => CircularProgressIndicator(
        color: ColorManager.lightGreen,
        strokeWidth: AppSize.s0_8,
      ),
      errorWidget: (context, url, error) => FadeInImage(
        height: height,
        width: width,
        fit: BoxFit.fill,
        image: const AssetImage(ImageAsset.error),
        placeholder: const AssetImage(ImageAsset.placeholder),
      ),
    );
  }
}

class BlurryProgressDialog extends StatelessWidget {
  final String title;
  TextStyle? titleStyle;
  double? titleMinSize, titleMaxSize, blurValue;
  int? titleMaxLines;

  BlurryProgressDialog(
      {Key? key,
        required this.title,
        this.titleStyle,
        this.titleMaxLines,
        this.titleMaxSize,
        this.titleMinSize,
        this.blurValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection:
      AppConstants.isArabic() ? ui.TextDirection.rtl : ui.TextDirection.ltr,
      child: BackdropFilter(
          filter: ui.ImageFilter.blur(sigmaX: blurValue ?? 4, sigmaY: blurValue ?? 4),
          child: AlertDialog(
            backgroundColor: Theme.of(context).splashColor,
            scrollable: true,
            content: Column(
              children: [
                CircularProgressIndicator(
                  color: Theme.of(context).primaryColorDark,
                  strokeWidth: AppSize.s0_8,
                ),
                const SizedBox(
                  height: AppSize.s36,
                ),
                Text(
                  title,
                  style: titleStyle ??
                      TextStyle(
                          color: Theme.of(context).primaryColorDark,
                          fontSize: AppSize.s12,),
                  maxLines: titleMaxLines ?? AppSize.s2.toInt(),
                ),
                const SizedBox(
                  height: AppSize.s8,
                ),
              ],
            ),
          )),
    );
  }
}
