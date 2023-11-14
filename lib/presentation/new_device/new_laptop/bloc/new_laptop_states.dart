abstract class NewLaptopStates {}

class NewLaptopInit extends NewLaptopStates {}

class NewLaptopChangeSector extends NewLaptopStates {}

class NewLaptopChangeDepartment extends NewLaptopStates {}

class NewLaptopChangeArea extends NewLaptopStates {}

class NewLaptopChangeDeviceModel extends NewLaptopStates {}

class NewLaptopChangeProcessorBrand extends NewLaptopStates {}

class NewLaptopChangeProcessorModel extends NewLaptopStates {}

class NewLaptopChangeProcessorGen extends NewLaptopStates {}

class NewLaptopChangeGraphicsCardBrand extends NewLaptopStates {}

class NewLaptopChangeGraphicsCardModel extends NewLaptopStates {}

class NewLaptopChangeGraphicsCardSize extends NewLaptopStates {}

class NewLaptopChangeHardType extends NewLaptopStates {}

class NewLaptopChangeHardSize extends NewLaptopStates {}

class NewLaptopChangeRamModel extends NewLaptopStates {}

class NewLaptopChangeRamSize extends NewLaptopStates {}
class NewLaptopChangeSecondaryHard extends NewLaptopStates {}

class NewLaptopLoadingSectors extends NewLaptopStates {}

class NewLaptopLoadingDepartments extends NewLaptopStates {}

class NewLaptopLoadingAreas extends NewLaptopStates {}

class NewLaptopLoadingDeviceModels extends NewLaptopStates {}

class NewLaptopLoadingProcessorBrand extends NewLaptopStates {}

class NewLaptopLoadingProcessorModel extends NewLaptopStates {}

class NewLaptopLoadingProcessorGeneration extends NewLaptopStates {}

class NewLaptopLoadingGraphicsCardBrand extends NewLaptopStates {}

class NewLaptopLoadingGraphicsCardModel extends NewLaptopStates {}

class NewLaptopLoadingGraphicsCardSize extends NewLaptopStates {}

class NewLaptopLoadingRamModel extends NewLaptopStates {}

class NewLaptopLoadingHardTypes extends NewLaptopStates {}

class NewLaptopLoadingPcModels extends NewLaptopStates {}

class NewLaptopLoadingCreateDevice extends NewLaptopStates {}

class NewLaptopSuccessGetSectors extends NewLaptopStates {}

class NewLaptopSuccessGetDepartments extends NewLaptopStates {}

class NewLaptopSuccessGetAreas extends NewLaptopStates {}

class NewLaptopSuccessGetDeviceModels extends NewLaptopStates {}

class NewLaptopSuccessGetProcessorBrand extends NewLaptopStates {}

class NewLaptopSuccessGetProcessorModel extends NewLaptopStates {}

class NewLaptopSuccessGetProcessorGeneration extends NewLaptopStates {}

class NewLaptopSuccessGetGraphicsCardBrand extends NewLaptopStates {}

class NewLaptopSuccessGetGraphicsCardModel extends NewLaptopStates {}

class NewLaptopSuccessGetGraphicsCardSize extends NewLaptopStates {}

class NewLaptopSuccessGetRamModel extends NewLaptopStates {}

class NewLaptopSuccessGetHardTypes extends NewLaptopStates {}

class NewLaptopSuccessGetPcModels extends NewLaptopStates {}

class NewLaptopSuccessCreateDevice extends NewLaptopStates {}

class NewLaptopErrorGetSectors extends NewLaptopStates {
  final String error;

  NewLaptopErrorGetSectors(this.error);
}

class NewLaptopErrorGetDepartments extends NewLaptopStates {
  final String error;

  NewLaptopErrorGetDepartments(this.error);
}

class NewLaptopErrorGetAreas extends NewLaptopStates {
  final String error;

  NewLaptopErrorGetAreas(this.error);
}

class NewLaptopErrorGetDeviceModels extends NewLaptopStates {
  final String error;

  NewLaptopErrorGetDeviceModels(this.error);
}

class NewLaptopErrorGetProcessorBrand extends NewLaptopStates {
  final String error;

  NewLaptopErrorGetProcessorBrand(this.error);
}

class NewLaptopErrorGetProcessorModel extends NewLaptopStates {
  final String error;

  NewLaptopErrorGetProcessorModel(this.error);
}

class NewLaptopErrorGetProcessorGeneration extends NewLaptopStates {
  final String error;

  NewLaptopErrorGetProcessorGeneration(this.error);
}

class NewLaptopErrorGetGraphicsCardBrand extends NewLaptopStates {
  final String error;

  NewLaptopErrorGetGraphicsCardBrand(this.error);
}

class NewLaptopErrorGetGraphicsCardModel extends NewLaptopStates {
  final String error;

  NewLaptopErrorGetGraphicsCardModel(this.error);
}

class NewLaptopErrorGetGraphicsCardSize extends NewLaptopStates {
  final String error;

  NewLaptopErrorGetGraphicsCardSize(this.error);
}

class NewLaptopErrorGetRamModel extends NewLaptopStates {
  final String error;

  NewLaptopErrorGetRamModel(this.error);
}

class NewLaptopErrorGetHardTypes extends NewLaptopStates {
  final String error;

  NewLaptopErrorGetHardTypes(this.error);
}

class NewLaptopErrorGetPcModels extends NewLaptopStates {
  final String error;

  NewLaptopErrorGetPcModels(this.error);
}

class NewLaptopErrorCreateDevice extends NewLaptopStates {
  final String error;

  NewLaptopErrorCreateDevice(this.error);
}


