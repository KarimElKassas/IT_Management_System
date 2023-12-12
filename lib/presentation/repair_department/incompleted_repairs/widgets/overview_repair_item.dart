import 'package:flutter/material.dart';
import 'package:it_work/presentation/repair_department/incompleted_repairs/bloc/incompleted_repairs_cubit.dart';
import 'package:it_work/resources/extensions.dart';
import 'package:it_work/resources/font_manager.dart';
import 'package:it_work/resources/values_manager.dart';

import '../../../../resources/color_manager.dart';

class OverViewRepairItem extends StatelessWidget {
  OverViewRepairItem({Key? key,required this.cubit,required this.index}) : super(key: key);
  InCompletedRepairsCubit cubit;
  int index;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: ColorManager.BORDER_COLOR_DARK,
              borderRadius: BorderRadius.circular(AppSize.s12),
          ),
          padding: const EdgeInsets.all(AppSize.s16),
          child: Row(
            children: [
              const Icon(Icons.devices,color: Colors.white,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:AppSize.s12),
                child: Text(
                  'نوع الجهاز : ${cubit.getDeviceType(cubit.filteredTasksList[index])}',
                  style: TextStyle(
                      color: Theme.of(context).primaryColorDark,
                      fontFamily: FontConstants.family,
                      fontWeight: FontWeight.w400,
                      fontSize: AppSize.s20),
                ),
              ),
              const Spacer(),
              const Icon(Icons.info_outline_rounded,color: Colors.white,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:AppSize.s12),
                child: Text(
                  'سيريال الجهاز : ${cubit.filteredTasksList[index].serialNumber}',
                  style: TextStyle(
                      color: Theme.of(context).primaryColorDark,
                      fontFamily: FontConstants.family,
                      fontWeight: FontWeight.w400,
                      fontSize: AppSize.s20),
                ),
              ),
              const Spacer(),
              const Icon(Icons.numbers_rounded,color: Colors.white,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:AppSize.s12),
                child: Text(
                  'رقم الصيانة : ${cubit.filteredTasksList[index].deviceMaintenanceTaskId}',
                  style: TextStyle(
                      color: Theme.of(context).primaryColorDark,
                      fontFamily: FontConstants.family,
                      fontWeight: FontWeight.w400,
                      fontSize: AppSize.s20),
                ),
              ),
            ],
          ),
        ).ripple((){}, borderRadius: const BorderRadius.all(Radius.circular(AppSize.s12)), overlayColor: MaterialStateColor.resolveWith((states) => Theme.of(context).primaryColorDark.withOpacity(AppSize.s0_1))),
        const SizedBox(height: AppSize.s16,)
      ],
    );
  }
}
