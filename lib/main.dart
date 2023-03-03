
import 'package:flutter/material.dart';
import 'package:session2_1/service/dio_helper/dio_helper.dart';
import 'package:session2_1/service/sp_helper/sp_helper.dart';
import 'package:session2_1/src/app_root.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  SharedPrefrenceHelper.init();
runApp(AppRoot());
}

