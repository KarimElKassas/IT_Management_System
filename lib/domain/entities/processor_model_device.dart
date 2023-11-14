import 'package:equatable/equatable.dart';

class ProcessorModelDevice extends Equatable{
  int processorModelId;
  String processorModelName;
  int processorBrandId;

  ProcessorModelDevice(this.processorModelId, this.processorModelName,this.processorBrandId);

  @override
  List<Object?> get props => [processorModelId,processorModelName,processorBrandId];
}