# Flutter Cheat Sheet

## Useful Stuff

main.dart boilerplate:
```
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
```

imports:
```
import 'package:flutter/material.dart';
import 'package:<app>/<page>.dart';
```

- `importm`
    - import material package above
    - install 'awesome flutter snippets' extension
<br /><br />
- `statelessw` / `statefulw`
    - widget boilerplate
    - install 'awesome flutter snippets' extension
<br /><br />
- `() {}`
    - anonymous function
    - (params) {logic}
<br /><br />
- `setState(() {})`
    - run the function and re-render the parent StatefulWidget
<br /><br />
- `debugPrint('hello world')`
    - use like console.log
<br /><br />
- `Text('hello world')`
    - text widget
<br /><br />
- `Icon(Icons.home)`
    - icon widget
<br /><br />
- `Image.asset('path/from/root/to/image.jpg')`
    - image widget
    - enable 'assets:' and path in pubspec.yaml
<br /><br />
- `Colors.red`
    - pre-defined colour

## Java Data Types
- `String` x = 'hello world';
- `int` x = 1;
- `const` int x = 1; // won't change
- `bool` x = true;
- `bool?` x = null; // nullable
    

##  Widgets

### Top Level Widgets

- `MaterialApp(` - _automatically apply Material styling_
    - `debugShowCheckedBanner:` -> bool
    - `theme:` -> ThemeData()
    - `home:` -> Scaffold()
<br /><br />
- `ThemeData(` - _seed for Material Design_
    - `primarySwatch:` -> colour
<br /><br />
- `Scaffold(` - _Material Design layout_
    - `appBar:` -> AppBar()
    - `body:` -> widget
    - `floatingActionButton:` -> FloatingActionButton()
    - `bottomNavigationBar:` -> NavigationBar()
<br /><br />
- `AppBar(` - _top title bar_
    - `title:` -> Text()
    - `automaticallyImplyLeading:` -> bool
    - `leading:` -> IconButton()


### Navigation Widgets

- `Navigator.of(context).push(<route>` - 'go to route' (put new page widget on nav stack)
    - `<route>` -> MaterialPageRoute()
<br /><br />
- `Navigator.of(context).pop()` - 'go back' (take top widget off nav stack)
<br /><br />
- `MaterialPageRoute(` - 'go to route' (put new widget on nav stack)
    - `builder` -> (BuildContext builder) { return \<widget>}
<br /><br />
- `NavigationBar(` - _always visible menu_
    - `destinations:` -> [NavigationDestination(), ...]
    - `onDestinationSelected:` -> (int index) {}
    - `selectedIndex:` -> int
<br /><br />
- `NavigationDestination(`
    - `icon:` Icon()
    - `label:` -> 'string'

### Common Smaller Widgets

- `FloatingActionButton(`
    - `onPressed:` -> () {}
    - `child:` -> Icon()
<br /><br />
- `ElevatedButton(`
    - `onPressed:` -> () {}
    - `child:` -> widget
<br /><br />
- `IconButton(` - _icon with onPressed property_
    - `onPressed:` -> () {}
    - `icon:` -> Icon()
<br /><br />
- `Divider(` - _similar to \<hr />_
    - `color:` -> colour

### Position Widgets

- `Center(` - _vertical/horizontal center_
    - `child:` -> widget
<br /><br />
- `Column(` - _vertical flexbox_
    - `children:` -> [widget, ...]
<br /><br />
- `SizedBox(`
    - `height:` -> int