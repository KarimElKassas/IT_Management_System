import 'package:equatable/equatable.dart';

class ScreenSizeModel extends Equatable{
  int sizeId;
  String sizeNumber;

  ScreenSizeModel(this.sizeId, this.sizeNumber);

  @override
  List<Object?> get props => [sizeId,sizeNumber];

}