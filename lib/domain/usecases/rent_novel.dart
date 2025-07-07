import '../repositories/novel_repository.dart';

class RentNovel {
  final NovelRepository repository;

  RentNovel(this.repository);

  Future<void> call(String? novelId) async => await repository.rentNovel(novelId);
}
