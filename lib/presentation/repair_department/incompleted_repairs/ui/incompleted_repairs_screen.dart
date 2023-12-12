import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:it_work/presentation/repair_department/incompleted_repairs/bloc/incompleted_repairs_cubit.dart';
import 'package:it_work/presentation/repair_department/incompleted_repairs/bloc/incompleted_repairs_states.dart';
import 'package:it_work/presentation/repair_department/incompleted_repairs/widgets/overview_repair_item.dart';

import '../../../../core/service/service_locator.dart';
import '../../../../resources/color_manager.dart';
import '../../../../resources/font_manager.dart';
import '../../../../resources/strings_manager.dart';
import '../../../../resources/values_manager.dart';

class InCompletedRepairsScreen extends StatelessWidget {
  const InCompletedRepairsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => sl<InCompletedRepairsCubit>()..getTasks(),
        child: BlocConsumer<InCompletedRepairsCubit,InCompletedRepairsStates>(
            listener: (context,state){},
            builder: (context,state){
              var cubit = InCompletedRepairsCubit.get(context);
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
                            AppStrings.pendingRepairs,
                            style: TextStyle(
                                color: Theme.of(context).primaryColorDark,
                                fontFamily: FontConstants.family,
                                fontWeight: FontWeight.bold,
                                fontSize: AppSize.s18),
                          ),
                        ),
                        backgroundColor: Theme.of(context).primaryColorLight,
                        body: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: ListView.builder(
                              physics: const ClampingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: cubit.filteredTasksList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return OverViewRepairItem(cubit: cubit,index: index);
                              },
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
