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

## Supabase

dependency in `pubspec.yaml`:
```
dependencies:
  supabase_flutter: ^1.6.2
```

import in .dart:
```
import 'package:supabase_flutter/supabase_flutter.dart';
```

## C Data Types
- `String` x = 'hello world';
- `int` x = 1;
- `const` int x = 1; // won't change
- `bool` x = true;
- `bool?` x = null; // nullable
- width: `double.infinity` // max width possible, similar to css auto/100%

##  Widgets

### Top Level Widgets

- `MaterialApp(` - _automatically apply Material styling_
    - `debugShowCheckedBanner:` -> \<bool>
    - `theme:` -> ThemeData(primarySwatch: \<colour>)
    - `home:` -> Scaffold()
<br /><br />
- `Scaffold(` - _Material Design layout_
    - `appBar:` -> AppBar()
    - `body:` -> \<widget>
    - `floatingActionButton:` -> FloatingActionButton()
    - `bottomNavigationBar:` -> NavigationBar()
<br /><br />
- `AppBar(` - _top title bar_
    - `title:` -> Text()
    - `automaticallyImplyLeading:` -> \<bool>
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
    - `selectedIndex:` -> \<int>
<br /><br />
- `NavigationDestination(`
    - `icon:` -> Icon()
    - `label:` -> \<string>

### List Builders
_(Flutter equivalent of array mapping in HTML/JS)_

```
ListView(
    children: const [
        const Text('list item 1'),
        const Text('list item 2'),
        const Text('list item 3'),
    ],
)
```

Above is how to write a static list, but to make the `ListView` dynamically show a `List` (aka array), use a builder method:

- `ListView.builder(`
    - `itemCount:` -> \<int>
    - `itemBuilder:` -> (context, index) { return \<single item>; }
        - eg. `itemBuilder: (context, i) { return const Text('item ${i+1}');}`
<br /><br />
- `ListView.separated(` - _same as builder but can define a separator between items_
    - `itemCount:` -> \<int>
    - `itemBuilder:` -> (context, index) {}
    - `separatorBuilder:` -> (context, index) {}
<br /><br />
- `ListTile(` - _item card, designed to be returned by ListView builders_
    - `title:` -> Text()
    - `subtitle:` -> Text()
    - `trailing:` -> \<widget>

### Common Smaller Widgets

- `FloatingActionButton(`
    - `onPressed:` -> () {}
    - `child:` -> Icon()
<br /><br />
- `ElevatedButton(`
    - `onPressed:` -> () {}
    - `child:` -> \<widget>
<br /><br />
- `IconButton(` - _icon with onPressed property_
    - `onPressed:` -> () {}
    - `icon:` -> Icon()
<br /><br />
- `Text(<string>, ...`
    - `style:` -> TextStyle(color:\<colour>)

### Position/Layout Widgets

- `Container(`
    - `child:` -> \<widget>
    - `width:`
    - `margin:` -> EdgeInsets.all(\<float>)
    - `padding:` -> EdgeInsets.all(\<float>)
    - `color:`
<br /><br />
- `Center(` - _vertical/horizontal center_
    - `child:` -> \<widget>
<br /><br />
- `Column(` - _vertical flexbox_
    - `children:` -> [\<widget>, ...]
<br /><br />
- `SizedBox(`
    - `height:`
<br /><br />
- `Divider(` - _similar to \<hr />_
    - `color:` -> \<colour>