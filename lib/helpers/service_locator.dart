import 'package:get_it/get_it.dart';
import 'package:to_do_app/helpers/app_cashe.dart';
import 'package:to_do_app/helpers/sqflite_helper.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<AppCashe>(() => AppCashe());
  getIt.registerLazySingleton<SqfLiteHelper>(() => SqfLiteHelper());
}
