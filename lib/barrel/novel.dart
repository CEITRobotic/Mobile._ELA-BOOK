export 'package:ela_book/domain/entities/novel.dart';
export 'package:ela_book/data/repositories/novel_repository_impl.dart';
export 'package:ela_book/domain/enums/novel_status.dart';
export 'package:ela_book/domain/usecases/add_novel.dart';
export 'package:ela_book/domain/usecases/get_novel_all.dart';


// Example: Get all novels
/*
    import 'package:ela_book/barrel/novel.dart';

    final novels = await GetNovelAll(NovelRepositoryImpl())();
    for (var novel in novels) {
      // Do something
    }
*/

