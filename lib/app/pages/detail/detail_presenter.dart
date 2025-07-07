import 'package:ela_book/barrel/novel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DetailPresenter {
  Future<bool> like(String? novelId) async {
    await LikeNovel(NovelRepositoryImpl())(novelId);
    return true;
  }

  Future<bool> dislike(String? novelId) async {
    await DislikeNovel(NovelRepositoryImpl())(novelId);
    return false;
  }

  Future<bool> checkLikeStatus(String? novelId) async {
    final uid = FirebaseAuth.instance.currentUser!.uid;

    final snapshot = await FirebaseFirestore.instance.collection('users').doc(uid).get();
    final likedNovels = List<String>.from(
      snapshot.data()?['liked_novels'] ?? [],
    );
    if (likedNovels.contains(novelId)) {
      return true;
    } else {
      return false;
    }
  }
}
