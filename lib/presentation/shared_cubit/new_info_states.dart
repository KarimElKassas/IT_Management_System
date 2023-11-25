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

// Processor Gen
class NewInfoAddProcessorGen extends NewInfoStates{}
class NewInfoAddProcessorGenError extends NewInfoStates{
  final String error;

  NewInfoAddProcessorGenError(this.error);
}
class NewInfoAddProcessorGenSuccess extends NewInfoStates {}

// graphic card brand
class NewInfoAddGraphicCardBrand extends NewInfoStates{}
class NewInfoAddGraphicCardBrandError extends NewInfoStates{
  final String error;

  NewInfoAddGraphicCardBrandError(this.error);
}
class NewInfoAddGraphicCardBrandSuccess extends NewInfoStates {}
class NewInfoChangeGraphicsCardBrand extends NewInfoStates {}
class NewInfoSuccessGetGraphicsCardBrand extends NewInfoStates {}
class NewInfoGetGraphicsCardBrandError extends NewInfoStates {
  final String error;

  NewInfoGetGraphicsCardBrandError(this.error);
}

// Graphics Card Model
class NewInfoAddGraphicCardModel extends NewInfoStates{}
class NewInfoAddGraphicCardModelError extends NewInfoStates{
  final String error;

  NewInfoAddGraphicCardModelError(this.error);
}
class NewInfoAddGraphicCardModelSuccess extends NewInfoStates {}