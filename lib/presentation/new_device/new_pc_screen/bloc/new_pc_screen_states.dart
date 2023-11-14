abstract class NewPcScreenStates {}

class NewPcScreenInit extends NewPcScreenStates {}

class NewPcScreenChangeSector extends NewPcScreenStates {}

class NewPcScreenChangeDepartment extends NewPcScreenStates {}

class NewPcScreenChangeArea extends NewPcScreenStates {}

class NewPcScreenChangeBrand extends NewPcScreenStates {}

class NewPcScreenChangeSize extends NewPcScreenStates {}

class NewPcScreenChangeCurved extends NewPcScreenStates {}

class NewPcScreenLoadingSectors extends NewPcScreenStates {}

class NewPcScreenLoadingDepartments extends NewPcScreenStates {}

class NewPcScreenLoadingAreas extends NewPcScreenStates {}

class NewPcScreenLoadingBrands extends NewPcScreenStates {}

class NewPcScreenLoadingCreateScreen extends NewPcScreenStates {}

class NewPcScreenSuccessGetSectors extends NewPcScreenStates {}

class NewPcScreenSuccessGetDepartments extends NewPcScreenStates {}

class NewPcScreenSuccessGetAreas extends NewPcScreenStates {}

class NewPcScreenSuccessGetBrands extends NewPcScreenStates {}

class NewPcScreenSuccessCreateScreen extends NewPcScreenStates {}

class NewPcScreenErrorGetSectors extends NewPcScreenStates {
  final String error;

  NewPcScreenErrorGetSectors(this.error);
}

class NewPcScreenErrorGetDepartments extends NewPcScreenStates {
  final String error;

  NewPcScreenErrorGetDepartments(this.error);
}

class NewPcScreenErrorGetAreas extends NewPcScreenStates {
  final String error;

  NewPcScreenErrorGetAreas(this.error);
}

class NewPcScreenErrorGetBrands extends NewPcScreenStates {
  final String error;

  NewPcScreenErrorGetBrands(this.error);
}

class NewPcScreenErrorCreateScreen extends NewPcScreenStates {
  final String error;

  NewPcScreenErrorCreateScreen(this.error);
}