import 'package:equatable/equatable.dart';

class ProcessorBrand extends Equatable{
  int processorBrandId;
  String processorBrandName;

  ProcessorBrand(this.processorBrandId, this.processorBrandName);

  @override
  List<Object?> get props => [processorBrandId,processorBrandName];
}