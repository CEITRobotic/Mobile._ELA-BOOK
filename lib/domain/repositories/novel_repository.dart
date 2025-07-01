import '../entities/novel.dart';
import '../../domain/enums/novel_status.dart';

abstract class NovelRepository {
  Future<List<Novel>> getNovelAll();
  Future<List<Novel>> getNovelFromTag(String? type);
  Novel getNovelFromIndex(Novel user);
  Future<NovelStatus> addNovel(Novel user);
}
