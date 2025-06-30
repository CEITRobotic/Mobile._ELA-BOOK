import '../repositories/novel_repository.dart';
import '../entities/novel.dart';

class GetNovelAll {
  final NovelRepository repository;

  GetNovelAll(this.repository);

  Future<List<Novel>> call() async => await repository.getNovelAll();
}