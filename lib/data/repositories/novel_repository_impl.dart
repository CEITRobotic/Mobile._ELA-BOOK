import "package:ela_book/domain/entities/novel.dart";
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import "../models/novel_model.dart";
import "../../domain/repositories/novel_repository.dart";
import "../../domain/enums/novel_status.dart";
import 'package:logging/logging.dart';

class NovelRepositoryImpl implements NovelRepository {
  final firestore = FirebaseFirestore.instance;

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
  Future<List<Novel>> getNovelAll() async {
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
      price: novel.price!,
      like: 0,
      view: 0,
      rent: 0,
      buy: 0,
    );

    final query = await _checkExistNameData(model);
    if (query.docs.isNotEmpty) return NovelStatus.exist;

    await firestore.collection('novels').add(model.toMap());
    return NovelStatus.success;
  }

  @override
  Future<void> increaseView(String? novelId) async {
    await firestore.collection('novels').doc(novelId).update({
      'view': FieldValue.increment(1),
    });
  }

  @override
  Future<void> likeNovel(String? novelId) async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final log = Logger('LikeNovel <fn>');

    final snapshot = await firestore.collection('users').doc(uid).get();
    final likedNovels = List<String>.from(
      snapshot.data()?['liked_novels'] ?? [],
    );
    if (likedNovels.contains(novelId)) {
      log.info("uid:[$uid] already liked this novel");
      return;
    }

    await firestore.collection('users').doc(uid).update({
      'liked_novels': FieldValue.arrayUnion([novelId]),
    });
    await firestore.collection('novels').doc(novelId).update({
      'like': FieldValue.increment(1),
    });
  }

  @override
  Future<void> dislikeNovel(String? novelId) async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final log = Logger('DisLikeNovel <fn>');

    final snapshot = await firestore.collection('users').doc(uid).get();
    final likedNovels = List<String>.from(
      snapshot.data()?['liked_novels'] ?? [],
    );
    if (!likedNovels.contains(novelId)) {
      log.info("uid:[$uid] not found novel at novelId:[$novelId]");
      return;
    }

    await firestore.collection('users').doc(uid).update({
      'liked_novels': FieldValue.arrayRemove([novelId]),
    });
    await firestore.collection('novels').doc(novelId).update({
      'like': FieldValue.increment(-1),
    });
  }

  @override
  Future<void> rentNovel(String? novelId) async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final snapshot = await firestore.collection('users').doc(uid).get();
    final likedNovels = List<String>.from(
      snapshot.data()?['rented_novels'] ?? [],
    );

    if (!likedNovels.contains(novelId)) {
      return;
    }

    await firestore.collection('users').doc(uid).update({
      'rented_novels': FieldValue.arrayUnion([novelId]),
    });
    await firestore.collection('novels').doc(novelId).update({
      'rent': FieldValue.increment(1),
    });

  }

  @override
  Future<void> buyNovel(String? novelId) async {}
}
