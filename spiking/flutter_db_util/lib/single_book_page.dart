import 'package:flutter/material.dart';
import 'package:flutter_db_util/util/db_util.dart';

class SingleBookPage extends StatefulWidget {
  final int id;

  const SingleBookPage({
    super.key,
    required this.id,
  });

  @override
  State<SingleBookPage> createState() => _SingleBookPageState();
}

class _SingleBookPageState extends State<SingleBookPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getBook(widget.id),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        final book = snapshot.data[0]!;

        return Scaffold(
          appBar: AppBar(
            title: Text(book['title']),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Text('id: ${book['id']}'),
                Text('${book['title']} - ${book['author']}'),
                //Text(book['blurb']),
                const Divider(color: Colors.black),
                ElevatedButton(
                  onPressed: () {
                    addComment(context, 'Great Book', book['id']);
                  },
                  child: const Text('add comment'),
                ),
              Container(
                height: 300,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent)
                ),
                child: StreamBuilder(
                    stream: getEvents(widget.id),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      final events = snapshot.data!;
              
                      return ListView.builder(
                        itemCount: events.length,
                        itemBuilder: (context, i) {
                          return ListTile(
                            title: Text(events[i]['type']),
                            subtitle: Text(events[i]['body']),
                            trailing: ElevatedButton(
                              child: const Text('x'),
                              onPressed: () {
                                deleteEvent(events[i]['id']);
                              },
                            ),
                          );
                        },
                      );
                    },
                  ),
              ),
              ]
                  .map((widget) => Padding(
                        padding: const EdgeInsets.all(16),
                        child: widget,
                      ))
                  .toList(),
            ),
          ),
        );
      },
    );
  }
}

Future addComment(context, String defaultComment, bookId) {
  return showDialog(
    context: context,
    builder: ((context) {
      return SimpleDialog(
        title: const Text('add comment'),
        children: [
          TextFormField(
            initialValue: defaultComment,
            onFieldSubmitted: (value) async {
              Navigator.pop(context);
              addEvent(bookId, 808, 'comment', value);
            },
          ),
        ],
      );
    }),
  );
}