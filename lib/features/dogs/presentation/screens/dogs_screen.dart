import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pets/features/dogs/presentation/providers/dogs_state_provider.dart';
import 'package:pets/features/dogs/presentation/providers/state/dogs_state.dart';
import 'package:pets/features/dogs/presentation/widgets/dog_card.dart';
import 'package:pets/shared/widgets/app_loading.dart';
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
    final state = ref.watch(dogsNotifierProvider);
    final notifier = ref.read(dogsNotifierProvider.notifier);

    ref.listen(
      dogsNotifierProvider.select((value) => value),
      ((DogsState? previous, DogsState next) {
        //show Snackbar on failure
        if (next.state == DogsConcreteState.failure) {
          if (next.message.isNotEmpty) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(next.message.toString())));
          }
        }
      }),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dogs'),
      ),
      body: state.state == DogsConcreteState.loading
          ? const AppLoading()
          : state.hasData
          ? LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        children: state.dogList.map((dog) => DogCard(dog: dog)).toList(),
                      ),
                    ),
                    Column(
                      children: [ElevatedButton(onPressed: () {
                        notifier.fetchDogs();
                      }, child: const Text("Refresh"))],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ) : Center(
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
