class Novel {
  final String? id;
  final String? image;
  final String? name;
  final List<String>? tag;
  final String? story;
  final String? creator;
  final int? like;
  final int? view;
  final int? book;
  final int? buy;

  Novel({
    this.id,
    this.image,
    this.name,
    this.tag,
    this.story,
    this.creator,
    this.like,
    this.view,
    this.book,
    this.buy,
  });

  @override
  String toString() {
    return 'Novel(id: $id, image: $name, tag: $tag, creator: $creator, like: $like, view: $view, book: $book, buy, $buy)';
  }
}
