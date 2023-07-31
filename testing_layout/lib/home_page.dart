import 'package:flutter/material.dart';
import 'package:layout_test/theme_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const Text('Bookshelf'),
    const Text('Map'),
    const Text('Search'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(children: [
          UserAccountsDrawerHeader(
              currentAccountPicture: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image.network(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS29OImDEUJspbdQTIIKTar91MyZ920fD6jpQ&usqp=CAU")),
              accountName: Text("Test User"),
              accountEmail: Text("test@gmail.com")),
          SwitchListTile(
            title: Text('Dark Mode'),
            value: ThemeController.instance.isDarkTheme,
            onChanged: (value) {
              ThemeController.instance.changeTheme();
            },
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About Us'),
            onTap: () {
              Navigator.of(context).pushNamed('/about-us');
            },
          ),
          ListTile(
            leading: Icon(Icons.add),
            title: Text('Add a book'),
            onTap: () {
              // Navigator.of(context).pushNamed('/about-us');
            },
          ),
          ListTile(
            leading: Icon(Icons.book_rounded),
            title: Text('All Books'),
            onTap: () {
              // Navigator.of(context).pushNamed('/about-us');
            },
          ),
          ListTile(
            leading: Icon(Icons.search),
            title: Text('Find Books'),
            onTap: () {
              // Navigator.of(context).pushNamed('/about-us');
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Log-out'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/home');
            },
          ),
        ]),
      ),
      appBar: AppBar(
        title: const Text(
          'Wild Books',
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/sign-in');
              },
              icon: const Icon(
                Icons.person_2_rounded,
                size: 35,
              ))
        ],
        //     title: Image.asset(
        //   "./images/logo-color.png",
        //   width: 140,
        // )
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: pageIndex,
          onTap: (index) {
            setState(() {
              pageIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 30),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book_rounded, size: 30),
              label: 'Bookshelf',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map_rounded, size: 30),
              label: 'Map',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search, size: 30),
              label: 'Search',
            ),
          ]),
      // body: _pages[pageIndex],
    );
  }
}
