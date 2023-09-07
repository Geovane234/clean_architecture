import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';

// in this class we listen to the different providers that run in the application

class Observers extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  )
  // we display the name of the provider or by default its type and the value contained by this provider
   {
    log('''
{
  "provider": "${provider.name ?? provider.runtimeType}",
  "newValue": "$newValue"
}''');
  }

  @override
  void didDisposeProvider(ProviderBase provider, ProviderContainer container) {
    // we display the name of the provider which was closed after its state was empty
    log('''
{
  "provider": "${provider.name ?? provider.runtimeType}",
  "newValue": "disposed"
}''');
    super.didDisposeProvider(provider, container);
  }
}
