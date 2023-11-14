import 'package:equatable/equatable.dart';

class PcModelDevice extends Equatable{
  int pcModelId;
  String pcModelName;

  PcModelDevice(this.pcModelId, this.pcModelName);

  @override
  List<Object?> get props => [pcModelId,pcModelName];

}