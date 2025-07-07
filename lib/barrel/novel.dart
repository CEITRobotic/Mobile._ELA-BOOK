export 'package:ela_book/domain/entities/novel.dart';
export 'package:ela_book/data/repositories/novel_repository_impl.dart';
export 'package:ela_book/domain/enums/novel_status.dart';
export 'package:ela_book/domain/usecases/add_novel.dart';
export 'package:ela_book/domain/usecases/get_novel_all.dart';
export 'package:ela_book/domain/usecases/get_novel_from_tag.dart';
export 'package:ela_book/domain/usecases/dislike_novel.dart';
export 'package:ela_book/domain/usecases/like_novel.dart';
export 'package:ela_book/domain/usecases/incease_view.dart';
export 'package:ela_book/domain/usecases/buy_novel.dart';
export 'package:ela_book/domain/usecases/rent_novel.dart';


// Example: Get all novels
/*
    import 'package:ela_book/barrel/novel.dart';

    final novels = await GetNovelAll(NovelRepositoryImpl())();
    for (var novel in novels) {
      // Do something
    }
*/


// Example: Get novels from tag
/*
    import 'package:ela_book/barrel/novel.dart';

    final novels = await GetNovelFromType(NovelRepositoryImpl())("ຕະຫລົກ");
    for (var novel in novels) {
      // Do something
    }
*/


// Example: Add novel to database firestore
/*
    import 'package:ela_book/barrel/novel.dart';

    novel = Novel(
      image: "assets/images/novel_imgs/2.png",
      name: 'ສຸສານລົດເມໂຮງຮຽນ',
      type: 'horror, advanture',
      story: 'text...',
      creator: 'Jando',
    );

    final status = await AddNovel(NovelRepositoryImpl())(novel));

    // Do something
*/