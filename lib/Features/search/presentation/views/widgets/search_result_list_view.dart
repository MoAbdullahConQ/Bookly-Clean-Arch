
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/presentation/views/widgets/newest_books_list_view_item.dart';
import 'package:flutter/material.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key, required this.books});

  final List<BookEntity> books ;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: books.length,
      itemBuilder: (context, index) {
        return  Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: BookListViewItem(bookEntity: books[index],),
        );
      },
    );
  }
}
