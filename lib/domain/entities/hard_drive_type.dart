import 'package:equatable/equatable.dart';

class HardDriveType extends Equatable{
  int hardDriveTypeId;
  String hardDriveTypeName;

  HardDriveType(this.hardDriveTypeId, this.hardDriveTypeName);

  @override
  List<Object?> get props => [hardDriveTypeId,hardDriveTypeName];
}