import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:it_work/presentation/home/ui/home_screen.dart';
import 'package:it_work/presentation/login/ui/login_screen.dart';
import 'package:it_work/presentation/new_device/new_computer/ui/new_computer_screen.dart';
import 'package:it_work/presentation/new_device/new_laptop/ui/new_laptop_screen.dart';
import 'package:it_work/presentation/new_device/ui/new_device_screen.dart';
import 'package:it_work/presentation/repair_department/new_repair/ui/new_repair_screen.dart';
import 'package:it_work/presentation/repair_department/repair_home/ui/repair_home_screen.dart';
import '../presentation/new_device/new_pc_screen/ui/new_pc_screen_screen.dart';
import '../presentation/splash/ui/splash_screen.dart';
import 'strings_manager.dart';

class RoutesManager{
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String homeRoute = "/home";
  static const String repairHomeRoute = "/repairHome";
  static const String newRepairRoute = "/newRepair";
  static const String newDeviceRoute = "/newDevice";
  static const String newComputerRoute = "/newComputer";
  static const String newLaptopRoute = "/newLaptop";
  static const String newPcScreenRoute = "/newPcScreen";
  static const String newPrinterRoute = "/newPrinter";

}
class RouteGenerator{
  static Route<dynamic> getRoute(RouteSettings settings){
    final args = settings.arguments;
    switch (settings.name){
      case RoutesManager.splashRoute :
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RoutesManager.loginRoute :
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case RoutesManager.homeRoute :
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case RoutesManager.repairHomeRoute :
        return MaterialPageRoute(builder: (_) => const RepairHomeScreen());
      case RoutesManager.newRepairRoute :
        return MaterialPageRoute(builder: (_) => const NewRepairScreen());
      case RoutesManager.newDeviceRoute :
        return MaterialPageRoute(builder: (_) => const NewDeviceScreen());
      case RoutesManager.newComputerRoute :
        return MaterialPageRoute(builder: (_) => NewComputerScreen());
      case RoutesManager.newLaptopRoute :
        return MaterialPageRoute(builder: (_) => NewLaptopScreen());
      case RoutesManager.newPcScreenRoute :
        return MaterialPageRoute(builder: (_) => NewPcMonitorScreen());

      default:
        return unDefinedRoute();
    }
  }
  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(title: Text(AppStrings.noRouteFound.tr()),),
        body: Center(child: Text(AppStrings.noRouteFound.tr()),),
      );
    });
  }
}