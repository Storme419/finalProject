import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> initSupabase() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://ibwguvjlltbjmcufyysp.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imlid2d1dmpsbHRiam1jdWZ5eXNwIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTAzODAxMDksImV4cCI6MjAwNTk1NjEwOX0.fm1x-1EG4sFuAxeeZOWZclGba_b3908PB-Ke7kH29O4',
  );
}

// TODO IMPORTANT
// read this about user authentication
// https://supabase.com/docs/reference/dart/auth-signinwithpassword

Stream getBooks() {
  return Supabase.instance.client
  .from('books')
  .stream(primaryKey: ['id']);
}

Future getBook(int id) {
  return Supabase.instance.client
  .from('books')
  .select()
  .eq('id', id);
}

void addBook(int isbn, title, author, blurb) async {
  await Supabase.instance.client
  .from('books')
  .insert({
    'isbn': isbn,
    'title': title,
    'author': author,
    'blurb': blurb,
  });
}

void deleteBook(int id) async {
  await Supabase.instance.client
  .from('books')
  .delete()
  .match({ 'id': id });
}

void addEvent(int bookId, int userId, type, body) async {
  await Supabase.instance.client
  .from('book_events')
  .insert({
    'book_id': bookId,
    'user_id': userId,
    'type': type,
    'body': body,
  });
}

Stream getEvents(int bookId) {
  return Supabase.instance.client
  .from('book_events')
  .stream(primaryKey: ['id'])
  .eq('book_id', bookId)
  .order('created_at');
}

void deleteEvent(int id) async {
  await Supabase.instance.client
  .from('book_events')
  .delete()
  .match({ 'id': id });
}