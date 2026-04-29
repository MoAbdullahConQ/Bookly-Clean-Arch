import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/search/data/data_sources/search_remote_data_source.dart';
import 'package:bookly/Features/search/domain/repos/search_repo.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl extends SearchRepo {
  final SearchRemoteDataSource searchRemoteDataSource;

  SearchRepoImpl(this.searchRemoteDataSource);

  @override
  Future<Either<Failure, List<BookEntity>>> searchForBooks(
      {required String query}) async {
    try {
      var books = await searchRemoteDataSource.searchForBooks(query: query);
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
