import '../entities/novel.dart';
import '../../domain/enums/novel_status.dart';
import '../../data/models/novel_model.dart';

abstract class NovelRepository {
  Future<List<NovelModel>> getNovelAll();
  Future<List<Novel>> getNovelFromTag(String? type);
  Future<NovelStatus> addNovel(Novel user);
  Future<void> likeNovel();
  Future<void> rentNovel();
  Future<void> buyNovel();
}
