import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:it_work/presentation/repair_department/new_repair/bloc/new_repair_cubit.dart';
import 'package:it_work/presentation/repair_department/new_repair/bloc/new_repair_states.dart';
import 'package:it_work/resources/extensions.dart';

import '../../../../core/service/service_locator.dart';
import '../../../../resources/color_manager.dart';
import '../../../../resources/font_manager.dart';
import '../../../../resources/strings_manager.dart';
import '../../../../resources/values_manager.dart';
import '../../../../utils/components.dart';

class NewRepairScreen extends StatelessWidget {
  const NewRepairScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ValueNotifier<String> pickedStartDate = ValueNotifier('');
    ValueNotifier<String> pickedEndDate = ValueNotifier('');

    return BlocProvider(
      create: (context) => sl<NewRepairCubit>(),
      child: BlocConsumer<NewRepairCubit, NewRepairStates>(
        listener: (context, state) {},
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
                            padding: const EdgeInsets.symmetric(vertical: AppSize.s16),
                            child: Column(
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'تاريخ بدء الصيانة : ',
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
                                          valueListenable: pickedStartDate,
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
                                      pickedStartDate.value = formatDate(pickedDate);
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
                                          valueListenable: pickedEndDate,
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
                                      pickedEndDate.value = formatDate(pickedDate);
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
                            padding: const EdgeInsets.symmetric(vertical: AppSize.s16),
                            child: Column(
                              children: [
                                Text(
                                  'بيانات القائم بتسليم الجهاز',
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
                                    Text(
                                      'الرقم القومي / الرقم العسكري',
                                      style: TextStyle(
                                          color: Theme.of(context).primaryColorDark,
                                          fontFamily: FontConstants.family,
                                          fontWeight: FontWeight.bold,
                                          fontSize: AppSize.s18),
                                    ),
                                    const SizedBox(width: AppSize.s20),
                                    SizedBox(
                                      width: AppSize.s300,
                                      child: TextFormField(
                                        cursorColor: Colors.grey,
                                        onChanged: (value) {},
                                        decoration: const InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                                          labelStyle: TextStyle(fontSize: 18, color: Colors.grey,fontFamily: FontConstants.family),
                                          labelText: 'الرقم القومي / الرقم العسكري',
                                          focusedBorder: OutlineInputBorder(
                                            borderSide:
                                            BorderSide(color: Colors.white),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(AppSize.s10)),
                                          ),
                                        ),
                                        style: TextStyle(
                                          color:
                                          Theme.of(context).primaryColorDark,
                                          fontFamily: FontConstants.family,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 50),
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                        Theme.of(context).indicatorColor,
                                        padding: EdgeInsets.all(16),
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
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'اسم القائم بالتسليم',
                                      style: TextStyle(
                                          color: ColorManager.grey2,
                                          fontFamily: FontConstants.family,
                                          fontSize: AppSize.s18),
                                    ),
                                    const SizedBox(width: 20),
                                    Text(
                                      'محمد',
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColorDark,
                                        fontFamily: FontConstants.family,
                                        fontWeight: FontWeight.bold,
                                        fontSize: AppSize.s18,
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    Container(height: 50, width: 0.5, color: Colors.grey,),
                                    const SizedBox(width: 20),
                                    Text(
                                      'رقم تعريف القائم بالتسليم',
                                      style: TextStyle(
                                          color: ColorManager.grey2,
                                          fontFamily: FontConstants.family,
                                          fontSize: AppSize.s18),
                                    ),
                                    const SizedBox(width: 20),
                                    Text(
                                      '18',
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColorDark,
                                        fontFamily: FontConstants.family,
                                        fontWeight: FontWeight.bold,
                                        fontSize: AppSize.s18,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: AppSize.s10),
                          Center(
                              child: Container(
                                height: 0.5,
                                width: MediaQuery.sizeOf(context).width * 0.8,
                                color: Colors.grey,
                              )),
                          const SizedBox(height: AppSize.s10),
                          Center(
                            child: Container(
                              height: 450,
                              width: MediaQuery.sizeOf(context).width * 0.98,
                              decoration: BoxDecoration(
                                  color: ColorManager.BORDER_COLOR_DARK,
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              child: Column(
                                children: [
                                  Center(
                                    child: Column(
                                      children: [
                                        Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.symmetric(
                                                      vertical: 40, horizontal: 20),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        'رقم الجهاز',
                                                        style: TextStyle(
                                                            color:
                                                            Theme.of(context).primaryColorDark,
                                                            fontFamily: FontConstants.family,
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: AppSize.s18),
                                                      ),
                                                      const SizedBox(width: 20),
                                                      SizedBox(
                                                        width: 200,
                                                        child: TextFormField(
                                                          cursorColor: Colors.grey,
                                                          onChanged: (value) {},
                                                          decoration: const InputDecoration(
                                                            contentPadding: EdgeInsets.symmetric(
                                                                vertical: 20, horizontal: 20),
                                                            // hintText: AppStrings.department,

                                                            labelStyle: TextStyle(
                                                                fontSize: 18, color: Colors.grey),
                                                            labelText:
                                                            'رقم الجهاز',
                                                            focusedBorder: OutlineInputBorder(
                                                              borderSide:
                                                              BorderSide(color: Colors.white),
                                                              borderRadius: BorderRadius.all(
                                                                  Radius.circular(AppSize.s10)),
                                                            ),
                                                          ),
                                                          style: TextStyle(
                                                            color:
                                                            Theme.of(context).primaryColorDark,
                                                            fontFamily: FontConstants.family,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(width: 50),
                                                ElevatedButton(
                                                  onPressed: () {},
                                                  style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                    Theme.of(context).indicatorColor,
                                                    padding: EdgeInsets.all(16),
                                                    elevation: 5,
                                                  ),
                                                  child: Text(
                                                    'تحقق من الرقم',
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
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'الادارة التابعة',
                                                  style: TextStyle(
                                                      color: ColorManager.grey2,
                                                      fontFamily: FontConstants.family,
                                                      fontSize: AppSize.s18),
                                                ),
                                                const SizedBox(width: 20),
                                                Text(
                                                  'ادارة الرقمنة',
                                                  style: TextStyle(
                                                    color: Theme.of(context).primaryColorDark,
                                                    fontFamily: FontConstants.family,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: AppSize.s18,
                                                  ),
                                                ),
                                                const SizedBox(width: 20),
                                                Container(height: 50, width: 0.5, color: Colors.grey,),
                                                const SizedBox(width: 20),
                                                Text(
                                                  'المنطقة التابعة',
                                                  style: TextStyle(
                                                      color: ColorManager.grey2,
                                                      fontFamily: FontConstants.family,
                                                      fontSize: AppSize.s18),
                                                ),
                                                const SizedBox(width: 20),
                                                Text(
                                                  'الضبعة',
                                                  style: TextStyle(
                                                    color: Theme.of(context).primaryColorDark,
                                                    fontFamily: FontConstants.family,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: AppSize.s18,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 20),
                                        Text(
                                          'الملاحظات الفنية',
                                          style: TextStyle(
                                            color: Theme.of(context).primaryColorDark,
                                            fontFamily: FontConstants.family,
                                            fontWeight: FontWeight.bold,
                                            fontSize: AppSize.s18,
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                        SizedBox(
                                          width: MediaQuery.sizeOf(context).width*0.5,
                                          child: TextFormField(
                                            maxLines: null,
                                            cursorColor: Colors.grey,
                                            onChanged: (value) {},
                                            decoration: const InputDecoration(
                                              contentPadding: EdgeInsets.symmetric(
                                                  vertical: 20, horizontal: 20),
                                              // hintText: AppStrings.department,

                                              labelStyle: TextStyle(
                                                  fontSize: 18, color: Colors.grey),
                                              labelText:
                                              'الملاحظات',
                                              focusedBorder: OutlineInputBorder(
                                                borderSide:
                                                BorderSide(color: Colors.white),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(AppSize.s10)),
                                              ),
                                            ),
                                            style: TextStyle(
                                              color:
                                              Theme.of(context).primaryColorDark,
                                              fontFamily: FontConstants.family,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 30),
                                  Center(
                                    child: Column(
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
                                        const SizedBox(height: 20),
                                        SizedBox(
                                          width: MediaQuery.sizeOf(context).width*0.5,
                                          child: TextFormField(
                                            maxLines: null,
                                            cursorColor: Colors.grey,
                                            onChanged: (value) {},
                                            decoration: const InputDecoration(
                                              contentPadding: EdgeInsets.symmetric(
                                                  vertical: 20, horizontal: 20),
                                              // hintText: AppStrings.department,

                                              labelStyle: TextStyle(
                                                  fontSize: 18, color: Colors.grey),
                                              labelText:
                                              'الملاحظات',
                                              focusedBorder: OutlineInputBorder(
                                                borderSide:
                                                BorderSide(color: Colors.white),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(AppSize.s10)),
                                              ),
                                            ),
                                            style: TextStyle(
                                              color:
                                              Theme.of(context).primaryColorDark,
                                              fontFamily: FontConstants.family,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 30),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Center(
                              child: Container(
                                height: 0.5,
                                width: MediaQuery.sizeOf(context).width * 0.8,
                                color: Colors.grey,
                              )),
                          const SizedBox(height: 30),
                          Center(
                            child:  ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                Theme.of(context).indicatorColor,
                                padding: EdgeInsets.all(16),
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
}
