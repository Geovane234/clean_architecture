import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class ExampleScreen extends ConsumerStatefulWidget {
  static const String routeName = 'DashboardScreen';
  const ExampleScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ExampleScreenState();
}

class _ExampleScreenState extends ConsumerState<ExampleScreen> {

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}