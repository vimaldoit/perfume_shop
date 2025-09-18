import 'package:perfume_shop/data/models/banner_model.dart';
import 'package:perfume_shop/data/models/brand_model.dart';
import 'package:perfume_shop/data/models/carousel_item_model.dart';
import 'package:perfume_shop/data/models/categories_model.dart';
import 'package:perfume_shop/data/models/product_model.dart';

class HomePageModel {
  int? errorCode;
  String? message;
  Data? data;

  HomePageModel({this.errorCode, this.message, this.data});

  HomePageModel.fromJson(Map<String, dynamic> json) {
    errorCode = json['error_code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error_code'] = this.errorCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<HomeFields>? homeFields;
  int? notificationCount;

  Data({this.homeFields, this.notificationCount});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['home_fields'] != null) {
      homeFields = <HomeFields>[];
      json['home_fields'].forEach((v) {
        homeFields!.add(new HomeFields.fromJson(v));
      });
    }
    notificationCount = json['notification_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.homeFields != null) {
      data['home_fields'] = this.homeFields!.map((v) => v.toJson()).toList();
    }
    data['notification_count'] = this.notificationCount;
    return data;
  }
}

class HomeFields {
  String? type;
  List<CarouselItems>? carouselItems;
  List<Brands>? brands;
  List<Categories>? categories;
  String? image;
  int? collectionId;
  String? name;
  List<Products>? products;
  List<Banners>? banners;
  CarouselItems? banner;

  HomeFields({
    this.type,
    this.carouselItems,
    this.brands,
    this.categories,
    this.image,
    this.collectionId,
    this.name,
    this.products,
    this.banners,
    this.banner,
  });

  HomeFields.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    if (json['carousel_items'] != null) {
      carouselItems = <CarouselItems>[];
      json['carousel_items'].forEach((v) {
        carouselItems!.add(new CarouselItems.fromJson(v));
      });
    }
    if (json['brands'] != null) {
      brands = <Brands>[];
      json['brands'].forEach((v) {
        brands!.add(new Brands.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
    image = json['image'];
    collectionId = json['collection_id'];
    name = json['name'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    if (json['banners'] != null) {
      banners = <Banners>[];
      json['banners'].forEach((v) {
        banners!.add(new Banners.fromJson(v));
      });
    }
    banner =
        json['banner'] != null
            ? new CarouselItems.fromJson(json['banner'])
            : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    if (this.carouselItems != null) {
      data['carousel_items'] =
          this.carouselItems!.map((v) => v.toJson()).toList();
    }
    if (this.brands != null) {
      data['brands'] = this.brands!.map((v) => v.toJson()).toList();
    }
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    data['image'] = this.image;
    data['collection_id'] = this.collectionId;
    data['name'] = this.name;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    if (this.banners != null) {
      data['banners'] = this.banners!.map((v) => v.toJson()).toList();
    }
    if (this.banner != null) {
      data['banner'] = this.banner!.toJson();
    }
    return data;
  }
}
