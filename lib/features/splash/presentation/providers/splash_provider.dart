
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/services/user_cache_service/domain/providers/user_cache_provider.dart';

final userLoginCheckProvider = FutureProvider((ref) async {
  final repo = ref.watch(userLocalRepositoryProvider);
  return await repo.hasUser();
});
