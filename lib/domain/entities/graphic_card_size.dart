import 'package:equatable/equatable.dart';

class GraphicCardSize extends Equatable{
  int sizeId;
  String sizeNumber;

  GraphicCardSize(this.sizeId, this.sizeNumber);

  @override
  List<Object?> get props => [sizeId,sizeNumber];
}