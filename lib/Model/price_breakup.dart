/// status : true
/// data : [{"title":"Gold","price":[{"id":"82","product_id":"210","size":"7","weight":"6.000","unit":"gm","rate":"900.00","amount":"5400.00","discount":"0","component_type":"Gold","component_name":"18 KT Yellow Gold","created_at":"2022-12-16 13:08:27","updated_at":"2022-12-16 13:08:27"},{"id":"85","product_id":"210","size":"7","weight":"6.000","unit":"gm","rate":"300.00","amount":"1800.00","discount":"0","component_type":"Gold","component_name":"Making Charges","created_at":"2022-12-16 13:08:27","updated_at":"2022-12-16 13:08:27"}]}]

class PriceBreakup {
  PriceBreakup({
      bool? status,
    String? subTotal,
      List<Data>? data,}){
    _status = status;
    _subTotal = subTotal;
    _data = data;
}

  PriceBreakup.fromJson(dynamic json) {
    _status = json['status'];
    _subTotal = json['subtotal'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  bool? _status;
  String? _subTotal;
  List<Data>? _data;
PriceBreakup copyWith({
  bool? status,
  String? subTotal,
  List<Data>? data,
}) => PriceBreakup(
  status: status ?? _status,
  subTotal: subTotal ?? _subTotal ,
  data: data ?? _data,
);
  bool? get status => _status;
  String? get subTotal => _subTotal;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['subtotal'] = _subTotal;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// title : "Gold"
/// price : [{"id":"82","product_id":"210","size":"7","weight":"6.000","unit":"gm","rate":"900.00","amount":"5400.00","discount":"0","component_type":"Gold","component_name":"18 KT Yellow Gold","created_at":"2022-12-16 13:08:27","updated_at":"2022-12-16 13:08:27"},{"id":"85","product_id":"210","size":"7","weight":"6.000","unit":"gm","rate":"300.00","amount":"1800.00","discount":"0","component_type":"Gold","component_name":"Making Charges","created_at":"2022-12-16 13:08:27","updated_at":"2022-12-16 13:08:27"}]

class Data {
  Data({
      String? title, 
      List<Price>? price,}){
    _title = title;
    _price = price;
}

  Data.fromJson(dynamic json) {
    _title = json['title'];
    if (json['price'] != null) {
      _price = [];
      json['price'].forEach((v) {
        _price?.add(Price.fromJson(v));
      });
    }
  }
  String? _title;
  List<Price>? _price;
Data copyWith({  String? title,
  List<Price>? price,
}) => Data(  title: title ?? _title,
  price: price ?? _price,
);
  String? get title => _title;
  List<Price>? get price => _price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    if (_price != null) {
      map['price'] = _price?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "82"
/// product_id : "210"
/// size : "7"
/// weight : "6.000"
/// unit : "gm"
/// rate : "900.00"
/// amount : "5400.00"
/// discount : "0"
/// component_type : "Gold"
/// component_name : "18 KT Yellow Gold"
/// created_at : "2022-12-16 13:08:27"
/// updated_at : "2022-12-16 13:08:27"

class Price {
  Price({
      String? id, 
      String? productId, 
      String? size, 
      String? weight, 
      String? unit, 
      String? rate, 
      String? amount, 
      String? discount, 
      String? componentType, 
      String? componentName, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _productId = productId;
    _size = size;
    _weight = weight;
    _unit = unit;
    _rate = rate;
    _amount = amount;
    _discount = discount;
    _componentType = componentType;
    _componentName = componentName;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Price.fromJson(dynamic json) {
    _id = json['id'];
    _productId = json['product_id'];
    _size = json['size'];
    _weight = json['weight'];
    _unit = json['unit'];
    _rate = json['rate'];
    _amount = json['amount'];
    _discount = json['discount'];
    _componentType = json['component_type'];
    _componentName = json['component_name'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  String? _id;
  String? _productId;
  String? _size;
  String? _weight;
  String? _unit;
  String? _rate;
  String? _amount;
  String? _discount;
  String? _componentType;
  String? _componentName;
  String? _createdAt;
  String? _updatedAt;
Price copyWith({  String? id,
  String? productId,
  String? size,
  String? weight,
  String? unit,
  String? rate,
  String? amount,
  String? discount,
  String? componentType,
  String? componentName,
  String? createdAt,
  String? updatedAt,
}) => Price(  id: id ?? _id,
  productId: productId ?? _productId,
  size: size ?? _size,
  weight: weight ?? _weight,
  unit: unit ?? _unit,
  rate: rate ?? _rate,
  amount: amount ?? _amount,
  discount: discount ?? _discount,
  componentType: componentType ?? _componentType,
  componentName: componentName ?? _componentName,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  String? get id => _id;
  String? get productId => _productId;
  String? get size => _size;
  String? get weight => _weight;
  String? get unit => _unit;
  String? get rate => _rate;
  String? get amount => _amount;
  String? get discount => _discount;
  String? get componentType => _componentType;
  String? get componentName => _componentName;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['product_id'] = _productId;
    map['size'] = _size;
    map['weight'] = _weight;
    map['unit'] = _unit;
    map['rate'] = _rate;
    map['amount'] = _amount;
    map['discount'] = _discount;
    map['component_type'] = _componentType;
    map['component_name'] = _componentName;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}