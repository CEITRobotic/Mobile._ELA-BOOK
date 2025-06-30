import 'package:ela_book/barrel/novel.dart';
import 'package:logging/logging.dart';

class InitNovels {
  final log = Logger('InitNovels');

  Future<void> init() async {
    var novel = Novel(
      image: "assets/images/novel_imgs/1.jpg",
      name: 'ຮັກຄືການເດີນທາງ',
      type: 'comedy, romantic',
      story:
          '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam ultrices odio et nibh elementum dapibus. Maecenas sed ligula ornare, vestibulum tellus vel, ullamcorper nisl. Quisque eu dolor id odio tristique luctus. Nam scelerisque porttitor mi, a sagittis magna. Donec maximus erat nec mauris vehicula, a consequat est tincidunt. Aenean laoreet dui sit amet commodo tincidunt. Maecenas vulputate, metus sodales posuere tristique, enim felis mattis metus, nec ullamcorper enim arcu sed lacus. Aliquam eleifend ultricies mauris sit amet blandit. Aliquam nec metus a odio vehicula iaculis. Nunc a efficitur urna, ut vestibulum dolor.

Suspendisse dapibus at ligula ac scelerisque. Nullam ornare gravida accumsan. Maecenas fringilla nisl eu ornare blandit. Ut feugiat ac neque sit amet porta. Quisque dictum est a fringilla dictum. Nam euismod libero a ante ultricies, quis euismod quam pretium. Vestibulum quis posuere metus. Duis sit amet auctor felis. Aliquam arcu ex, maximus at nunc sit amet, lobortis malesuada elit. Etiam sit amet ligula sed nibh tempus maximus ac nec justo. Vivamus tristique porta nibh at laoreet. Duis id ultricies nunc. Aenean eget vestibulum sem. Nam non finibus mi. Morbi at turpis tortor.''',
      creator: 'Jando',
    );

    log.info(
      "Trying create: ${novel.name} | status: ${await AddNovel(NovelRepositoryImpl())(novel)}",
    );

    novel = Novel(
      image: "assets/images/novel_imgs/2.png",
      name: 'ສຸສານລົດເມໂຮງຮຽນ',
      type: 'horror, advanture',
      story:
          '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam ultrices odio et nibh elementum dapibus. Maecenas sed ligula ornare, vestibulum tellus vel, ullamcorper nisl. Quisque eu dolor id odio tristique luctus. Nam scelerisque porttitor mi, a sagittis magna. Donec maximus erat nec mauris vehicula, a consequat est tincidunt. Aenean laoreet dui sit amet commodo tincidunt. Maecenas vulputate, metus sodales posuere tristique, enim felis mattis metus, nec ullamcorper enim arcu sed lacus. Aliquam eleifend ultricies mauris sit amet blandit. Aliquam nec metus a odio vehicula iaculis. Nunc a efficitur urna, ut vestibulum dolor.

Suspendisse dapibus at ligula ac scelerisque. Nullam ornare gravida accumsan. Maecenas fringilla nisl eu ornare blandit. Ut feugiat ac neque sit amet porta. Quisque dictum est a fringilla dictum. Nam euismod libero a ante ultricies, quis euismod quam pretium. Vestibulum quis posuere metus. Duis sit amet auctor felis. Aliquam arcu ex, maximus at nunc sit amet, lobortis malesuada elit. Etiam sit amet ligula sed nibh tempus maximus ac nec justo. Vivamus tristique porta nibh at laoreet. Duis id ultricies nunc. Aenean eget vestibulum sem. Nam non finibus mi. Morbi at turpis tortor.''',
      creator: 'Jando',
    );

    log.info(
      "Trying create: ${novel.name} | status: ${await AddNovel(NovelRepositoryImpl())(novel)}",
    );
  }
}
