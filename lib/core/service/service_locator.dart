import 'package:get_it/get_it.dart';
import 'package:it_work/data/datasource/remote/remote_data_source.dart';
import 'package:it_work/data/repository/repository.dart';
import 'package:it_work/domain/repository/base_repository.dart';
import 'package:it_work/domain/usecase/add_area_use_case.dart';
import 'package:it_work/domain/usecase/add_device_use_case.dart';
import 'package:it_work/domain/usecase/add_screen_use_case.dart';
import 'package:it_work/domain/usecase/add_sector_use_case.dart';
import 'package:it_work/domain/usecase/get_areas_use_case.dart';
import 'package:it_work/domain/usecase/get_departments_use_case.dart';
import 'package:it_work/domain/usecase/get_graphic_brands_use_case.dart';
import 'package:it_work/domain/usecase/get_graphic_models_use_case.dart';
import 'package:it_work/domain/usecase/get_hard_type_use_case.dart';
import 'package:it_work/domain/usecase/get_pc_model_use_case.dart';
import 'package:it_work/domain/usecase/get_processor_brands_use_case.dart';
import 'package:it_work/domain/usecase/get_processor_gens_use_case.dart';
import 'package:it_work/domain/usecase/get_processor_models_use_case.dart';
import 'package:it_work/domain/usecase/get_ram_type_use_case.dart';
import 'package:it_work/domain/usecase/get_screen_brand_use_case.dart';
import 'package:it_work/domain/usecase/get_sectors_use_case.dart';
import 'package:it_work/domain/usecase/get_user_use_case.dart';
import 'package:it_work/presentation/home/bloc/home_cubit.dart';
import 'package:it_work/presentation/login/bloc/login_cubit.dart';
import 'package:it_work/presentation/new_device/new_pc_screen/bloc/new_pc_screen_cubit.dart';
import 'package:it_work/presentation/repair_department/new_repair/bloc/new_repair_cubit.dart';
import 'package:it_work/presentation/repair_department/repair_home/bloc/repair_home_cubit.dart';
import 'package:it_work/presentation/shared_cubit/new_info_cubit.dart';

import '../../domain/usecase/add_department_use_case.dart';
import '../../domain/usecase/add_processor_brand_use_case.dart';
import '../../domain/usecase/add_processor_model_use_case.dart';
import '../../domain/usecase/login_user_use_case.dart';
import '../../presentation/new_device/new_computer/bloc/new_computer_cubit.dart';
import '../../presentation/new_device/new_laptop/bloc/new_laptop_cubit.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void setup() {
    /// Blocs
    sl.registerFactory(() => LoginCubit(sl(), sl()));
    sl.registerFactory(() => HomeCubit(sl(), sl(), sl()));
    sl.registerFactory(() => RepairHomeCubit());
    sl.registerFactory(() => NewRepairCubit());
    sl.registerFactory(() => NewComputerCubit(sl(), sl(), sl(), sl(), sl(),
        sl(), sl(), sl(), sl(), sl(), sl(), sl()));
    sl.registerFactory(() => NewLaptopCubit(sl(), sl(), sl(), sl(), sl(), sl(),
        sl(), sl(), sl(), sl(), sl(), sl()));
    sl.registerFactory(() => NewPcScreenCubit(sl(), sl(), sl(), sl(), sl()));
    sl.registerFactory(() => NewInfoCubit(sl(), sl(), sl(), sl(), sl(), sl(), sl()));

    /// Remote Data Source
    sl.registerLazySingleton<BaseRemoteDataSource>(() => RemoteDataSource());

    /// Base Archive Repository
    sl.registerLazySingleton<BaseRepository>(() => ITRepository(sl()));

    ///Use Cases
    sl.registerLazySingleton<LoginUserUseCase>(() => LoginUserUseCase(sl()));
    sl.registerLazySingleton<GetUserUseCase>(() => GetUserUseCase(sl()));
    sl.registerLazySingleton<GetSectorsUseCase>(() => GetSectorsUseCase(sl()));
    sl.registerLazySingleton<GetDepartmentsUseCase>(
        () => GetDepartmentsUseCase(sl()));
    sl.registerLazySingleton<GetAreasUseCase>(() => GetAreasUseCase(sl()));
    sl.registerLazySingleton<GetProcessorBrandsUseCase>(
        () => GetProcessorBrandsUseCase(sl()));
    sl.registerLazySingleton<GetProcessorModelsUseCase>(
        () => GetProcessorModelsUseCase(sl()));
    sl.registerLazySingleton<GetProcessorGensUseCase>(
        () => GetProcessorGensUseCase(sl()));
    sl.registerLazySingleton<GetGraphicBrandsUseCase>(
        () => GetGraphicBrandsUseCase(sl()));
    sl.registerLazySingleton<GetGraphicModelsUseCase>(
        () => GetGraphicModelsUseCase(sl()));
    sl.registerLazySingleton<GetRamTypesUseCase>(
        () => GetRamTypesUseCase(sl()));
    sl.registerLazySingleton<GetHardTypesUseCase>(
        () => GetHardTypesUseCase(sl()));
    sl.registerLazySingleton<GetPcModelUseCase>(() => GetPcModelUseCase(sl()));
    sl.registerLazySingleton<GetScreenBrandsUseCase>(
        () => GetScreenBrandsUseCase(sl()));
    sl.registerLazySingleton<AddDeviceUseCase>(() => AddDeviceUseCase(sl()));
    sl.registerLazySingleton<AddScreenUseCase>(() => AddScreenUseCase(sl()));
    sl.registerLazySingleton<AddSectorUseCase>(() => AddSectorUseCase(sl()));
    sl.registerLazySingleton<AddAreaUseCase>(() => AddAreaUseCase(sl()));
    sl.registerLazySingleton<AddDepartmentUseCase>(
        () => AddDepartmentUseCase(sl()));
    sl.registerLazySingleton<AddProcessorBrandUseCase>(
            () => AddProcessorBrandUseCase(sl()));
    sl.registerLazySingleton<AddProcessorModelUseCase>(
            () => AddProcessorModelUseCase(sl()));
  }
}
