import 'package:equatable/equatable.dart';

class PcScreen extends Equatable{
  int pcScreenId;
  int screenBrandId;
  bool isScreenCurved;
  String screenSize;
  String notes;
  String serialNumber;
  dynamic startDate;
  dynamic endDate;
  int createdBy;


  PcScreen(
      this.pcScreenId,
      this.screenBrandId,
      this.isScreenCurved,
      this.screenSize,
      this.notes,
      this.serialNumber,
      this.startDate,
      this.endDate,
      this.createdBy);

  @override
  List<Object?> get props => [pcScreenId,screenBrandId,isScreenCurved,screenSize,notes,serialNumber,startDate,endDate,createdBy];
}