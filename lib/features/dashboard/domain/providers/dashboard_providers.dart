
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/services/networking/dio_request/network_service.dart';
import '../../../../core/services/provider/dio_network_service_provider.dart';
import '../../data/datasource/dashboard_remote_datasource.dart';
import '../../data/repositories/dashboard_repository.dart';
import '../repositories/dashboard_repository.dart';

final dashboardDatasourceProvider =
    Provider.family<DashboardDatasource, NetworkService>(
  (_, networkService) => DashboardRemoteDatasource(networkService),
);

final dashboardRepositoryProvider = Provider<DashboardRepository>((ref) {
  final networkService = ref.watch(netwokServiceProvider);
  final datasource = ref.watch(dashboardDatasourceProvider(networkService));
  final respository = DashboardRepositoryImpl(datasource);

  return respository;
});
