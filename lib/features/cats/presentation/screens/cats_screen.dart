import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class CatsScreen extends ConsumerStatefulWidget {
  static const String routeName = 'CatsScreen';

  const CatsScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<CatsScreen> createState() => _CatsScreenState();
}

class _CatsScreenState extends ConsumerState<CatsScreen> {

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
    return Center(child: Text("Cats Screen"),);
  }
}
