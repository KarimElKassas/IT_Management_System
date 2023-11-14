abstract class NewComputerStates {}

class NewComputerInit extends NewComputerStates {}

class NewComputerChangeSector extends NewComputerStates {}

class NewComputerChangeDepartment extends NewComputerStates {}

class NewComputerChangeArea extends NewComputerStates {}

class NewComputerChangeDeviceModel extends NewComputerStates {}

class NewComputerChangeProcessorBrand extends NewComputerStates {}

class NewComputerChangeProcessorModel extends NewComputerStates {}

class NewComputerChangeProcessorGen extends NewComputerStates {}

class NewComputerChangeGraphicsCardBrand extends NewComputerStates {}

class NewComputerChangeGraphicsCardModel extends NewComputerStates {}

class NewComputerChangeGraphicsCardSize extends NewComputerStates {}

class NewComputerChangeHardType extends NewComputerStates {}

class NewComputerChangeHardSize extends NewComputerStates {}

class NewComputerChangeRamModel extends NewComputerStates {}

class NewComputerChangeRamSize extends NewComputerStates {}
class NewComputerChangeSecondaryHard extends NewComputerStates {}

class NewComputerLoadingSectors extends NewComputerStates {}

class NewComputerLoadingDepartments extends NewComputerStates {}

class NewComputerLoadingAreas extends NewComputerStates {}

class NewComputerLoadingDeviceModels extends NewComputerStates {}

class NewComputerLoadingProcessorBrand extends NewComputerStates {}

class NewComputerLoadingProcessorModel extends NewComputerStates {}

class NewComputerLoadingProcessorGeneration extends NewComputerStates {}

class NewComputerLoadingGraphicsCardBrand extends NewComputerStates {}

class NewComputerLoadingGraphicsCardModel extends NewComputerStates {}

class NewComputerLoadingGraphicsCardSize extends NewComputerStates {}

class NewComputerLoadingRamModel extends NewComputerStates {}

class NewComputerLoadingHardTypes extends NewComputerStates {}

class NewComputerLoadingPcModels extends NewComputerStates {}

class NewComputerLoadingCreateDevice extends NewComputerStates {}

class NewComputerSuccessGetSectors extends NewComputerStates {}

class NewComputerSuccessGetDepartments extends NewComputerStates {}

class NewComputerSuccessGetAreas extends NewComputerStates {}

class NewComputerSuccessGetDeviceModels extends NewComputerStates {}

class NewComputerSuccessGetProcessorBrand extends NewComputerStates {}

class NewComputerSuccessGetProcessorModel extends NewComputerStates {}

class NewComputerSuccessGetProcessorGeneration extends NewComputerStates {}

class NewComputerSuccessGetGraphicsCardBrand extends NewComputerStates {}

class NewComputerSuccessGetGraphicsCardModel extends NewComputerStates {}

class NewComputerSuccessGetGraphicsCardSize extends NewComputerStates {}

class NewComputerSuccessGetRamModel extends NewComputerStates {}

class NewComputerSuccessGetHardTypes extends NewComputerStates {}

class NewComputerSuccessGetPcModels extends NewComputerStates {}

class NewComputerSuccessCreateDevice extends NewComputerStates {}

class NewComputerErrorGetSectors extends NewComputerStates {
  final String error;

  NewComputerErrorGetSectors(this.error);
}

class NewComputerErrorGetDepartments extends NewComputerStates {
  final String error;

  NewComputerErrorGetDepartments(this.error);
}

class NewComputerErrorGetAreas extends NewComputerStates {
  final String error;

  NewComputerErrorGetAreas(this.error);
}

class NewComputerErrorGetDeviceModels extends NewComputerStates {
  final String error;

  NewComputerErrorGetDeviceModels(this.error);
}

class NewComputerErrorGetProcessorBrand extends NewComputerStates {
  final String error;

  NewComputerErrorGetProcessorBrand(this.error);
}

class NewComputerErrorGetProcessorModel extends NewComputerStates {
  final String error;

  NewComputerErrorGetProcessorModel(this.error);
}

class NewComputerErrorGetProcessorGeneration extends NewComputerStates {
  final String error;

  NewComputerErrorGetProcessorGeneration(this.error);
}

class NewComputerErrorGetGraphicsCardBrand extends NewComputerStates {
  final String error;

  NewComputerErrorGetGraphicsCardBrand(this.error);
}

class NewComputerErrorGetGraphicsCardModel extends NewComputerStates {
  final String error;

  NewComputerErrorGetGraphicsCardModel(this.error);
}

class NewComputerErrorGetGraphicsCardSize extends NewComputerStates {
  final String error;

  NewComputerErrorGetGraphicsCardSize(this.error);
}

class NewComputerErrorGetRamModel extends NewComputerStates {
  final String error;

  NewComputerErrorGetRamModel(this.error);
}

class NewComputerErrorGetHardTypes extends NewComputerStates {
  final String error;

  NewComputerErrorGetHardTypes(this.error);
}

class NewComputerErrorGetPcModels extends NewComputerStates {
  final String error;

  NewComputerErrorGetPcModels(this.error);
}

class NewComputerErrorCreateDevice extends NewComputerStates {
  final String error;

  NewComputerErrorCreateDevice(this.error);
}


