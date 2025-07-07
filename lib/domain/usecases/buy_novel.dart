import '../repositories/novel_repository.dart';

class BuyNovel {
  final NovelRepository repository;

  BuyNovel(this.repository);

  Future<void> call(String? novelId) async => await repository.buyNovel(novelId);
}
