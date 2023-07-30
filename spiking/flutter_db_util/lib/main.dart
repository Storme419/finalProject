import 'package:flutter/material.dart';
import 'package:flutter_db_util/util/db_util.dart';
import 'package:flutter_db_util/books_page.dart';
import 'package:flutter_db_util/home_page.dart';

Future<void> main() async {
  await initSupabase();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'books database spike',
      home: Root(),
    );
  }
}

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  int pageIndex = 0;

  List<Widget> pages = const [
    HomePage(),
    BooksPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('books app'),
      ),
      body: pages[pageIndex],
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'home'),
          NavigationDestination(icon: Icon(Icons.menu_book), label: 'books'),
        ],
        onDestinationSelected: (i) {
          setState(() {
            pageIndex = i;
          });
        },
        selectedIndex: pageIndex,
      ),
    );
  }
}
