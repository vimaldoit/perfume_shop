class CarouselItems {
  int? id;
  String? image;
  String? type;

  CarouselItems({this.id, this.image, this.type});

  CarouselItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['type'] = this.type;
    return data;
  }
}
