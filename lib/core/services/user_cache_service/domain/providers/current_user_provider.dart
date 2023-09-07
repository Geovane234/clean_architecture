import 'package:clean_architecture/core/services/user_cache_service/domain/providers/user_cache_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../features/dashboard/models/user/user_model.dart';

final currentUserProvider = FutureProvider<User?>((ref) async {
  final repository = ref.watch(userLocalRepositoryProvider);
  final eitherType = (await repository.fetchUser());

  return eitherType.fold((l) => null, (r) => r);
});
