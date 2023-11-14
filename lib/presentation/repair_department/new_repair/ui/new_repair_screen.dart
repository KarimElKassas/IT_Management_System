import 'package:animate_do/animate_do.dart';
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

class NewRepairScreen extends StatelessWidget {
  const NewRepairScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  title: Text(AppStrings.newRepair,style: TextStyle(color: Theme.of(context).primaryColorDark,fontFamily: FontConstants.family,fontWeight: FontWeight.bold,fontSize: AppSize.s18),),
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
                                  child: Icon(Icons.add_circle_outline_outlined, size: 76, color: Theme.of(context).primaryColorDark,),
                                ),
                                const SizedBox(height: AppSize.s16),
                                Text(AppStrings.newRepair, style: TextStyle(color: Theme.of(context).primaryColorDark, fontFamily: FontConstants.family, fontSize: AppSize.s22, fontWeight: FontWeight.bold),)
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
                                  child: Icon(Icons.timelapse_outlined, size: 76, color: Theme.of(context).primaryColorDark,),
                                ),
                                const SizedBox(height: AppSize.s16,),
                                Text(AppStrings.pendingRepairs, style: TextStyle(color: Theme.of(context).primaryColorDark, fontFamily: FontConstants.family, fontSize: AppSize.s22, fontWeight: FontWeight.bold),)
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
                                  child: Icon(Icons.history_outlined, size: 76, color: Theme.of(context).primaryColorDark,),
                                ),
                                const SizedBox(height: AppSize.s16,),
                                Text(AppStrings.repairHistory, style: TextStyle(color: Theme.of(context).primaryColorDark, fontFamily: FontConstants.family, fontSize: AppSize.s22, fontWeight: FontWeight.bold),)
                              ],
                            ),
                          ).ripple((){},borderRadius: const BorderRadius.all(Radius.circular(AppSize.s16)),overlayColor: MaterialStateColor.resolveWith((
                              states) =>
                              Theme
                                  .of(context)
                                  .primaryColorDark
                                  .withOpacity(0.15)))
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
}
