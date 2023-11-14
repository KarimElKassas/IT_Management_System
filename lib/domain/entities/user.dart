import 'package:equatable/equatable.dart';
class User extends Equatable{
  int userId;
  String userName;
  String fullName;
  String phoneNumber;
  String? imagePath;
  bool isMilitary;
  int departmentAreaId;
  int specialityId;
  int roleId;
  dynamic birthDate;
  dynamic workStartDate;
  dynamic workEndDate;


  User(
      this.userId,
      this.userName,
      this.fullName,
      this.phoneNumber,
      this.imagePath,
      this.isMilitary,
      this.departmentAreaId,
      this.specialityId,
      this.roleId,
      this.birthDate,
      this.workStartDate,
      this.workEndDate);

  @override
  List<Object?> get props => [
    userId, userName, fullName, phoneNumber, imagePath,isMilitary,departmentAreaId,specialityId,roleId,birthDate,workStartDate,workEndDate
  ];

}