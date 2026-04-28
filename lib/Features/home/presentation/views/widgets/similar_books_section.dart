import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/Features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/styles.dart';

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({super.key, required this.bookEntity});

  final BookEntity bookEntity;

  @override
  Widget build(BuildContext context) {
    final state = BlocProvider.of<FeaturedBooksCubit>(context).state;
    final books = state is FeaturedBooksSuccess
        ? (state.books..shuffle())
        : <BookEntity>[];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'You can also like',
          style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 16),
        SimilarBooksListview(books: books),
      ],
    );
  }
}
