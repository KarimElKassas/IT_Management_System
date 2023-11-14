import 'package:it_work/domain/entities/graphic_card_size.dart';

class GraphicCardSizeModel extends GraphicCardSize{
  GraphicCardSizeModel(super.sizeId, super.sizeNumber);

  factory GraphicCardSizeModel.fromJson(Map<String, dynamic> json){
    return GraphicCardSizeModel(
        int.parse(json['sizeId'].toString()),
        json['sizeNumber']
    );
  }

  Map<String, dynamic> toJson() => {
    'sizeId': sizeId,
    'sizeNumber': sizeNumber,
  };
}