
import 'package:it_work/domain/entities/printer.dart';

class PrinterModel extends Printer{
  PrinterModel(super.printerId, super.printerModel, super.serialNumber, super.startDate, super.endDate);

  factory PrinterModel.fromJson(Map<String, dynamic> json){
    return PrinterModel(
        int.parse(json['printerId'].toString()),
        json['printerModel'],
        json['serialNumber'],
        json['startDate'],
        json['endDate'],
    );
  }

  Map<String, dynamic> toJson() => {
    'printerId': printerId,
    'printerModel': printerModel,
    'serialNumber': serialNumber,
    'startDate': startDate,
    'endDate': endDate,
  };

}