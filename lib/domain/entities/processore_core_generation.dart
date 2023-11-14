import 'package:equatable/equatable.dart';

class ProcessorCoreGeneration extends Equatable{
  int processorCoreGenId;
  String processorCoreGenName;
  int processorModelId;
  ProcessorCoreGeneration(this.processorCoreGenId, this.processorCoreGenName,this.processorModelId);

  @override
  List<Object?> get props => [processorCoreGenId,processorCoreGenName,processorModelId];
  
}