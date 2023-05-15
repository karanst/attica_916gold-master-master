/// family_measurement : [{"title":"Mom","data":[{"name":"Rings","id":"319","user_id":"424","relation_type":"Mom","size":"9","category_id":"Rings","created_at":"2023-02-19 22:51:41","updated_at":"2023-02-19 22:51:41"},{"name":"Bangles","id":"320","user_id":"424","relation_type":"Mom","size":" 2.3","category_id":"Bangles","created_at":"2023-02-19 22:51:41","updated_at":"2023-02-19 22:51:41"},{"name":"Cuff","id":"321","user_id":"424","relation_type":"Mom","size":" M","category_id":"Cuff","created_at":"2023-02-19 22:51:41","updated_at":"2023-02-19 22:51:41"},{"name":"","id":"322","user_id":"424","relation_type":"Mom","size":" null","category_id":"","created_at":"2023-02-19 22:51:41","updated_at":"2023-02-19 22:51:41"},{"name":"","id":"323","user_id":"424","relation_type":"Mom","size":" null","category_id":"","created_at":"2023-02-19 22:51:41","updated_at":"2023-02-19 22:51:41"},{"name":"","id":"324","user_id":"424","relation_type":"Mom","size":" null","category_id":"","created_at":"2023-02-19 22:51:41","updated_at":"2023-02-19 22:51:41"}]}]
/// my_measurement : [{"name":"ring","id":"316","user_id":"424","relation_type":"Self","size":"5","category_id":"ring","created_at":"2023-02-19 22:48:42","updated_at":"2023-02-19 22:48:42"},{"name":"bangle","id":"317","user_id":"424","relation_type":"Self","size":"2.1","category_id":"bangle","created_at":"2023-02-19 22:48:42","updated_at":"2023-02-19 22:48:42"},{"name":"cuff","id":"318","user_id":"424","relation_type":"Self","size":"M","category_id":"cuff","created_at":"2023-02-19 22:48:42","updated_at":"2023-02-19 22:48:42"}]

class GetMeasureModel {
  GetMeasureModel({
      List<FamilyMeasurement>? familyMeasurement, 
      List<MyMeasurement>? myMeasurement,}){
    _familyMeasurement = familyMeasurement;
    _myMeasurement = myMeasurement;
}

  GetMeasureModel.fromJson(dynamic json) {
    if (json['family_measurement'] != null) {
      _familyMeasurement = [];
      json['family_measurement'].forEach((v) {
        _familyMeasurement?.add(FamilyMeasurement.fromJson(v));
      });
    }
    if (json['my_measurement'] != null) {
      _myMeasurement = [];
      json['my_measurement'].forEach((v) {
        _myMeasurement?.add(MyMeasurement.fromJson(v));
      });
    }
  }
  List<FamilyMeasurement>? _familyMeasurement;
  List<MyMeasurement>? _myMeasurement;
GetMeasureModel copyWith({  List<FamilyMeasurement>? familyMeasurement,
  List<MyMeasurement>? myMeasurement,
}) => GetMeasureModel(  familyMeasurement: familyMeasurement ?? _familyMeasurement,
  myMeasurement: myMeasurement ?? _myMeasurement,
);
  List<FamilyMeasurement>? get familyMeasurement => _familyMeasurement;
  List<MyMeasurement>? get myMeasurement => _myMeasurement;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_familyMeasurement != null) {
      map['family_measurement'] = _familyMeasurement?.map((v) => v.toJson()).toList();
    }
    if (_myMeasurement != null) {
      map['my_measurement'] = _myMeasurement?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// name : "ring"
/// id : "316"
/// user_id : "424"
/// relation_type : "Self"
/// size : "5"
/// category_id : "ring"
/// created_at : "2023-02-19 22:48:42"
/// updated_at : "2023-02-19 22:48:42"

class MyMeasurement {
  MyMeasurement({
      String? name, 
      String? id, 
      String? userId, 
      String? relationType, 
      String? size, 
      String? categoryId, 
      String? createdAt, 
      String? updatedAt,}){
    _name = name;
    _id = id;
    _userId = userId;
    _relationType = relationType;
    _size = size;
    _categoryId = categoryId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  MyMeasurement.fromJson(dynamic json) {
    _name = json['name'];
    _id = json['id'];
    _userId = json['user_id'];
    _relationType = json['relation_type'];
    _size = json['size'];
    _categoryId = json['category_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  String? _name;
  String? _id;
  String? _userId;
  String? _relationType;
  String? _size;
  String? _categoryId;
  String? _createdAt;
  String? _updatedAt;
MyMeasurement copyWith({  String? name,
  String? id,
  String? userId,
  String? relationType,
  String? size,
  String? categoryId,
  String? createdAt,
  String? updatedAt,
}) => MyMeasurement(  name: name ?? _name,
  id: id ?? _id,
  userId: userId ?? _userId,
  relationType: relationType ?? _relationType,
  size: size ?? _size,
  categoryId: categoryId ?? _categoryId,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  String? get name => _name;
  String? get id => _id;
  String? get userId => _userId;
  String? get relationType => _relationType;
  String? get size => _size;
  String? get categoryId => _categoryId;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['id'] = _id;
    map['user_id'] = _userId;
    map['relation_type'] = _relationType;
    map['size'] = _size;
    map['category_id'] = _categoryId;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

/// title : "Mom"
/// data : [{"name":"Rings","id":"319","user_id":"424","relation_type":"Mom","size":"9","category_id":"Rings","created_at":"2023-02-19 22:51:41","updated_at":"2023-02-19 22:51:41"},{"name":"Bangles","id":"320","user_id":"424","relation_type":"Mom","size":" 2.3","category_id":"Bangles","created_at":"2023-02-19 22:51:41","updated_at":"2023-02-19 22:51:41"},{"name":"Cuff","id":"321","user_id":"424","relation_type":"Mom","size":" M","category_id":"Cuff","created_at":"2023-02-19 22:51:41","updated_at":"2023-02-19 22:51:41"},{"name":"","id":"322","user_id":"424","relation_type":"Mom","size":" null","category_id":"","created_at":"2023-02-19 22:51:41","updated_at":"2023-02-19 22:51:41"},{"name":"","id":"323","user_id":"424","relation_type":"Mom","size":" null","category_id":"","created_at":"2023-02-19 22:51:41","updated_at":"2023-02-19 22:51:41"},{"name":"","id":"324","user_id":"424","relation_type":"Mom","size":" null","category_id":"","created_at":"2023-02-19 22:51:41","updated_at":"2023-02-19 22:51:41"}]

class FamilyMeasurement {
  FamilyMeasurement({
      String? title, 
      List<Data>? data,}){
    _title = title;
    _data = data;
}

  FamilyMeasurement.fromJson(dynamic json) {
    _title = json['title'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  String? _title;
  List<Data>? _data;
FamilyMeasurement copyWith({  String? title,
  List<Data>? data,
}) => FamilyMeasurement(  title: title ?? _title,
  data: data ?? _data,
);
  String? get title => _title;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// name : "Rings"
/// id : "319"
/// user_id : "424"
/// relation_type : "Mom"
/// size : "9"
/// category_id : "Rings"
/// created_at : "2023-02-19 22:51:41"
/// updated_at : "2023-02-19 22:51:41"

class Data {
  Data({
      String? name, 
      String? id, 
      String? userId, 
      String? relationType, 
      String? size, 
      String? categoryId, 
      String? createdAt, 
      String? updatedAt,}){
    _name = name;
    _id = id;
    _userId = userId;
    _relationType = relationType;
    _size = size;
    _categoryId = categoryId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Data.fromJson(dynamic json) {
    _name = json['name'];
    _id = json['id'];
    _userId = json['user_id'];
    _relationType = json['relation_type'];
    _size = json['size'];
    _categoryId = json['category_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  String? _name;
  String? _id;
  String? _userId;
  String? _relationType;
  String? _size;
  String? _categoryId;
  String? _createdAt;
  String? _updatedAt;
Data copyWith({  String? name,
  String? id,
  String? userId,
  String? relationType,
  String? size,
  String? categoryId,
  String? createdAt,
  String? updatedAt,
}) => Data(  name: name ?? _name,
  id: id ?? _id,
  userId: userId ?? _userId,
  relationType: relationType ?? _relationType,
  size: size ?? _size,
  categoryId: categoryId ?? _categoryId,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  String? get name => _name;
  String? get id => _id;
  String? get userId => _userId;
  String? get relationType => _relationType;
  String? get size => _size;
  String? get categoryId => _categoryId;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['id'] = _id;
    map['user_id'] = _userId;
    map['relation_type'] = _relationType;
    map['size'] = _size;
    map['category_id'] = _categoryId;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}