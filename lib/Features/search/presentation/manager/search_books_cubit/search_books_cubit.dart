import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/search/domain/use_cases/search_books_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_books_state.dart';

class SearchBooksCubit extends Cubit<SearchBooksState> {
  SearchBooksCubit(this.searchBooksUseCase) : super(SearchBooksInitial());

  final SearchBooksUseCase searchBooksUseCase;

  Future<void> searchForBooks({required String query}) async {
    emit(SearchBooksLoading());

    final result = await searchBooksUseCase.call(query);
    result.fold((failure) {
      emit(SearchBooksFailure(failure.message));
    }, (books) {
      emit(SearchBooksSuccess(books));
    });
  }
}
