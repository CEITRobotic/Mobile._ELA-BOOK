import 'detail_presenter.dart';

class DetailController {
  final DetailPresenter presenter = DetailPresenter();

  Future<bool> toggleLike(String? novelId, bool status) async {
    if (status) {
      presenter.dislike(novelId);
      return false;
    } else {
      presenter.like(novelId);
      return true;
    }
  }

  Future<bool> checkLikeStatus(String? novelId) {
    return presenter.checkLikeStatus(novelId).then((bool status) {
      return status;
    });
  }
}
