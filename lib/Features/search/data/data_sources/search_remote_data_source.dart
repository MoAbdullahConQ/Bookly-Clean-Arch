import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/core/utils/functions/get_books_list.dart';

abstract class SearchRemoteDataSource {
  Future<List<BookEntity>> searchForBooks({required String query});
}

class SearchRemoteDataSourceImpl extends SearchRemoteDataSource {
  final ApiService apiService;

  SearchRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<BookEntity>> searchForBooks({required String query}) async {
    var data = await apiService.get(endpoint: 'volumes?q=$query');
    List<BookEntity> books = getBooksList(data);
    return books;
  }
}
