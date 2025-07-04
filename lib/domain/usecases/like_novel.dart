import '../repositories/novel_repository.dart';

class LikeNovel {
  final NovelRepository repository;

  LikeNovel(this.repository);

  Future<void> call(String? novelId) async => await repository.likeNovel(novelId);
}