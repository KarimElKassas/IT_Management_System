import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:it_work/presentation/repair_department/new_repair/bloc/new_repair_states.dart';

class NewRepairCubit extends Cubit<NewRepairStates>{
  NewRepairCubit() : super(NewRepairInit());

  static NewRepairCubit get(context) => BlocProvider.of(context);


}