import 'package:bookly_app/constatnts.dart';
import 'package:hive_flutter/adapters.dart';

import '../../domain/entities/book_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0});
  List<BookEntity> fetchNewestBooks();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0}) {
    var box = Hive.box<BookEntity>(kFeaturedBox);

    int startIndex = pageNumber * 10;
    int endIndex = (pageNumber + 1) * 10;
    int lenght = box.values.length;
    if (startIndex >= lenght || endIndex>lenght) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    var box = Hive.box<BookEntity>(kNewestdBox);
    return box.values.toList();
  }
}
