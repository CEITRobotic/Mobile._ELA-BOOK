import '../repositories/novel_repository.dart';
import '../entities/novel.dart';

class GetNovelFromTag {
  final NovelRepository repository;

  GetNovelFromTag(this.repository);

  Future<List<Novel>> call(String? tag) async => await repository.getNovelFromTag(tag);
}