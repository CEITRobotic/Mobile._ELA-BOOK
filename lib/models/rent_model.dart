class RentModel {
  final String title;
  final String author;
  final double pricePerDay;
  final int queueCount;
  final DateTime? availableDate;
  final int likes;             // ❤️ ຈຳນວນຄົນຖືກໃຈ
  final double rating;         // ⭐ ຄະແນນຮີວິວ
  final int views;

  RentModel({
    required this.title,
    required this.author,
    required this.pricePerDay,
    this.queueCount = 0,
    this.availableDate,
    this.likes = 0,
    this.rating = 0.0,
    this.views = 0,
  });
}
