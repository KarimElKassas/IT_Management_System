import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:it_work/presentation/repair_department/repair_home/bloc/repair_home_states.dart';

class RepairHomeCubit extends Cubit<RepairHomeStates>{
  RepairHomeCubit() : super(RepairHomeInit());

  static RepairHomeCubit get(context) => BlocProvider.of(context);


}