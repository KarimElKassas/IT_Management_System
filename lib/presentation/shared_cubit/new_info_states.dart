abstract class NewInfoStates {}

class NewInfoInit extends NewInfoStates {}

class NewInfoLoading extends NewInfoStates {}


// Sector States
class NewInfoAddSector extends NewInfoStates {}
class NewInfoAddSectorError extends NewInfoStates{
  final String error;

  NewInfoAddSectorError(this.error);
}
class NewInfoGetSectorsError extends NewInfoStates{
  final String error;

  NewInfoGetSectorsError(this.error);
}
class NewInfoAddSectorSuccess extends NewInfoStates {}
class NewInfoChangeSector extends NewInfoStates {}
class NewInfoSuccessGetSectors extends NewInfoStates {}

// Area States
class NewInfoAddArea extends NewInfoStates{}
class NewInfoAddAreaError extends NewInfoStates{
  final String error;

  NewInfoAddAreaError(this.error);
}
class NewInfoAddAreaSuccess extends NewInfoStates {}

// Department
class NewInfoAddDepartment extends NewInfoStates{}
class NewInfoAddDepartmentError extends NewInfoStates{
  final String error;

  NewInfoAddDepartmentError(this.error);
}
class NewInfoAddDepartmentSuccess extends NewInfoStates {}

// Processor Brand
class NewInfoAddProcessorBrand extends NewInfoStates{}
class NewInfoAddProcessorBrandError extends NewInfoStates{
  final String error;

  NewInfoAddProcessorBrandError(this.error);
}
class NewInfoAddProcessorBrandSuccess extends NewInfoStates {}
class NewInfoGetProcessorBrandsError extends NewInfoStates{
  final String error;

  NewInfoGetProcessorBrandsError(this.error);
}
class NewInfoChangeProcessorBrand extends NewInfoStates {}
class NewInfoSuccessGetProcessorBrands extends NewInfoStates {}

// Processor Model
class NewInfoAddProcessorModel extends NewInfoStates{}
class NewInfoAddProcessorModelError extends NewInfoStates{
  final String error;

  NewInfoAddProcessorModelError(this.error);
}
class NewInfoAddProcessorModelSuccess extends NewInfoStates {}