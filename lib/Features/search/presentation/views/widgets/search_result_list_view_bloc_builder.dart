import 'package:bookly/Features/search/presentation/manager/search_books_cubit/search_books_cubit.dart';
import 'package:bookly/Features/search/presentation/views/widgets/search_result_list_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultListViewBlocBuilder extends StatelessWidget {
  const SearchResultListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBooksCubit, SearchBooksState>(
      builder: (context, state) {
        if (state is SearchBooksSuccess) {
          return SearchResultListView(books: state.books,);
        } else if (state is SearchBooksFailure) {
          return Center(child: Text(state.errorMessage));
        } else {
          return const Center(child: CupertinoActivityIndicator());
        }
      },
    );
  }
}