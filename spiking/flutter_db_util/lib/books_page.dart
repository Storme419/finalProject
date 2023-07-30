import 'package:flutter/material.dart';
import 'package:flutter_db_util/util/api_util.dart';
import 'package:flutter_db_util/util/db_util.dart';
import 'package:flutter_db_util/single_book_page.dart';

class BooksPage extends StatefulWidget {
  const BooksPage({super.key});

  @override
  State<BooksPage> createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: StreamBuilder(
            stream: getBooks(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              final books = snapshot.data!;

              return ListView.builder(
                itemCount: books.length,
                itemBuilder: (context, i) {
                  return ListTile(
                    title: Text(books[i]['title']),
                    subtitle: Text('code: ${books[i]['id']}'),
                    trailing: ElevatedButton(
                      child: const Text('x'),
                      onPressed: () {
                        deleteBook(books[i]['id']);
                      },
                    ),
                    onTap: () {
                      loadSingleBookPage(context, books[i]['id']);
                    },
                  );
                },
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('1984'),
              onPressed: () {
                addIsbn(context, 9780198185215);
              },
            ),
            ElevatedButton(
              child: const Text('gatsby'),
              onPressed: () {
                addIsbn(context, 9780743273565);
              },
            ),
            ElevatedButton(
              child: const Text('mockingbird'),
              onPressed: () {
                addIsbn(context, 9780099549482);
              },
            ),
          ],
        )
      ],
    );
  }
}

Future loadSingleBookPage(context, id) {
  return Navigator.of(context).push(
    MaterialPageRoute(builder: (BuildContext builder) {
      return SingleBookPage(id: id);
    }),
  );
}

Future addIsbn(context, int defaultIsbn) {
  return showDialog(
    context: context,
    builder: ((context) {
      return SimpleDialog(
        title: const Text('add isbn'),
        children: [
          TextFormField(
            keyboardType: TextInputType.number,
            initialValue: defaultIsbn.toString(),
            onFieldSubmitted: (value) async {
              Navigator.pop(context);
              final bookData = await fetchBookData(int.parse(value), context);
              addBook(bookData.isbn, bookData.title, bookData.author, bookData.blurb);
            },
          ),
        ],
      );
    }),
  );
}
