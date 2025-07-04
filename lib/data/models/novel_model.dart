import '../../domain/entities/novel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NovelModel extends Novel {
  NovelModel({
    super.id,
    super.image,
    super.name,
    super.tag,
    super.story,
    super.creator,
    super.like,
    super.view,
    super.book,
    super.buy,
  });

  factory NovelModel.fromMap(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return NovelModel(
      id: doc.id,
      image: data['image'] ?? '',
      name: data['name'] ?? '',
      tag:
          data['tag'] is List
              ? List<String>.from(data['tag'].whereType<String>())
              : null,
      story: data['story'] ?? '',
      creator: data['creator'] ?? '',
      like: data['like'] ?? 0,
      view: data['view'] ?? 0,
      book: data['book'] ?? 0,
      buy: data['buy'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'name': name,
      'tag': tag,
      'story': story,
      'creator': creator,
      'like': like,
      'view': view,
      'book': book,
      'buy': buy,
    };
  }
}
