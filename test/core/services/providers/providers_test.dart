import 'package:clean_architecture/core/services/networking/dio_request/network_service.dart';
import 'package:clean_architecture/core/services/provider/dio_network_service_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('dioNetwokServiceProvider is a NetworkService', () {
    final providerContainer = ProviderContainer();

    addTearDown(providerContainer.dispose);

    expect(
      providerContainer.read(netwokServiceProvider),
      isA<NetworkService>(),
    );
  });
}
