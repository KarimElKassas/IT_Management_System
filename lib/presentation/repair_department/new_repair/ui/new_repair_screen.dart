import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:it_work/presentation/repair_department/new_repair/bloc/new_repair_cubit.dart';
import 'package:it_work/presentation/repair_department/new_repair/bloc/new_repair_states.dart';
import 'package:it_work/resources/extensions.dart';
import 'package:it_work/utils/components.dart';
//import 'package:awesome_dialog/awesome_dialog.dart';

import '../../../../core/service/service_locator.dart';
import '../../../../resources/color_manager.dart';
import '../../../../resources/font_manager.dart';
import '../../../../resources/strings_manager.dart';
import '../../../../resources/values_manager.dart';

class NewRepairScreen extends StatelessWidget {
  NewRepairScreen({Key? key}) : super(key: key);

  var formKey = GlobalKey<FormState>();
  var formDeviceKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ValueNotifier<String> pickedStartDateFormatted = ValueNotifier(formatDate(DateTime.now()));
    ValueNotifier<String> pickedEndDateFormatted = ValueNotifier('');
    ValueNotifier<DateTime?> pickedStartDate = ValueNotifier(DateTime.now());
    ValueNotifier<DateTime?> pickedEndDate = ValueNotifier(DateTime.now());

    return BlocProvider(
      create: (context) => sl<NewRepairCubit>(),
      child: BlocConsumer<NewRepairCubit, NewRepairStates>(
        listener: (context, state) {
          if(state is NewRepairSearchForSeekerError){
            ScaffoldMessenger.of(context).showSnackBar(ReusableComponents.resultSnackBar(state.error.toString(),Colors.red));
          }
          if(state is NewRepairCreateSeekerError){
            ScaffoldMessenger.of(context).showSnackBar(ReusableComponents.resultSnackBar(state.error.toString(),Colors.red));
          }
          if(state is NewRepairGetDeviceError){
            ScaffoldMessenger.of(context).showSnackBar(ReusableComponents.resultSnackBar(state.error.toString(),Colors.red));
          }
          if(state is NewRepairCreateNewRepairError){
            ScaffoldMessenger.of(context).showSnackBar(ReusableComponents.resultSnackBar(state.error.toString(),Colors.red));
          }
          if(state is NewRepairCreateNewRepairSuccess){
              /*AwesomeDialog(
                  context: context,
                  dialogType: DialogType.success,
                  animType: AnimType.rightSlide,
                  title: 'تم تسجيل الصيانة بنجاح',
                titleTextStyle: TextStyle(
                  color: ColorManager.black,
                  fontFamily: FontConstants.family,
                  fontWeight: FontWeight.bold,
                  fontSize: AppSize.s18,
                ),
                width: MediaQuery.sizeOf(context).width / 3,
                btnOk: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00CA71),
                    padding: const EdgeInsets.all(16),
                    elevation: 5,
                  ),
                  child: Text(
                    'تمام',
                    style: TextStyle(
                      color: Theme.of(context).primaryColorDark,
                      fontFamily: FontConstants.family,
                      fontWeight: FontWeight.bold,
                      fontSize: AppSize.s18,
                    ),
                  ),
                )
            ).show();*/
            ScaffoldMessenger.of(context).showSnackBar(ReusableComponents.resultSnackBar("تم تسجيل الصيانة بنجاح",Colors.green));
          }
        },
        builder: (context, state) {
          var cubit = NewRepairCubit.get(context);
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
                  title: Text(
                    AppStrings.newRepair,
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
                      padding: const EdgeInsets.all(AppSize.s16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: ColorManager.BORDER_COLOR_DARK,
                              borderRadius: BorderRadius.circular(AppSize.s20)
                            ),
                            padding: const EdgeInsets.all(AppSize.s16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'تواريخ الصيانة',
                                  style: TextStyle(
                                      color:
                                      Theme.of(context).primaryColorDark,
                                      fontFamily: FontConstants.family,
                                      fontWeight: FontWeight.bold,
                                      fontSize: AppSize.s22),
                                ),
                                const SizedBox(height: AppSize.s16,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'تاريخ بدء الصيانة المتوقع : ',
                                      style: TextStyle(
                                          color:
                                              Theme.of(context).primaryColorDark,
                                          fontFamily: FontConstants.family,
                                          fontWeight: FontWeight.bold,
                                          fontSize: AppSize.s18),
                                    ),
                                    const SizedBox(width: AppSize.s20),
                                    Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                AppSize.s6),
                                            border: Border.all(color: Theme.of(context).primaryColorDark.withOpacity(0.3)),
                                            color: Colors.transparent
                                        ),
                                        padding: const EdgeInsets.symmetric(horizontal: AppSize.s6,vertical: AppSize.s12),
                                        child: ValueListenableBuilder(
                                          valueListenable: pickedStartDateFormatted,
                                          builder: (BuildContext context, String value, Widget? child) {
                                            return Center(
                                              child: Text(
                                                value == '' ? formatDate(DateTime.now()) : value,
                                                style: TextStyle(color: Theme.of(context).primaryColorDark,
                                                    fontSize: AppSize.s16,
                                                    fontFamily: FontConstants.family),
                                              ),
                                            );
                                          },
                                        )).ripple(() async {
                                      DateTime? pickedDate = await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(2023),
                                          lastDate: DateTime(2100));
                                      pickedStartDate.value = pickedDate;
                                      pickedStartDateFormatted.value = formatDate(pickedDate);
                                    }),
                                    Container(height: 50, width: 0.5, color: Colors.grey, margin: const EdgeInsets.symmetric(horizontal: AppSize.s20),),
                                    Text(
                                      'تاريخ انتهاء الصيانة المتوقع : ',
                                      style: TextStyle(
                                          color: Theme.of(context).primaryColorDark,
                                          fontFamily: FontConstants.family,
                                          fontWeight: FontWeight.bold,
                                          fontSize: AppSize.s18),
                                    ),
                                    const SizedBox(width: AppSize.s20),
                                    Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                AppSize.s6),
                                            border: Border.all(color: Theme.of(context).primaryColorDark.withOpacity(0.3)),
                                            color: Colors.transparent
                                        ),
                                        padding: const EdgeInsets.symmetric(horizontal: AppSize.s6,vertical: AppSize.s12),
                                        child: ValueListenableBuilder(
                                          valueListenable: pickedEndDateFormatted,
                                          builder: (BuildContext context, String value, Widget? child) {
                                            return Center(
                                              child: Text(
                                                value == '' ? formatDate(DateTime.now()) : value,
                                                style: TextStyle(color: Theme.of(context).primaryColorDark,
                                                    fontSize: AppSize.s16,
                                                    fontFamily: FontConstants.family),
                                              ),
                                            );
                                          },
                                        )).ripple(() async {
                                      DateTime? pickedDate = await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(2023),
                                          lastDate: DateTime(2100));
                                      pickedEndDate.value = pickedDate;
                                      pickedEndDateFormatted.value = formatDate(pickedDate);
                                    }),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: AppSize.s16),
                          Container(
                            decoration: BoxDecoration(
                                color: ColorManager.BORDER_COLOR_DARK,
                                borderRadius: BorderRadius.circular(AppSize.s20)
                            ),
                            padding: const EdgeInsets.all(AppSize.s16),
                            child: Column(
                              children: [
                                Text(
                                  'بيانات القائم بتسليم الجهاز',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColorDark,
                                      fontFamily: FontConstants.family,
                                      fontWeight: FontWeight.w600,
                                      fontSize: AppSize.s22),
                                ),
                                const SizedBox(height: AppSize.s20,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                'الرقم القومي / الرقم العسكري',
                                                style: TextStyle(
                                                    color: Theme.of(context).primaryColorDark,
                                                    fontFamily: FontConstants.family,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: AppSize.s18),
                                              ),
                                              const SizedBox(width: AppSize.s20),
                                              Expanded(
                                                child: Form(
                                                  key:formKey,
                                                  child: TextFormField(
                                                    cursorColor: Colors.grey,
                                                    onChanged: (value) {},
                                                    validator: (value){
                                                      if(value!.isEmpty){
                                                        return 'يجب ادخال الرقم القومى / العسكرى';
                                                      }else if(value.length < 13){
                                                        return 'عدد الارقام غير صحيح';
                                                      }
                                                    },
                                                    controller: cubit.personIdController,
                                                    decoration: const InputDecoration(
                                                      contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                                                      labelStyle: TextStyle(fontSize: 18, color: Colors.grey,fontFamily: FontConstants.family),
                                                      labelText: 'الرقم القومي / الرقم العسكري',
                                                      focusedBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(color: Colors.white),
                                                        borderRadius: BorderRadius.all(Radius.circular(AppSize.s10)),),
                                                    ),
                                                    style: TextStyle(
                                                      color: Theme.of(context).primaryColorDark,
                                                      fontFamily: FontConstants.family,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: AppSize.s16,),
                                          ElevatedButton(
                                            onPressed: () {
                                              if(formKey.currentState!.validate()){
                                                cubit.getSeekerById();
                                              }
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: ColorManager.BORDER_COLOR_DARK,
                                              side: BorderSide(color: Theme.of(context).indicatorColor),
                                              padding: const EdgeInsets.all(16),
                                              elevation: 5,
                                            ),
                                            child: Text(
                                              'تحقق الشخصية',
                                              style: TextStyle(
                                                color: Theme.of(context).primaryColorDark,
                                                fontFamily: FontConstants.family,
                                                fontWeight: FontWeight.bold,
                                                fontSize: AppSize.s18,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: AppSize.s32,),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                'اسم القائم بالتسليم  : ',
                                                style: TextStyle(
                                                    color: ColorManager.grey2,
                                                    fontFamily: FontConstants.family,
                                                    fontSize: AppSize.s20),
                                              ),
                                              Text(
                                               cubit.currentSeeker?.seekerName.split(':').last ?? "لا يوجد",
                                                style: TextStyle(
                                                  color: Theme.of(context).primaryColorDark,
                                                  fontFamily: FontConstants.family,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: AppSize.s20,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: AppSize.s20,),
                                          Row(
                                            children: [
                                              Text(
                                                'درجة / رتبة الشخص : ',
                                                style: TextStyle(
                                                    color: ColorManager.grey2,
                                                    fontFamily: FontConstants.family,
                                                    fontSize: AppSize.s20),
                                              ),
                                              Text(
                                                cubit.currentSeeker?.seekerName.split(':').first ?? "لا يوجد",
                                                style: TextStyle(
                                                  color: Theme.of(context).primaryColorDark,
                                                  fontFamily: FontConstants.family,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: AppSize.s20,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: AppSize.s16),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(AppSize.s16)),
                              color: ColorManager.BORDER_COLOR_DARK,
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
                                      AppStrings.deviceType,
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
                                    Row(
                                      children: [
                                        Checkbox(
                                          value: cubit.deviceType == 1,
                                          activeColor: Theme.of(context)
                                              .primaryColorDark,
                                          checkColor: ColorManager.blueColor,
                                          onChanged: (bool? value) async {
                                            cubit.changeDeviceType(1);
                                          },
                                        ),
                                        const SizedBox(width: AppSize.s16),
                                        Text(
                                          AppStrings.computer,
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
                                    const SizedBox(width: AppSize.s16,),
                                    Row(
                                      children: [
                                        Checkbox(
                                          value: cubit.deviceType == 2,
                                          activeColor: Theme.of(context)
                                              .primaryColorDark,
                                          checkColor: ColorManager.blueColor,
                                          onChanged: (bool? value) async {
                                            cubit.changeDeviceType(2);
                                          },
                                        ),
                                        const SizedBox(width: AppSize.s16),
                                        Text(
                                          AppStrings.laptop,
                                          style: TextStyle(
                                              color: Theme.of(context).primaryColorDark,
                                              fontFamily: FontConstants.family,
                                              fontSize: AppSize.s20,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(width: AppSize.s16,),
                                    Row(
                                      children: [
                                        Checkbox(
                                          value: cubit.deviceType == 3,
                                          activeColor: Theme.of(context)
                                              .primaryColorDark,
                                          checkColor: ColorManager.blueColor,
                                          onChanged: (bool? value) async {
                                            cubit.changeDeviceType(3);
                                          },
                                        ),
                                        const SizedBox(width: AppSize.s16),
                                        Text(
                                          AppStrings.screen,
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
                                    const SizedBox(width: AppSize.s16,),
                                    Row(
                                      children: [
                                        Checkbox(
                                          value: cubit.deviceType == 4,
                                          activeColor: Theme.of(context)
                                              .primaryColorDark,
                                          checkColor: ColorManager.blueColor,
                                          onChanged: (bool? value) async {
                                            cubit.changeDeviceType(4);
                                          },
                                        ),
                                        const SizedBox(width: AppSize.s16),
                                        Text(
                                          AppStrings.printer,
                                          style: TextStyle(
                                              color: Theme.of(context).primaryColorDark,
                                              fontFamily:
                                              FontConstants.family,
                                              fontSize: AppSize.s20,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: AppSize.s16),
                          Container(
                            decoration: BoxDecoration(
                                color: ColorManager.BORDER_COLOR_DARK,
                                borderRadius: BorderRadius.circular(20)
                            ),
                            padding: const EdgeInsets.all(AppSize.s16),
                            child: Column(
                              children: [
                                Text(
                                  'بيانات الجهاز',
                                  style: TextStyle(
                                      color:
                                      Theme.of(context).primaryColorDark,
                                      fontFamily: FontConstants.family,
                                      fontWeight: FontWeight.w600,
                                      fontSize: AppSize.s22),
                                ),
                                const SizedBox(height: AppSize.s16,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                'رقم الجهاز',
                                                style: TextStyle(
                                                    color: Theme.of(context).primaryColorDark,
                                                    fontFamily: FontConstants.family,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: AppSize.s18),
                                              ),
                                              const SizedBox(width: AppSize.s20),
                                              Expanded(
                                                child: Form(
                                                  key:formDeviceKey,
                                                  child: TextFormField(
                                                    cursorColor: Colors.grey,
                                                    onChanged: (value) {},
                                                    controller:cubit.deviceNumberController,
                                                      validator: (value){
                                                        if(value!.isEmpty){
                                                          return 'يجب ادخال رقم الجهاز';
                                                        }else if(value.length < 5){
                                                          return 'عدد الارقام غير صحيح';
                                                        }
                                                      },
                                                    decoration: const InputDecoration(
                                                      contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                                                      labelStyle: TextStyle(fontSize: 18, color: Colors.grey),
                                                      labelText: 'رقم الجهاز',
                                                      focusedBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(color: Colors.white),
                                                        borderRadius: BorderRadius.all(
                                                            Radius.circular(AppSize.s10)),
                                                      ),
                                                    ),
                                                    style: TextStyle(
                                                      color: Theme.of(context).primaryColorDark,
                                                      fontFamily: FontConstants.family,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: AppSize.s16,),
                                          ElevatedButton(
                                            onPressed: () {
                                                if(formDeviceKey.currentState!.validate()){
                                                  cubit.getDeviceBySerial();
                                                }
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: ColorManager.BORDER_COLOR_DARK,
                                              side: BorderSide(color: Theme.of(context).indicatorColor),
                                              padding: const EdgeInsets.all(16),
                                              elevation: 5,
                                            ),
                                            child: Text(
                                              'تحقق من الجهاز',
                                              style: TextStyle(
                                                color: Theme.of(context).primaryColorDark,
                                                fontFamily: FontConstants.family,
                                                fontWeight: FontWeight.bold,
                                                fontSize: AppSize.s18,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: AppSize.s32,),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                'الادارة التابع لها الجهاز : ',
                                                style: TextStyle(
                                                    color: ColorManager.grey2,
                                                    fontFamily: FontConstants.family,
                                                    fontSize: AppSize.s20),
                                              ),
                                              Text(
                                                cubit.currentDepartment ?? "لا يوجد",
                                                style: TextStyle(
                                                  color: Theme.of(context).primaryColorDark,
                                                  fontFamily: FontConstants.family,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: AppSize.s20,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: AppSize.s20,),
                                          Row(
                                            children: [
                                              Text(
                                                'المنطقة التابع لها الجهاز : ',
                                                style: TextStyle(
                                                    color: ColorManager.grey2,
                                                    fontFamily: FontConstants.family,
                                                    fontSize: AppSize.s20),
                                              ),
                                              Text(
                                                cubit.currentArea ?? "لا يوجد",
                                                style: TextStyle(
                                                  color: Theme.of(context).primaryColorDark,
                                                  fontFamily: FontConstants.family,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: AppSize.s20,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Container(height: 0.5, width: double.infinity, color: Colors.grey, margin: const EdgeInsets.symmetric(vertical: AppSize.s20),),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Text(
                                            'الملاحظات الفنية',
                                            style: TextStyle(
                                              color: Theme.of(context).primaryColorDark,
                                              fontFamily: FontConstants.family,
                                              fontWeight: FontWeight.bold,
                                              fontSize: AppSize.s18,
                                            ),
                                          ),
                                          const SizedBox(width: AppSize.s12),
                                          Expanded(
                                            child: TextFormField(
                                              maxLines: null,
                                              cursorColor: Colors.grey,
                                              onChanged: (value) {},
                                              controller: cubit.technicalNotesController,
                                              decoration: const InputDecoration(
                                                contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                                                // hintText: AppStrings.department,
                                                labelStyle: TextStyle(fontSize: 18, color: Colors.grey),
                                                labelText: 'الملاحظات',
                                                focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(color: Colors.white),
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(AppSize.s10)),
                                                ),
                                              ),
                                              style: TextStyle(
                                                color: Theme.of(context).primaryColorDark,
                                                fontFamily: FontConstants.family,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: AppSize.s32),
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Text(
                                            'الملاحظات الجانبية',
                                            style: TextStyle(
                                              color: Theme.of(context).primaryColorDark,
                                              fontFamily: FontConstants.family,
                                              fontWeight: FontWeight.bold,
                                              fontSize: AppSize.s18,
                                            ),
                                          ),
                                          const SizedBox(width: AppSize.s12),
                                          Expanded(
                                            child: TextFormField(
                                              maxLines: null,
                                              cursorColor: Colors.grey,
                                              onChanged: (value) {},
                                              controller: cubit.notesController,
                                              decoration: const InputDecoration(
                                                contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                                                // hintText: AppStrings.department,
                                                labelStyle: TextStyle(fontSize: 18, color: Colors.grey),
                                                labelText: 'الملاحظات',
                                                focusedBorder: OutlineInputBorder(
                                                  borderSide:
                                                  BorderSide(color: Colors.white),
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(AppSize.s10)),
                                                ),
                                              ),
                                              style: TextStyle(
                                                color: Theme.of(context).primaryColorDark,
                                                fontFamily: FontConstants.family,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 30),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                if(formKey.currentState!.validate() && formDeviceKey.currentState!.validate()){
                                  cubit.createNewRepair(pickedStartDate.value!, pickedEndDate.value!);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                Theme.of(context).indicatorColor,
                                padding: const EdgeInsets.all(16),
                                elevation: 5,
                              ),
                              child: Text(
                                'تسليم الجهاز',
                                style: TextStyle(
                                  color: Theme.of(context).primaryColorDark,
                                  fontFamily: FontConstants.family,
                                  fontWeight: FontWeight.bold,
                                  fontSize: AppSize.s18,
                                ),
                              ),
                            ),),
                          const SizedBox(height: 30),
                        ],
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

  String formatDate(DateTime? pickedDate) {
    var format2 = DateFormat("EEE , d MMM , yyyy" ,"ar");
    var dateString = format2.format(pickedDate!);
    return dateString;
  }
  DateTime parseDate(String dateString) {
    var format = DateFormat("EEE, d MMM, yyyy", "ar");
    DateTime parsedDate = format.parse(dateString);
    return parsedDate;
  }
}
