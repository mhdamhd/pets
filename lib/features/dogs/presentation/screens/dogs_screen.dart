import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class DogsScreen extends ConsumerStatefulWidget {
  static const String routeName = 'DogsScreen';

  const DogsScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<DogsScreen> createState() => _DogsScreenState();
}

class _DogsScreenState extends ConsumerState<DogsScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Dogs Screen"),);
  }
}
