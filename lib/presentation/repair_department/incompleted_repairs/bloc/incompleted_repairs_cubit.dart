import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:it_work/data/models/device_maintenance_task_model.dart';
import 'package:it_work/presentation/repair_department/incompleted_repairs/bloc/incompleted_repairs_states.dart';
import 'package:it_work/utils/prefs_helper.dart';

import '../../../../domain/usecase/get_repairs_use_case.dart';

class InCompletedRepairsCubit extends Cubit<InCompletedRepairsStates>{
  InCompletedRepairsCubit(this.getRepairsUseCase) : super(InCompletedRepairsInit());

  GetRepairsUseCase getRepairsUseCase;

  static InCompletedRepairsCubit get(context) => BlocProvider.of(context);

  List<String> repairsList = ['no','s'];
  List<DeviceMaintenanceTaskModel> tasksList = [];
  List<DeviceMaintenanceTaskModel> filteredTasksList = [];

  Future<void> getTasks() async {
    emit(InCompletedRepairsLoadingTasks());
    final sessionToken = Preference.prefs.getString("sessionToken")!;
    final result = await getRepairsUseCase(GetMaintenanceTasksParameters(sessionToken));
    result.fold(
            (l) => emit(InCompletedRepairsGetTasksError(l.errMessage)),
            (r) {
              tasksList = r;
              filteredTasksList = tasksList;
          emit(InCompletedRepairsGetTasksSuccess());
        });
  }

  String getDeviceType(DeviceMaintenanceTaskModel device){
    if (device.pcDeviceId == null){
      if(device.screenId == null){
        return 'طابعة';
      }else{
        return 'شاشة';
      }
    }else{
      if(device.isLaptop){
        return 'لاب توب';
      }else{
        return 'كمبيوتر';
      }
    }
  }
}