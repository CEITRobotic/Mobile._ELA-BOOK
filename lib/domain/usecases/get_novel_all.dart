import 'package:ela_book/domain/entities/novel.dart';
import '../repositories/novel_repository.dart';

class GetNovelAll {
  final NovelRepository repository;

  GetNovelAll(this.repository);

  Future<List<Novel>> call() async => await repository.getNovelAll();
}