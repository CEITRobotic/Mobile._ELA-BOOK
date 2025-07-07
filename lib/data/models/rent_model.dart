class RentModel {
  final String id;
  final String image;
  final String title;
  final String author;
  final int queueCount;
  final DateTime? availableDate;
  final int likes; // ❤️ ຈຳນວນຄົນຖືກໃຈ
  final double rating; // ⭐ ຄະແນນຮີວິວ
  final int views;
  final List<String> tags;
  final double pricePerBook;

  const RentModel({
    this.id = '',
    this.image = '',
    this.title = '',
    this.author = '',
    this.queueCount = 0,
    this.availableDate,
    this.likes = 0,
    this.rating = 0.0,
    this.views = 0,
    this.tags = const [],
    this.pricePerBook = 0.0,
  });

  RentModel copyWith({
    String? image,
    String? title,
    String? author,
    double? pricePerDay,
    DateTime? availableDate,
    int? likes,
    double? rating,
    int? views,
    List<String>? tags,
  }) {
    return RentModel(
      image: image ?? this.image,
      title: title ?? this.title,
      author: author ?? this.author,
      availableDate: availableDate ?? this.availableDate,
      likes: likes ?? this.likes,
      rating: rating ?? this.rating,
      views: views ?? this.views,
      tags: tags ?? this.tags,
    );
  }
}
