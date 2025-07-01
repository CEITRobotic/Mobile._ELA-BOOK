import "package:ela_book/domain/entities/novel.dart";
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import "../models/novel_model.dart";
import "../../domain/repositories/novel_repository.dart";
import "../../domain/enums/novel_status.dart";

class NovelRepositoryImpl implements NovelRepository {
  final firestore = FirebaseFirestore.instance;
  final uid = FirebaseAuth.instance.currentUser!.uid;

  Future<QuerySnapshot<Map<String, dynamic>>> _checkExistNameData(
    Novel user,
  ) async {
    return await firestore
        .collection('novels')
        .where('name', isEqualTo: user.name)
        .limit(1)
        .get();
  }

  // ---------- Below it's real implement functions ----------

  @override
  Future<List<NovelModel>> getNovelAll() async {
    final snapshot = await firestore.collection('novels').get();
    return snapshot.docs.map((doc) => NovelModel.fromMap(doc)).toList();
  }

  @override
  Future<List<Novel>> getNovelFromTag(String? type) async {
    final snapshot =
        await firestore
            .collection('novels')
            .where('tag', arrayContains: type)
            .get();
    return snapshot.docs.map((doc) => NovelModel.fromMap(doc)).toList();
  }

  @override
  Future<NovelStatus> addNovel(Novel novel) async {
    final model = NovelModel(
      image: novel.image!,
      name: novel.name!,
      tag: novel.tag!,
      story: novel.story!,
      creator: novel.creator!,
      love: 0,
      view: 0,
      book: 0,
      buy: 0,
    );

    final query = await _checkExistNameData(model);
    if (query.docs.isNotEmpty) return NovelStatus.exist;

    await firestore.collection('novels').add(model.toMap());
    return NovelStatus.success;
  }

  @override
  Future<void> likeNovel() async {
    await firestore.collection('users').doc(uid).update({
      'liked_novels': FieldValue.arrayUnion([]),
    });
    print(uid);
  }

  @override
  Future<void> rentNovel() async {}

  @override
  Future<void> buyNovel() async {}
}
