import 'package:flutter/material.dart';

class BooksScreen extends StatelessWidget {
  final List<String> books;

  const BooksScreen({required this.books, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text('Books',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.white),),
      backgroundColor:Colors.blue,
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Book ${index + 1}'),
            subtitle: Text(books[index]),
            // You can add logic to open/download books
          );
        },
      ),
    );
  }
}
