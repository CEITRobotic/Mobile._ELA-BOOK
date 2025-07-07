import 'home_presenter.dart';

class HomeController {
  final HomePresenter presenter = HomePresenter();

  Future<List<Map<String, dynamic>>> mapDatasFromTag(String? tag) async {
    final novels = await presenter.getNovelFromTag(tag);

    return novels
        .map(
          (novel) => {
            'id': novel.id ?? '',
            'storyName': novel.name ?? '',
            'creatorName': novel.creator ?? '',
            'story': novel.story ?? '',
            'image': novel.image ?? '',
            'like': novel.like,
            'rent': novel.rent,
            'buy': novel.book,
            'view': novel.view,
            'tag': novel.tag,
            'price': novel.price,
          },
        )
        .toList();
  }

  Future<List<Map<String, dynamic>>> mapAllDatas() async {
    final novels = await presenter.getNovelAll();

    return novels
        .map(
          (novel) => {
            'id': novel.id ?? '',
            'storyName': novel.name ?? '',
            'creatorName': novel.creator ?? '',
            'story': novel.story ?? '',
            'image': novel.image ?? '',
            'like': novel.like,
            'rent': novel.rent,
            'buy': novel.book,
            'view': novel.view,
            'tag': novel.tag,
            'price': novel.price,
          },
        )
        .toList();
  }

  Future<void> increaseView(String? novelId) async {
    presenter.increaseView(novelId);
  }
}
