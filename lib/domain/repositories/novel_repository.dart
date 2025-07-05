import '../entities/novel.dart';
import '../../domain/enums/novel_status.dart';

abstract class NovelRepository {
  Future<List<Novel>> getNovelAll();
  Future<List<Novel>> getNovelFromTag(String? tag);
  Future<NovelStatus> addNovel(Novel user);
  Future<void> likeNovel(String? novelId);
  Future<void> dislikeNovel(String? novelId);
  Future<void> rentNovel();
  Future<void> buyNovel();
}
