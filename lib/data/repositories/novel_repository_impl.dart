import "package:ela_book/domain/entities/novel.dart";
import 'package:cloud_firestore/cloud_firestore.dart';
import "../models/novel_model.dart";
import "../../domain/repositories/novel_repository.dart";
import "../../domain/enums/novel_status.dart";

class NovelRepositoryImpl implements NovelRepository {
  final firestore = FirebaseFirestore.instance.collection('novels');

  Future<QuerySnapshot<Map<String, dynamic>>> _checkExistNameData(
    Novel user,
  ) async {
    return await firestore.where('name', isEqualTo: user.name).limit(1).get();
  }

  // ---------- Below it's real implement functions ----------

  @override
  Future<List<NovelModel>> getNovelAll() async {
    final snapshot = await firestore.get();
    return snapshot.docs.map((doc) => NovelModel.fromMap(doc)).toList();
  }

  @override
  Stream<List<Novel>> getNovelFromType(Novel user) {
    throw UnimplementedError();
  }

  @override
  Novel getNovelFromIndex(Novel user) {
    throw UnimplementedError();
  }

  @override
  Future<NovelStatus> addNovel(Novel novel) async {
    final model = NovelModel(
      image: novel.image!,
      name: novel.name!,
      type: novel.type!,
      story: novel.story!,
      creator: novel.creator!,
      love: 0,
      view: 0,
      book: 0,
      buy: 0,
    );

    final query = await _checkExistNameData(model);
    if (query.docs.isNotEmpty) return NovelStatus.exist;

    await firestore.add(model.toMap());
    return NovelStatus.success;
  }
}
