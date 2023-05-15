/// status : true
/// message : "All rates"
/// data : {"gold_rate":"5,471.00","silver_rate":"68.50","gold_purchase_percent":"2","silver_purchase_percent":"2","gold_sell_amount":"0.00","silver_sell_amount":"0.00","buy_gst_percent":"0","gold_making_charge_percent":"0","silver_making_charge_percent":"3","delivery_gst_tax_percent":"18","delivery_charges":"30.00"}

class LivePriceModel {
  LivePriceModel({
      bool? status, 
      String? message, 
      Data? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  LivePriceModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _status;
  String? _message;
  Data? _data;
LivePriceModel copyWith({  bool? status,
  String? message,
  Data? data,
}) => LivePriceModel(  status: status ?? _status,
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

/// gold_rate : "5,471.00"
/// silver_rate : "68.50"
/// gold_purchase_percent : "2"
/// silver_purchase_percent : "2"
/// gold_sell_amount : "0.00"
/// silver_sell_amount : "0.00"
/// buy_gst_percent : "0"
/// gold_making_charge_percent : "0"
/// silver_making_charge_percent : "3"
/// delivery_gst_tax_percent : "18"
/// delivery_charges : "30.00"

class Data {
  Data({
      String? goldRate, 
      String? silverRate, 
      String? goldPurchasePercent, 
      String? silverPurchasePercent, 
      String? goldSellAmount, 
      String? silverSellAmount, 
      String? buyGstPercent, 
      String? goldMakingChargePercent, 
      String? silverMakingChargePercent, 
      String? deliveryGstTaxPercent, 
      String? deliveryCharges,}){
    _goldRate = goldRate;
    _silverRate = silverRate;
    _goldPurchasePercent = goldPurchasePercent;
    _silverPurchasePercent = silverPurchasePercent;
    _goldSellAmount = goldSellAmount;
    _silverSellAmount = silverSellAmount;
    _buyGstPercent = buyGstPercent;
    _goldMakingChargePercent = goldMakingChargePercent;
    _silverMakingChargePercent = silverMakingChargePercent;
    _deliveryGstTaxPercent = deliveryGstTaxPercent;
    _deliveryCharges = deliveryCharges;
}

  Data.fromJson(dynamic json) {
    _goldRate = json['gold_rate'];
    _silverRate = json['silver_rate'];
    _goldPurchasePercent = json['gold_purchase_percent'];
    _silverPurchasePercent = json['silver_purchase_percent'];
    _goldSellAmount = json['gold_sell_amount'];
    _silverSellAmount = json['silver_sell_amount'];
    _buyGstPercent = json['buy_gst_percent'];
    _goldMakingChargePercent = json['gold_making_charge_percent'];
    _silverMakingChargePercent = json['silver_making_charge_percent'];
    _deliveryGstTaxPercent = json['delivery_gst_tax_percent'];
    _deliveryCharges = json['delivery_charges'];
  }
  String? _goldRate;
  String? _silverRate;
  String? _goldPurchasePercent;
  String? _silverPurchasePercent;
  String? _goldSellAmount;
  String? _silverSellAmount;
  String? _buyGstPercent;
  String? _goldMakingChargePercent;
  String? _silverMakingChargePercent;
  String? _deliveryGstTaxPercent;
  String? _deliveryCharges;
Data copyWith({  String? goldRate,
  String? silverRate,
  String? goldPurchasePercent,
  String? silverPurchasePercent,
  String? goldSellAmount,
  String? silverSellAmount,
  String? buyGstPercent,
  String? goldMakingChargePercent,
  String? silverMakingChargePercent,
  String? deliveryGstTaxPercent,
  String? deliveryCharges,
}) => Data(  goldRate: goldRate ?? _goldRate,
  silverRate: silverRate ?? _silverRate,
  goldPurchasePercent: goldPurchasePercent ?? _goldPurchasePercent,
  silverPurchasePercent: silverPurchasePercent ?? _silverPurchasePercent,
  goldSellAmount: goldSellAmount ?? _goldSellAmount,
  silverSellAmount: silverSellAmount ?? _silverSellAmount,
  buyGstPercent: buyGstPercent ?? _buyGstPercent,
  goldMakingChargePercent: goldMakingChargePercent ?? _goldMakingChargePercent,
  silverMakingChargePercent: silverMakingChargePercent ?? _silverMakingChargePercent,
  deliveryGstTaxPercent: deliveryGstTaxPercent ?? _deliveryGstTaxPercent,
  deliveryCharges: deliveryCharges ?? _deliveryCharges,
);
  String? get goldRate => _goldRate;
  String? get silverRate => _silverRate;
  String? get goldPurchasePercent => _goldPurchasePercent;
  String? get silverPurchasePercent => _silverPurchasePercent;
  String? get goldSellAmount => _goldSellAmount;
  String? get silverSellAmount => _silverSellAmount;
  String? get buyGstPercent => _buyGstPercent;
  String? get goldMakingChargePercent => _goldMakingChargePercent;
  String? get silverMakingChargePercent => _silverMakingChargePercent;
  String? get deliveryGstTaxPercent => _deliveryGstTaxPercent;
  String? get deliveryCharges => _deliveryCharges;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['gold_rate'] = _goldRate;
    map['silver_rate'] = _silverRate;
    map['gold_purchase_percent'] = _goldPurchasePercent;
    map['silver_purchase_percent'] = _silverPurchasePercent;
    map['gold_sell_amount'] = _goldSellAmount;
    map['silver_sell_amount'] = _silverSellAmount;
    map['buy_gst_percent'] = _buyGstPercent;
    map['gold_making_charge_percent'] = _goldMakingChargePercent;
    map['silver_making_charge_percent'] = _silverMakingChargePercent;
    map['delivery_gst_tax_percent'] = _deliveryGstTaxPercent;
    map['delivery_charges'] = _deliveryCharges;
    return map;
  }

}