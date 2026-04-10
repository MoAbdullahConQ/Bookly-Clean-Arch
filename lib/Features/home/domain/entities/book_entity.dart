class BookEntity {
  final String bookId;
  final String? bookImage;
  final String bookTitle;
  final String? authorName;
  final num? bookPrice;
  final num? bookRating;

  BookEntity(
      {required this.bookImage,
      required this.bookTitle,
      required this.authorName,
      required this.bookPrice,
      required this.bookRating,
      required this.bookId});
}
