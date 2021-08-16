class Products {
  String? date;
  double? avancement;

  Products({
    this.date,
    this.avancement,
  });

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      date: json['date'],
      avancement: json['avancement'],
    );
  }
}
