
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../configs/theme/app_theme.dart';
import '../routes/app_route.dart';

class AppBuilder extends ConsumerWidget {
  const AppBuilder({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(appThemeProvider);
    return MaterialApp.router(
      title: 'Flutter TDD',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      // locale: context.locale,
      // supportedLocales: context.supportedLocales,
      // localizationsDelegates: context.localizationDelegates,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}