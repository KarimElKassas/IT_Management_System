import 'package:equatable/equatable.dart';

class Printer extends Equatable{
  int printerId;
  String printerModel;
  String serialNumber;
  dynamic startDate;
  dynamic endDate;


  Printer(this.printerId, this.printerModel, this.serialNumber, this.startDate, this.endDate);

  @override
  List<Object?> get props => [printerId,printerModel,serialNumber,startDate,endDate];
}