import '../../domain/entities/novel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NovelModel extends Novel {
  NovelModel({
    super.image,
    super.name,
    super.tag,
    super.story,
    super.creator,
    super.love,
    super.view,
    super.book,
    super.buy,
  });

  factory NovelModel.fromMap(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return NovelModel(
      image: data['image'] ?? '',
      name: data['name'] ?? '',
      tag:
          data['type'] is List
              ? List<String>.from(data['type'].whereType<String>())
              : null,
      story: data['story'] ?? '',
      creator: data['creator'] ?? '',
      love: data['love'] ?? 0,
      view: data['view'] ?? 0,
      book: data['book'] ?? 0,
      buy: data['buy'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'name': name,
      'type': tag,
      'story': story,
      'creator': creator,
      'love': love,
      'view': view,
      'book': book,
      'buy': buy,
    };
  }
}
