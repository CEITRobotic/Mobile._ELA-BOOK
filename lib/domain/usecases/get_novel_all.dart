import 'package:ela_book/data/models/novel_model.dart';
import '../repositories/novel_repository.dart';

class GetNovelAll {
  final NovelRepository repository;

  GetNovelAll(this.repository);

  Future<List<NovelModel>> call() async => await repository.getNovelAll();
}