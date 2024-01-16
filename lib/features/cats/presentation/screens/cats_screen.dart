import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pets/features/cats/presentation/providers/cats_state_provider.dart';
import 'package:pets/features/cats/presentation/providers/state/cats_state.dart';
import 'package:pets/features/cats/presentation/widgets/cat_card.dart';
import 'package:pets/shared/widgets/app_loading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

@RoutePage()
class CatsScreen extends ConsumerStatefulWidget {
  static const String routeName = 'CatsScreen';

  const CatsScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<CatsScreen> createState() => _CatsScreenState();
}

class _CatsScreenState extends ConsumerState<CatsScreen> {
  final TextEditingController searchController = TextEditingController();

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
    final state = ref.watch(catsNotifierProvider);
    final notifier = ref.read(catsNotifierProvider.notifier);

    ref.listen(
      catsNotifierProvider.select((value) => value),
      ((CatsState? previous, CatsState next) {
        //show Snackbar on failure
        if (next.state == CatsConcreteState.failure) {
          if (next.message.isNotEmpty) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(next.message.toString())));
          }
        }
      }),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cats'),
      ),
      body: state.state == CatsConcreteState.loading
          ? const AppLoading()
          : state.hasData
          ? SmartRefresher(
          controller: notifier.refreshController,
          enablePullDown: true,
          enablePullUp: false,
          onRefresh: () => notifier.fetchCats(),
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            physics: const BouncingScrollPhysics(),
            children: state.catList.map((cat) => CatCard(cat: cat)).toList(),
          ))
          : Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0),
          child: Text(
            state.message,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
      ),
    );
  }
}
