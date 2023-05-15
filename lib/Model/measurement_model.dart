/// status : true
/// message : "Measurement added successfully"
/// data : {"sizes":[{"title":"ring","data":[5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25]},{"title":"bangle","data":["2.0","2.1","2.2","2.3","2.4","2.5","2.6","2.7","2.8","2.9"]},{"title":"cuff","data":["S","M","L"]}],"categories":[{"id":"54","name":"Gold","parent_id":"0","slug":"gold","category_type":"1","image":"uploads/media/2022/download_(1).jpeg","banner":null,"row_order":"0","status":"1","clicks":"1008","subcategories":[{"id":"56","name":"gold chain","parent_id":"54","slug":"gold-chain","category_type":"1","image":"uploads/media/2022/BANNER_3.png","banner":"uploads/media/2022/BANNER_6.png","row_order":"0","status":"1","clicks":"0"},{"id":"57","name":"Rings","parent_id":"54","slug":"rings","category_type":"1","image":"uploads/media/2022/GBG02650980_540.jpg","banner":null,"row_order":"0","status":"1","clicks":"129"},{"id":"58","name":"Necklace","parent_id":"54","slug":"necklace-1","category_type":"1","image":"uploads/media/2022/GBG02650980_540.jpg","banner":"","row_order":"0","status":"1","clicks":"0"},{"id":"59","name":"Coins","parent_id":"54","slug":"coins","category_type":"1","image":"uploads/media/2022/download_(5).jpeg","banner":null,"row_order":"0","status":"1","clicks":"0"},{"id":"60","name":"Earings","parent_id":"54","slug":"earings","category_type":"1","image":"uploads/media/2022/download_(5).jpeg","banner":null,"row_order":"0","status":"1","clicks":"0"},{"id":"61","name":"Kada","parent_id":"54","slug":"kada","category_type":"1","image":"uploads/media/2022/download_(4).jpeg","banner":null,"row_order":"0","status":"1","clicks":"0"},{"id":"62","name":"Chain","parent_id":"54","slug":"chain","category_type":"1","image":"uploads/media/2022/download_(4).jpeg","banner":null,"row_order":"0","status":"1","clicks":"0"},{"id":"76","name":"Test silver","parent_id":"54","slug":"test-silver","category_type":"1","image":"uploads/media/2022/916.jpeg","banner":"","row_order":"0","status":"1","clicks":"0"},{"id":"78","name":"Jhumka","parent_id":"54","slug":"jhumka","category_type":"1","image":"uploads/media/2022/download_(62).jpg","banner":null,"row_order":"0","status":"1","clicks":"13"},{"id":"79","name":"Gold Ring","parent_id":"54","slug":"gold-ring","category_type":"1","image":"uploads/media/2022/JR03336-YGP900_11_listfront.jpg","banner":null,"row_order":"0","status":null,"clicks":"0"}]},{"id":"55","name":"Silver","parent_id":"0","slug":"silver","category_type":"1","image":"uploads/media/2022/banner_1.png","banner":null,"row_order":"0","status":"1","clicks":"61","subcategories":[{"id":"80","name":"Chain","parent_id":"55","slug":"chain-1","category_type":"1","image":"uploads/media/2022/Chain.jpeg","banner":null,"row_order":"0","status":"1","clicks":"0"}]}]}

class MeasurementModel {
  MeasurementModel({
      bool? status, 
      String? message, 
      Data? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  MeasurementModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _status;
  String? _message;
  Data? _data;
MeasurementModel copyWith({  bool? status,
  String? message,
  Data? data,
}) => MeasurementModel(  status: status ?? _status,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get status => _status;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// sizes : [{"title":"ring","data":[5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25]},{"title":"bangle","data":["2.0","2.1","2.2","2.3","2.4","2.5","2.6","2.7","2.8","2.9"]},{"title":"cuff","data":["S","M","L"]}]
/// categories : [{"id":"54","name":"Gold","parent_id":"0","slug":"gold","category_type":"1","image":"uploads/media/2022/download_(1).jpeg","banner":null,"row_order":"0","status":"1","clicks":"1008","subcategories":[{"id":"56","name":"gold chain","parent_id":"54","slug":"gold-chain","category_type":"1","image":"uploads/media/2022/BANNER_3.png","banner":"uploads/media/2022/BANNER_6.png","row_order":"0","status":"1","clicks":"0"},{"id":"57","name":"Rings","parent_id":"54","slug":"rings","category_type":"1","image":"uploads/media/2022/GBG02650980_540.jpg","banner":null,"row_order":"0","status":"1","clicks":"129"},{"id":"58","name":"Necklace","parent_id":"54","slug":"necklace-1","category_type":"1","image":"uploads/media/2022/GBG02650980_540.jpg","banner":"","row_order":"0","status":"1","clicks":"0"},{"id":"59","name":"Coins","parent_id":"54","slug":"coins","category_type":"1","image":"uploads/media/2022/download_(5).jpeg","banner":null,"row_order":"0","status":"1","clicks":"0"},{"id":"60","name":"Earings","parent_id":"54","slug":"earings","category_type":"1","image":"uploads/media/2022/download_(5).jpeg","banner":null,"row_order":"0","status":"1","clicks":"0"},{"id":"61","name":"Kada","parent_id":"54","slug":"kada","category_type":"1","image":"uploads/media/2022/download_(4).jpeg","banner":null,"row_order":"0","status":"1","clicks":"0"},{"id":"62","name":"Chain","parent_id":"54","slug":"chain","category_type":"1","image":"uploads/media/2022/download_(4).jpeg","banner":null,"row_order":"0","status":"1","clicks":"0"},{"id":"76","name":"Test silver","parent_id":"54","slug":"test-silver","category_type":"1","image":"uploads/media/2022/916.jpeg","banner":"","row_order":"0","status":"1","clicks":"0"},{"id":"78","name":"Jhumka","parent_id":"54","slug":"jhumka","category_type":"1","image":"uploads/media/2022/download_(62).jpg","banner":null,"row_order":"0","status":"1","clicks":"13"},{"id":"79","name":"Gold Ring","parent_id":"54","slug":"gold-ring","category_type":"1","image":"uploads/media/2022/JR03336-YGP900_11_listfront.jpg","banner":null,"row_order":"0","status":null,"clicks":"0"}]},{"id":"55","name":"Silver","parent_id":"0","slug":"silver","category_type":"1","image":"uploads/media/2022/banner_1.png","banner":null,"row_order":"0","status":"1","clicks":"61","subcategories":[{"id":"80","name":"Chain","parent_id":"55","slug":"chain-1","category_type":"1","image":"uploads/media/2022/Chain.jpeg","banner":null,"row_order":"0","status":"1","clicks":"0"}]}]

class Data {
  Data({
      List<Sizes>? sizes, 
      List<Categories>? categories,}){
    _sizes = sizes;
    _categories = categories;
}

  Data.fromJson(dynamic json) {
    if (json['sizes'] != null) {
      _sizes = [];
      json['sizes'].forEach((v) {
        _sizes?.add(Sizes.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      _categories = [];
      json['categories'].forEach((v) {
        _categories?.add(Categories.fromJson(v));
      });
    }
  }
  List<Sizes>? _sizes;
  List<Categories>? _categories;
Data copyWith({  List<Sizes>? sizes,
  List<Categories>? categories,
}) => Data(  sizes: sizes ?? _sizes,
  categories: categories ?? _categories,
);
  List<Sizes>? get sizes => _sizes;
  List<Categories>? get categories => _categories;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_sizes != null) {
      map['sizes'] = _sizes?.map((v) => v.toJson()).toList();
    }
    if (_categories != null) {
      map['categories'] = _categories?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "54"
/// name : "Gold"
/// parent_id : "0"
/// slug : "gold"
/// category_type : "1"
/// image : "uploads/media/2022/download_(1).jpeg"
/// banner : null
/// row_order : "0"
/// status : "1"
/// clicks : "1008"
/// subcategories : [{"id":"56","name":"gold chain","parent_id":"54","slug":"gold-chain","category_type":"1","image":"uploads/media/2022/BANNER_3.png","banner":"uploads/media/2022/BANNER_6.png","row_order":"0","status":"1","clicks":"0"},{"id":"57","name":"Rings","parent_id":"54","slug":"rings","category_type":"1","image":"uploads/media/2022/GBG02650980_540.jpg","banner":null,"row_order":"0","status":"1","clicks":"129"},{"id":"58","name":"Necklace","parent_id":"54","slug":"necklace-1","category_type":"1","image":"uploads/media/2022/GBG02650980_540.jpg","banner":"","row_order":"0","status":"1","clicks":"0"},{"id":"59","name":"Coins","parent_id":"54","slug":"coins","category_type":"1","image":"uploads/media/2022/download_(5).jpeg","banner":null,"row_order":"0","status":"1","clicks":"0"},{"id":"60","name":"Earings","parent_id":"54","slug":"earings","category_type":"1","image":"uploads/media/2022/download_(5).jpeg","banner":null,"row_order":"0","status":"1","clicks":"0"},{"id":"61","name":"Kada","parent_id":"54","slug":"kada","category_type":"1","image":"uploads/media/2022/download_(4).jpeg","banner":null,"row_order":"0","status":"1","clicks":"0"},{"id":"62","name":"Chain","parent_id":"54","slug":"chain","category_type":"1","image":"uploads/media/2022/download_(4).jpeg","banner":null,"row_order":"0","status":"1","clicks":"0"},{"id":"76","name":"Test silver","parent_id":"54","slug":"test-silver","category_type":"1","image":"uploads/media/2022/916.jpeg","banner":"","row_order":"0","status":"1","clicks":"0"},{"id":"78","name":"Jhumka","parent_id":"54","slug":"jhumka","category_type":"1","image":"uploads/media/2022/download_(62).jpg","banner":null,"row_order":"0","status":"1","clicks":"13"},{"id":"79","name":"Gold Ring","parent_id":"54","slug":"gold-ring","category_type":"1","image":"uploads/media/2022/JR03336-YGP900_11_listfront.jpg","banner":null,"row_order":"0","status":null,"clicks":"0"}]

class Categories {
  Categories({
      String? id, 
      String? name, 
      String? parentId, 
      String? slug, 
      String? categoryType, 
      String? image, 
      dynamic banner, 
      String? rowOrder, 
      String? status, 
      String? clicks, 
      List<Subcategories>? subcategories,}){
    _id = id;
    _name = name;
    _parentId = parentId;
    _slug = slug;
    _categoryType = categoryType;
    _image = image;
    _banner = banner;
    _rowOrder = rowOrder;
    _status = status;
    _clicks = clicks;
    _subcategories = subcategories;
}

  Categories.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _parentId = json['parent_id'];
    _slug = json['slug'];
    _categoryType = json['category_type'];
    _image = json['image'];
    _banner = json['banner'];
    _rowOrder = json['row_order'];
    _status = json['status'];
    _clicks = json['clicks'];
    if (json['subcategories'] != null) {
      _subcategories = [];
      json['subcategories'].forEach((v) {
        _subcategories?.add(Subcategories.fromJson(v));
      });
    }
  }
  String? _id;
  String? _name;
  String? _parentId;
  String? _slug;
  String? _categoryType;
  String? _image;
  dynamic _banner;
  String? _rowOrder;
  String? _status;
  String? _clicks;
  List<Subcategories>? _subcategories;
Categories copyWith({  String? id,
  String? name,
  String? parentId,
  String? slug,
  String? categoryType,
  String? image,
  dynamic banner,
  String? rowOrder,
  String? status,
  String? clicks,
  List<Subcategories>? subcategories,
}) => Categories(  id: id ?? _id,
  name: name ?? _name,
  parentId: parentId ?? _parentId,
  slug: slug ?? _slug,
  categoryType: categoryType ?? _categoryType,
  image: image ?? _image,
  banner: banner ?? _banner,
  rowOrder: rowOrder ?? _rowOrder,
  status: status ?? _status,
  clicks: clicks ?? _clicks,
  subcategories: subcategories ?? _subcategories,
);
  String? get id => _id;
  String? get name => _name;
  String? get parentId => _parentId;
  String? get slug => _slug;
  String? get categoryType => _categoryType;
  String? get image => _image;
  dynamic get banner => _banner;
  String? get rowOrder => _rowOrder;
  String? get status => _status;
  String? get clicks => _clicks;
  List<Subcategories>? get subcategories => _subcategories;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['parent_id'] = _parentId;
    map['slug'] = _slug;
    map['category_type'] = _categoryType;
    map['image'] = _image;
    map['banner'] = _banner;
    map['row_order'] = _rowOrder;
    map['status'] = _status;
    map['clicks'] = _clicks;
    if (_subcategories != null) {
      map['subcategories'] = _subcategories?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "56"
/// name : "gold chain"
/// parent_id : "54"
/// slug : "gold-chain"
/// category_type : "1"
/// image : "uploads/media/2022/BANNER_3.png"
/// banner : "uploads/media/2022/BANNER_6.png"
/// row_order : "0"
/// status : "1"
/// clicks : "0"

class Subcategories {
  Subcategories({
      String? id, 
      String? name, 
      String? parentId, 
      String? slug, 
      String? categoryType, 
      String? image, 
      String? banner, 
      String? rowOrder, 
      String? status, 
      String? clicks,}){
    _id = id;
    _name = name;
    _parentId = parentId;
    _slug = slug;
    _categoryType = categoryType;
    _image = image;
    _banner = banner;
    _rowOrder = rowOrder;
    _status = status;
    _clicks = clicks;
}

  Subcategories.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _parentId = json['parent_id'];
    _slug = json['slug'];
    _categoryType = json['category_type'];
    _image = json['image'];
    _banner = json['banner'];
    _rowOrder = json['row_order'];
    _status = json['status'];
    _clicks = json['clicks'];
  }
  String? _id;
  String? _name;
  String? _parentId;
  String? _slug;
  String? _categoryType;
  String? _image;
  String? _banner;
  String? _rowOrder;
  String? _status;
  String? _clicks;
Subcategories copyWith({  String? id,
  String? name,
  String? parentId,
  String? slug,
  String? categoryType,
  String? image,
  String? banner,
  String? rowOrder,
  String? status,
  String? clicks,
}) => Subcategories(  id: id ?? _id,
  name: name ?? _name,
  parentId: parentId ?? _parentId,
  slug: slug ?? _slug,
  categoryType: categoryType ?? _categoryType,
  image: image ?? _image,
  banner: banner ?? _banner,
  rowOrder: rowOrder ?? _rowOrder,
  status: status ?? _status,
  clicks: clicks ?? _clicks,
);
  String? get id => _id;
  String? get name => _name;
  String? get parentId => _parentId;
  String? get slug => _slug;
  String? get categoryType => _categoryType;
  String? get image => _image;
  String? get banner => _banner;
  String? get rowOrder => _rowOrder;
  String? get status => _status;
  String? get clicks => _clicks;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['parent_id'] = _parentId;
    map['slug'] = _slug;
    map['category_type'] = _categoryType;
    map['image'] = _image;
    map['banner'] = _banner;
    map['row_order'] = _rowOrder;
    map['status'] = _status;
    map['clicks'] = _clicks;
    return map;
  }

}

/// title : "ring"
/// data : [5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25]

class Sizes {
  Sizes({
      String? title, 
      List<num>? data,}){
    _title = title;
    _data = data;
}

  Sizes.fromJson(dynamic json) {
    _title = json['title'];
    _data = json['data'] != null ? json['data'].cast<num>() : [];
  }
  String? _title;
  List<num>? _data;
Sizes copyWith({  String? title,
  List<num>? data,
}) => Sizes(  title: title ?? _title,
  data: data ?? _data,
);
  String? get title => _title;
  List<num>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['data'] = _data;
    return map;
  }

}