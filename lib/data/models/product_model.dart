class Products {
  int? id;
  String? image;
  String? name;
  String? currency;
  String? unit;
  bool? wishlisted;
  bool? rfqStatus;
  int? cartCount;
  int? futureCartCount;
  bool? hasStock;
  String? price;
  String? actualPrice;
  String? offer;

  Products({
    this.id,
    this.image,
    this.name,
    this.currency,
    this.unit,
    this.wishlisted,
    this.rfqStatus,
    this.cartCount,
    this.futureCartCount,
    this.hasStock,
    this.price,
    this.actualPrice,
    this.offer,
  });

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    name = json['name'];
    currency = json['currency'];
    unit = json['unit'];
    wishlisted = json['wishlisted'];
    rfqStatus = json['rfq_status'];
    cartCount = json['cart_count'];
    futureCartCount = json['future_cart_count'];
    hasStock = json['has_stock'];
    price = json['price'];
    actualPrice = json['actual_price'];
    offer = json['offer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['name'] = this.name;
    data['currency'] = this.currency;
    data['unit'] = this.unit;
    data['wishlisted'] = this.wishlisted;
    data['rfq_status'] = this.rfqStatus;
    data['cart_count'] = this.cartCount;
    data['future_cart_count'] = this.futureCartCount;
    data['has_stock'] = this.hasStock;
    data['price'] = this.price;
    data['actual_price'] = this.actualPrice;
    data['offer'] = this.offer;
    return data;
  }
}
