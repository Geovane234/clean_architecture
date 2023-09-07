
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';

import 'configs/app_configs.dart';
import 'core/shared/data/local/hive_storage_service.dart';
import 'core/shared/data/local/storage_service.dart';
import 'core/shared/data/local/storage_service_provider.dart';
import 'main/app.dart';
import 'main/observers.dart';

void main() => mainCommon(AppEnvironment.PROD);

Future<void> mainCommon(AppEnvironment environment) async {
  WidgetsFlutterBinding.ensureInitialized();
  // await EasyLocalization.ensureInitialized();
  // await Hive.initFlutter();
  // final StorageService initializedStorageService = HiveStorageService();
  // await initializedStorageService.initHive();
  EnvInfo.initialize(environment);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.black,
      statusBarBrightness: Brightness.light,
    ),
  );
  runApp(ProviderScope(
    observers: [
      Observers(),
    ],
    // overrides: [
    //   storageServiceProvider.overrideWithValue(initializedStorageService),
    // ],
    child: ScreenUtilInit(
          builder: (context, child) => const AppBuilder(),
        )
  ));
}
