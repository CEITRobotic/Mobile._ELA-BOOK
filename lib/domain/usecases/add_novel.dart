import '../repositories/novel_repository.dart';
import '../entities/novel.dart';
import '../../domain/enums/novel_status.dart';

class AddNovel {
  final NovelRepository repository;

  AddNovel(this.repository);

  Future<NovelStatus> call(Novel novel) async => await repository.addNovel(novel);
}
