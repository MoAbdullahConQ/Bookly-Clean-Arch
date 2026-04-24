import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly/Features/home/presentation/views/widgets/newest_books_list_view.dart';
import 'package:bookly/Features/home/presentation/views/widgets/newest_books_list_view_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksListViewBlocConsumer extends StatefulWidget {
  const NewestBooksListViewBlocConsumer({super.key});

  @override
  State<NewestBooksListViewBlocConsumer> createState() =>
      _NewestBooksListViewBlocConsumerState();
}

class _NewestBooksListViewBlocConsumerState
    extends State<NewestBooksListViewBlocConsumer> {
  List<BookEntity> books = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewestBooksCubit, NewestBooksState>(
        listener: (BuildContext context, NewestBooksState state) {
      if (state is NewestBooksSuccess) {
        setState(() {
          books.addAll(state.books);
        });
      }
      if (state is NewestBooksPaginationFailure) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(state.errMessage),
            backgroundColor: Colors.red,
          ),
        );
      }
    }, builder: (context, state) {
      if (state is NewestBooksFailure) {
        return Center(child: Text(state.errMessage));
      } else if (state is NewestBooksSuccess ||
          state is NewestBooksPaginationLoading ||
          state is NewestBooksPaginationFailure) {
        return NewestBooksListView(
          books: books,
        );
        // return NewestBooksListViewLoading();
      } else {
        return NewestBooksListViewLoading();
      }
    });
  }
}
