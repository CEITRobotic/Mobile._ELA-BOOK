import 'home_presenter.dart';

class HomeController {
  final HomePresenter presenter = HomePresenter();

  Future<List<Map<String, String>>> mapDatasFromTag(String? tag) async {
    final novels = await presenter.getNovelFromTag(tag);

    return novels
        .map(
          (novel) => {
            'id': novel.id ?? '',
            'storyName': novel.name ?? '',
            'creatorName': novel.creator ?? '',
            'story': novel.story ?? '',
            'image': novel.image ?? '',
            'like': novel.like.toString(),
            'rent': novel.book.toString(),
            'buy': novel.book.toString(),
            'view': novel.view.toString(),
          },
        )
        .toList();
  }

  Future<List<Map<String, String>>> mapAllDatas() async {
    final novels = await presenter.getNovelAll();

    return novels
        .map(
          (novel) => {
            'id': novel.id ?? '',
            'storyName': novel.name ?? '',
            'creatorName': novel.creator ?? '',
            'story': novel.story ?? '',
            'image': novel.image ?? '',
            'like': novel.like.toString(),
            'rent': novel.book.toString(),
            'buy': novel.book.toString(),
            'view': novel.view.toString(),
          },
        )
        .toList();
  }

  Future<void> increaseView(String? novelId) async {
    presenter.increaseView(novelId);
  }
}
