import '../repositories/novel_repository.dart';

class InceaseView {
  final NovelRepository repository;

  InceaseView(this.repository);

  Future<void> call(String? novelId) async =>
      await repository.increaseView(novelId);
}
