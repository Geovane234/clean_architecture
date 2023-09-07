
import 'package:clean_architecture/features/dashboard/presentation/providers/state/dashboard_notifier.dart';
import 'package:clean_architecture/features/dashboard/presentation/providers/state/dashboard_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/providers/dashboard_providers.dart';

final dashboardNotifierProvider =
    StateNotifierProvider<DashboardNotifier, DashboardState>((ref) {
  final repository = ref.watch(dashboardRepositoryProvider);
  return DashboardNotifier(repository)..fetchProducts();
});
