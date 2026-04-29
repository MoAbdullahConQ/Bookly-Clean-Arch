  part of 'search_books_cubit.dart';

  class SearchBooksState {}

  class SearchBooksInitial extends SearchBooksState {}

  class SearchBooksLoading extends SearchBooksState {}

  class SearchBooksSuccess extends SearchBooksState {
    final List<BookEntity> books;

    SearchBooksSuccess(this.books);
  }

  class SearchBooksFailure extends SearchBooksState {
    final String errorMessage;

    SearchBooksFailure(this.errorMessage);
  }
