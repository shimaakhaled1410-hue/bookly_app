
import 'package:hive/hive.dart';

import '../../../features/home/domain/entities/book_entity.dart';

void saveBooksData(List<BookEntity> books,String boxsName) {
    var box = Hive.box<BookEntity>(boxsName);
    box.addAll(books);
  }