import 'package:equatable/equatable.dart';

class RamType extends Equatable{
  int ramTypeId;
  String ramTypeName;

  RamType(this.ramTypeId, this.ramTypeName);

  @override
  List<Object?> get props => [ramTypeId,ramTypeName];
}