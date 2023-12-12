import 'package:equatable/equatable.dart';

class Seeker extends Equatable{

  int seekerInformationId;
  String seekerName;
  int seekerId;
  bool isMilitary;

  Seeker(this.seekerInformationId, this.seekerName,this.seekerId,this.isMilitary);

  @override
  List<Object?> get props => [
    seekerInformationId, seekerName,seekerId,isMilitary
  ];

}