import '../repositories/novel_repository.dart';
import '../entities/novel.dart';

class GetNovelFromType {
  final NovelRepository repository;

  GetNovelFromType(this.repository);

  Future<List<Novel>> call(String? type) async => await repository.getNovelFromTag(type);
}