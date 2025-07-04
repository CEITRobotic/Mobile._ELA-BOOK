import '../repositories/novel_repository.dart';

class DislikeNovel {
  final NovelRepository repository;

  DislikeNovel(this.repository);

  Future<void> call(String? novelId) async => await repository.dislikeNovel(novelId);
}