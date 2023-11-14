import 'package:equatable/equatable.dart';

class HardDriveSize extends Equatable{
  int sizeId;
  String sizeNumber;

  HardDriveSize(this.sizeId, this.sizeNumber);

  @override
  List<Object?> get props => [sizeId,sizeNumber];
}