import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/home/data/models/book_model/item.dart';

import '../../domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    var data = await apiService.get(endPoint: 'volumes?q=api');

    List<BookEntity> books = getBooksList(data);
    return books;
  }

  

  @override
  Future<List<BookEntity>> fetchNewestBooks()async {
  var data = await apiService.get(endPoint: 'volumes?q=api');
    List<BookEntity> books = getBooksList(data);
    return books;  
  }




  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var bookMap in data['items']) {
      books.add(Item.fromJson(bookMap));
    }
    return books;
  }

}
