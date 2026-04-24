import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:meta/meta.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.newestBooksUseCase) : super(NewestBooksInitial());

  final FetchNewestBooksUseCase newestBooksUseCase;

  Future<void> fetchNewestBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(NewestBooksLoading());
    } else {
      emit(NewestBooksPaginationLoading());
    }
    var result = await newestBooksUseCase.call(pageNumber);

    result.fold((failure) {
      if (pageNumber == 0) {
        emit(NewestBooksFailure(failure.message));
      } else {
        emit(NewestBooksPaginationFailure(failure.message));
      }
    }, (books) {
      emit(NewestBooksSuccess(books));
    });

    // emit(NewestBooksLoading());
    // var result = await newestBooksUseCase.call();
    // result.fold((failure) {
    //   emit(NewestBooksFailure(failure.message));
    // }, (books) {
    //   emit(NewestBooksSuccess(books));
    // });
  }
}
