import '../entities/novel.dart';
import '../../domain/enums/novel_status.dart';

abstract class NovelRepository {
  Future<List<Novel>> getNovelAll();
  Stream<List<Novel>> getNovelFromType(Novel user);
  Novel getNovelFromIndex(Novel user);
  Future<NovelStatus> addNovel(Novel user);
}
