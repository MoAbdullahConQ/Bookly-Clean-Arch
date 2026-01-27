import 'package:bookly/Features/home/presentation/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/presentation/domain/repos/home_repo.dart';
import 'package:bookly/Features/home/presentation/domain/use_cases/use_case.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

class FetchFeaturedBooksUseCase extends UseCase<List<BookEntity>, NoParams> {
  final HomeRepo homeRepo;

  FetchFeaturedBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call([NoParams? params]) {
    return homeRepo.fetchFeaturedBooks();
  }
}
