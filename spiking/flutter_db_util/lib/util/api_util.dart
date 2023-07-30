import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const String baseUrl = 'https://www.googleapis.com/books/v1/volumes';



Future fetchBookData(int isbn, context) async {
  final response = await http.get(Uri.parse('$baseUrl?q=isbn:$isbn'));

  if (response.statusCode == 200) {
    final bookData = jsonDecode(response.body);

    if (bookData['totalItems'] > 0) {
      final title = bookData['items'][0]['volumeInfo']['title'];
      final author = bookData['items'][0]['volumeInfo']['authors'][0];
      final blurb = bookData['items'][0]['volumeInfo']['description'];

      return BookData(isbn, title, author, blurb);
    }
    else {
      throw Exception('no books found');
    }
  } else {
    throw Exception('no repsonse from books api');
  }
}

class BookData {
  final int isbn;
  final String title;
  final String author;
  final String blurb;

  BookData(this.isbn, this.title, this.author, this.blurb);
}
