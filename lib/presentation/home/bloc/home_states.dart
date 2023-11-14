abstract class HomeStates{}
class HomeInitialState extends HomeStates{}
class HomeChangeSelectedSector extends HomeStates{}
class HomeChangeSelectedDepartment extends HomeStates{}
class HomeChangeSelectedArea extends HomeStates{}
class HomeLogOut extends HomeStates{}
class HomeLoadingSectors extends HomeStates{}
class HomeGetSectorsSuccess extends HomeStates{}
class HomeGetSectorsError extends HomeStates{
  final String error;

  HomeGetSectorsError(this.error);
}
class HomeLoadingDepartments extends HomeStates{}
class HomeGetDepartmentsSuccess extends HomeStates{}
class HomeGetDepartmentsError extends HomeStates{
  final String error;

  HomeGetDepartmentsError(this.error);
}
class HomeLoadingAreas extends HomeStates{}
class HomeGetAreasSuccess extends HomeStates{}
class HomeGetAreasError extends HomeStates{
  final String error;

  HomeGetAreasError(this.error);
}