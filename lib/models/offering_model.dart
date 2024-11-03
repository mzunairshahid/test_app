class OfferingModel {
  String name;
  String title;
  String category;
  String type;
  String duration;
  String price;
  String description;
  bool completed;

  OfferingModel({
    required this.name,
    required this.title,
    required this.category,
    required this.type,
    required this.duration,
    required this.price,
    required this.description,
    this.completed = false,
  });
}
