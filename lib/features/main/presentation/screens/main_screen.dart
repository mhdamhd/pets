import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pets/features/cats/presentation/screens/cats_screen.dart';
import 'package:pets/features/dogs/presentation/screens/dogs_screen.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  static const String routeName = 'MainScreen';

  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int _index = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final List<Widget> _screens = const [
    DogsScreen(),
    CatsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _index,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (index) => setState(() {
          _index = index;
        }),
        items: const [
          BottomNavigationBarItem(label: "Dogs", icon: Icon(Icons.favorite)),
          BottomNavigationBarItem(label: "Cats", icon: Icon(Icons.heart_broken)),
        ],
      ),
    );
  }
}
