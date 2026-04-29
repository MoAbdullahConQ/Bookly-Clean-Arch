import 'package:bookly/Features/search/presentation/manager/search_books_cubit/search_books_cubit.dart';
import 'package:bookly/Features/search/presentation/views/widgets/search_result_list_view_bloc_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/styles.dart';
import 'custom_search_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16),
          CustomSearchTextField(),
          SizedBox(height: 16),
          BlocBuilder<SearchBooksCubit, SearchBooksState>(
            builder: (context, state) {
              final text = state is SearchBooksSuccess
                  ? 'Search Result (${state.books.length})'
                  : 'Search Result';
              return Text(text, style: Styles.textStyle18);
            },
          ),
          SizedBox(height: 16),
          Expanded(child: SearchResultListViewBlocBuilder()),
        ],
      ),
    );
  }
}
