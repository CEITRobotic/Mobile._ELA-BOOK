import 'package:ela_book/barrel/novel.dart';

class HomePresenter {
  Future<List<Novel>> getNovelFromTag(String? tag) async =>
      await GetNovelFromTag(NovelRepositoryImpl())(tag);

  Future<List<Novel>> getNovelAll() async =>
      await GetNovelAll(NovelRepositoryImpl())();
}
