abstract class NewRepairStates{}

class NewRepairInit extends NewRepairStates{}

class NewRepairChangeDeviceTypeState extends NewRepairStates{}

class NewRepairSearchForSeekerLoading extends NewRepairStates{}
class NewRepairSearchForSeekerSuccess extends NewRepairStates{}
class NewRepairSearchForSeekerError extends NewRepairStates{
  final String error;

  NewRepairSearchForSeekerError(this.error);
}

class NewRepairCreateSeekerLoading extends NewRepairStates{}
class NewRepairCreateSeekerSuccess extends NewRepairStates{}
class NewRepairCreateSeekerError extends NewRepairStates{
  final String error;

  NewRepairCreateSeekerError(this.error);
}

class NewRepairCreateNewRepairLoading extends NewRepairStates{}
class NewRepairCreateNewRepairSuccess extends NewRepairStates{}
class NewRepairCreateNewRepairError extends NewRepairStates{
  final String error;

  NewRepairCreateNewRepairError(this.error);
}

class NewRepairGetDeviceLoading extends NewRepairStates{}
class NewRepairGetDeviceSuccess extends NewRepairStates{}
class NewRepairGetDeviceError extends NewRepairStates{
  final String error;

  NewRepairGetDeviceError(this.error);
}