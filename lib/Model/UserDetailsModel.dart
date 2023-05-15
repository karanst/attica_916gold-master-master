/// error : false
/// message : "get successfully"
/// data : [{"id":"251","ip_address":null,"username":"Karan","password":"","email":"karanstomar@gmail.com","mobile":"8770496665","image":null,"balance":"110655","activation_selector":null,"activation_code":null,"forgotten_password_selector":null,"forgotten_password_code":null,"forgotten_password_time":null,"remember_selector":null,"remember_code":null,"created_on":"0","last_login":null,"active":"1","company":null,"address":null,"bonus":null,"cash_received":"0.00","dob":null,"country_code":null,"city":null,"age":"","gender":"","area":null,"street":null,"pincode":null,"serviceable_zipcodes":null,"apikey":null,"referral_code":null,"friends_code":null,"fcm_id":"dHFIe80OTce1CDxjm2K5L6:APA91bF0D7IONS0OkEVRJ9Iy66gAtJYcuVxc0DpNZXI0GULCBYuGtqTRlivBspszhwicbooA4lj0PGvWU9uHIEmcaCy7SsTZX2RfS3qLStGNnnhUepyeIbNJoFj63tEQbxEAbNITfkcJ","latitude":null,"longitude":null,"created_at":"2022-10-07 11:27:23","otp":"269161","gold_wallet":"0.000000042048349285089825","silver_wallet":"0.000000262160004500106","unique_id":"","is_email_verified":"0","kyc_doc_type":"1","front_view":"https://916digitalgold.com/uploads/kyc_document/1676894579image_cropper_1676894546039.jpg","back_view":"https://916digitalgold.com/uploads/kyc_document/1676894579image_cropper_1676894571293.jpg","is_kyc":"1","mpin":"MTIzNA==","is_mpin_set":"1","measurement_relation":null}]

class UserDetailsModel {
  UserDetailsModel({
      bool? error, 
      String? message, 
      List<Data>? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  UserDetailsModel.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  bool? _error;
  String? _message;
  List<Data>? _data;
UserDetailsModel copyWith({  bool? error,
  String? message,
  List<Data>? data,
}) => UserDetailsModel(  error: error ?? _error,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get error => _error;
  String? get message => _message;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['error'] = _error;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "251"
/// ip_address : null
/// username : "Karan"
/// password : ""
/// email : "karanstomar@gmail.com"
/// mobile : "8770496665"
/// image : null
/// balance : "110655"
/// activation_selector : null
/// activation_code : null
/// forgotten_password_selector : null
/// forgotten_password_code : null
/// forgotten_password_time : null
/// remember_selector : null
/// remember_code : null
/// created_on : "0"
/// last_login : null
/// active : "1"
/// company : null
/// address : null
/// bonus : null
/// cash_received : "0.00"
/// dob : null
/// country_code : null
/// city : null
/// age : ""
/// gender : ""
/// area : null
/// street : null
/// pincode : null
/// serviceable_zipcodes : null
/// apikey : null
/// referral_code : null
/// friends_code : null
/// fcm_id : "dHFIe80OTce1CDxjm2K5L6:APA91bF0D7IONS0OkEVRJ9Iy66gAtJYcuVxc0DpNZXI0GULCBYuGtqTRlivBspszhwicbooA4lj0PGvWU9uHIEmcaCy7SsTZX2RfS3qLStGNnnhUepyeIbNJoFj63tEQbxEAbNITfkcJ"
/// latitude : null
/// longitude : null
/// created_at : "2022-10-07 11:27:23"
/// otp : "269161"
/// gold_wallet : "0.000000042048349285089825"
/// silver_wallet : "0.000000262160004500106"
/// unique_id : ""
/// is_email_verified : "0"
/// kyc_doc_type : "1"
/// front_view : "https://916digitalgold.com/uploads/kyc_document/1676894579image_cropper_1676894546039.jpg"
/// back_view : "https://916digitalgold.com/uploads/kyc_document/1676894579image_cropper_1676894571293.jpg"
/// is_kyc : "1"
/// mpin : "MTIzNA=="
/// is_mpin_set : "1"
/// measurement_relation : null

class Data {
  Data({
      String? id, 
      dynamic ipAddress, 
      String? username, 
      String? password, 
      String? email, 
      String? mobile, 
      dynamic image, 
      String? balance, 
      dynamic activationSelector, 
      dynamic activationCode, 
      dynamic forgottenPasswordSelector, 
      dynamic forgottenPasswordCode, 
      dynamic forgottenPasswordTime, 
      dynamic rememberSelector, 
      dynamic rememberCode, 
      String? createdOn, 
      dynamic lastLogin, 
      String? active, 
      dynamic company, 
      dynamic address, 
      dynamic bonus, 
      String? cashReceived, 
      dynamic dob, 
      dynamic countryCode, 
      dynamic city, 
      String? age, 
      String? gender, 
      dynamic area, 
      dynamic street, 
      dynamic pincode, 
      dynamic serviceableZipcodes, 
      dynamic apikey, 
      dynamic referralCode, 
      dynamic friendsCode, 
      String? fcmId, 
      dynamic latitude, 
      dynamic longitude, 
      String? createdAt, 
      String? otp, 
      String? goldWallet, 
      String? silverWallet, 
      String? uniqueId, 
      String? isEmailVerified, 
      String? kycDocType, 
      String? frontView, 
      String? backView, 
      String? isKyc, 
      String? mpin, 
      String? isMpinSet, 
      dynamic measurementRelation,}){
    _id = id;
    _ipAddress = ipAddress;
    _username = username;
    _password = password;
    _email = email;
    _mobile = mobile;
    _image = image;
    _balance = balance;
    _activationSelector = activationSelector;
    _activationCode = activationCode;
    _forgottenPasswordSelector = forgottenPasswordSelector;
    _forgottenPasswordCode = forgottenPasswordCode;
    _forgottenPasswordTime = forgottenPasswordTime;
    _rememberSelector = rememberSelector;
    _rememberCode = rememberCode;
    _createdOn = createdOn;
    _lastLogin = lastLogin;
    _active = active;
    _company = company;
    _address = address;
    _bonus = bonus;
    _cashReceived = cashReceived;
    _dob = dob;
    _countryCode = countryCode;
    _city = city;
    _age = age;
    _gender = gender;
    _area = area;
    _street = street;
    _pincode = pincode;
    _serviceableZipcodes = serviceableZipcodes;
    _apikey = apikey;
    _referralCode = referralCode;
    _friendsCode = friendsCode;
    _fcmId = fcmId;
    _latitude = latitude;
    _longitude = longitude;
    _createdAt = createdAt;
    _otp = otp;
    _goldWallet = goldWallet;
    _silverWallet = silverWallet;
    _uniqueId = uniqueId;
    _isEmailVerified = isEmailVerified;
    _kycDocType = kycDocType;
    _frontView = frontView;
    _backView = backView;
    _isKyc = isKyc;
    _mpin = mpin;
    _isMpinSet = isMpinSet;
    _measurementRelation = measurementRelation;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _ipAddress = json['ip_address'];
    _username = json['username'];
    _password = json['password'];
    _email = json['email'];
    _mobile = json['mobile'];
    _image = json['image'];
    _balance = json['balance'];
    _activationSelector = json['activation_selector'];
    _activationCode = json['activation_code'];
    _forgottenPasswordSelector = json['forgotten_password_selector'];
    _forgottenPasswordCode = json['forgotten_password_code'];
    _forgottenPasswordTime = json['forgotten_password_time'];
    _rememberSelector = json['remember_selector'];
    _rememberCode = json['remember_code'];
    _createdOn = json['created_on'];
    _lastLogin = json['last_login'];
    _active = json['active'];
    _company = json['company'];
    _address = json['address'];
    _bonus = json['bonus'];
    _cashReceived = json['cash_received'];
    _dob = json['dob'];
    _countryCode = json['country_code'];
    _city = json['city'];
    _age = json['age'];
    _gender = json['gender'];
    _area = json['area'];
    _street = json['street'];
    _pincode = json['pincode'];
    _serviceableZipcodes = json['serviceable_zipcodes'];
    _apikey = json['apikey'];
    _referralCode = json['referral_code'];
    _friendsCode = json['friends_code'];
    _fcmId = json['fcm_id'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _createdAt = json['created_at'];
    _otp = json['otp'];
    _goldWallet = json['gold_wallet'];
    _silverWallet = json['silver_wallet'];
    _uniqueId = json['unique_id'];
    _isEmailVerified = json['is_email_verified'];
    _kycDocType = json['kyc_doc_type'];
    _frontView = json['front_view'];
    _backView = json['back_view'];
    _isKyc = json['is_kyc'];
    _mpin = json['mpin'];
    _isMpinSet = json['is_mpin_set'];
    _measurementRelation = json['measurement_relation'];
  }
  String? _id;
  dynamic _ipAddress;
  String? _username;
  String? _password;
  String? _email;
  String? _mobile;
  dynamic _image;
  String? _balance;
  dynamic _activationSelector;
  dynamic _activationCode;
  dynamic _forgottenPasswordSelector;
  dynamic _forgottenPasswordCode;
  dynamic _forgottenPasswordTime;
  dynamic _rememberSelector;
  dynamic _rememberCode;
  String? _createdOn;
  dynamic _lastLogin;
  String? _active;
  dynamic _company;
  dynamic _address;
  dynamic _bonus;
  String? _cashReceived;
  dynamic _dob;
  dynamic _countryCode;
  dynamic _city;
  String? _age;
  String? _gender;
  dynamic _area;
  dynamic _street;
  dynamic _pincode;
  dynamic _serviceableZipcodes;
  dynamic _apikey;
  dynamic _referralCode;
  dynamic _friendsCode;
  String? _fcmId;
  dynamic _latitude;
  dynamic _longitude;
  String? _createdAt;
  String? _otp;
  String? _goldWallet;
  String? _silverWallet;
  String? _uniqueId;
  String? _isEmailVerified;
  String? _kycDocType;
  String? _frontView;
  String? _backView;
  String? _isKyc;
  String? _mpin;
  String? _isMpinSet;
  dynamic _measurementRelation;
Data copyWith({  String? id,
  dynamic ipAddress,
  String? username,
  String? password,
  String? email,
  String? mobile,
  dynamic image,
  String? balance,
  dynamic activationSelector,
  dynamic activationCode,
  dynamic forgottenPasswordSelector,
  dynamic forgottenPasswordCode,
  dynamic forgottenPasswordTime,
  dynamic rememberSelector,
  dynamic rememberCode,
  String? createdOn,
  dynamic lastLogin,
  String? active,
  dynamic company,
  dynamic address,
  dynamic bonus,
  String? cashReceived,
  dynamic dob,
  dynamic countryCode,
  dynamic city,
  String? age,
  String? gender,
  dynamic area,
  dynamic street,
  dynamic pincode,
  dynamic serviceableZipcodes,
  dynamic apikey,
  dynamic referralCode,
  dynamic friendsCode,
  String? fcmId,
  dynamic latitude,
  dynamic longitude,
  String? createdAt,
  String? otp,
  String? goldWallet,
  String? silverWallet,
  String? uniqueId,
  String? isEmailVerified,
  String? kycDocType,
  String? frontView,
  String? backView,
  String? isKyc,
  String? mpin,
  String? isMpinSet,
  dynamic measurementRelation,
}) => Data(  id: id ?? _id,
  ipAddress: ipAddress ?? _ipAddress,
  username: username ?? _username,
  password: password ?? _password,
  email: email ?? _email,
  mobile: mobile ?? _mobile,
  image: image ?? _image,
  balance: balance ?? _balance,
  activationSelector: activationSelector ?? _activationSelector,
  activationCode: activationCode ?? _activationCode,
  forgottenPasswordSelector: forgottenPasswordSelector ?? _forgottenPasswordSelector,
  forgottenPasswordCode: forgottenPasswordCode ?? _forgottenPasswordCode,
  forgottenPasswordTime: forgottenPasswordTime ?? _forgottenPasswordTime,
  rememberSelector: rememberSelector ?? _rememberSelector,
  rememberCode: rememberCode ?? _rememberCode,
  createdOn: createdOn ?? _createdOn,
  lastLogin: lastLogin ?? _lastLogin,
  active: active ?? _active,
  company: company ?? _company,
  address: address ?? _address,
  bonus: bonus ?? _bonus,
  cashReceived: cashReceived ?? _cashReceived,
  dob: dob ?? _dob,
  countryCode: countryCode ?? _countryCode,
  city: city ?? _city,
  age: age ?? _age,
  gender: gender ?? _gender,
  area: area ?? _area,
  street: street ?? _street,
  pincode: pincode ?? _pincode,
  serviceableZipcodes: serviceableZipcodes ?? _serviceableZipcodes,
  apikey: apikey ?? _apikey,
  referralCode: referralCode ?? _referralCode,
  friendsCode: friendsCode ?? _friendsCode,
  fcmId: fcmId ?? _fcmId,
  latitude: latitude ?? _latitude,
  longitude: longitude ?? _longitude,
  createdAt: createdAt ?? _createdAt,
  otp: otp ?? _otp,
  goldWallet: goldWallet ?? _goldWallet,
  silverWallet: silverWallet ?? _silverWallet,
  uniqueId: uniqueId ?? _uniqueId,
  isEmailVerified: isEmailVerified ?? _isEmailVerified,
  kycDocType: kycDocType ?? _kycDocType,
  frontView: frontView ?? _frontView,
  backView: backView ?? _backView,
  isKyc: isKyc ?? _isKyc,
  mpin: mpin ?? _mpin,
  isMpinSet: isMpinSet ?? _isMpinSet,
  measurementRelation: measurementRelation ?? _measurementRelation,
);
  String? get id => _id;
  dynamic get ipAddress => _ipAddress;
  String? get username => _username;
  String? get password => _password;
  String? get email => _email;
  String? get mobile => _mobile;
  dynamic get image => _image;
  String? get balance => _balance;
  dynamic get activationSelector => _activationSelector;
  dynamic get activationCode => _activationCode;
  dynamic get forgottenPasswordSelector => _forgottenPasswordSelector;
  dynamic get forgottenPasswordCode => _forgottenPasswordCode;
  dynamic get forgottenPasswordTime => _forgottenPasswordTime;
  dynamic get rememberSelector => _rememberSelector;
  dynamic get rememberCode => _rememberCode;
  String? get createdOn => _createdOn;
  dynamic get lastLogin => _lastLogin;
  String? get active => _active;
  dynamic get company => _company;
  dynamic get address => _address;
  dynamic get bonus => _bonus;
  String? get cashReceived => _cashReceived;
  dynamic get dob => _dob;
  dynamic get countryCode => _countryCode;
  dynamic get city => _city;
  String? get age => _age;
  String? get gender => _gender;
  dynamic get area => _area;
  dynamic get street => _street;
  dynamic get pincode => _pincode;
  dynamic get serviceableZipcodes => _serviceableZipcodes;
  dynamic get apikey => _apikey;
  dynamic get referralCode => _referralCode;
  dynamic get friendsCode => _friendsCode;
  String? get fcmId => _fcmId;
  dynamic get latitude => _latitude;
  dynamic get longitude => _longitude;
  String? get createdAt => _createdAt;
  String? get otp => _otp;
  String? get goldWallet => _goldWallet;
  String? get silverWallet => _silverWallet;
  String? get uniqueId => _uniqueId;
  String? get isEmailVerified => _isEmailVerified;
  String? get kycDocType => _kycDocType;
  String? get frontView => _frontView;
  String? get backView => _backView;
  String? get isKyc => _isKyc;
  String? get mpin => _mpin;
  String? get isMpinSet => _isMpinSet;
  dynamic get measurementRelation => _measurementRelation;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['ip_address'] = _ipAddress;
    map['username'] = _username;
    map['password'] = _password;
    map['email'] = _email;
    map['mobile'] = _mobile;
    map['image'] = _image;
    map['balance'] = _balance;
    map['activation_selector'] = _activationSelector;
    map['activation_code'] = _activationCode;
    map['forgotten_password_selector'] = _forgottenPasswordSelector;
    map['forgotten_password_code'] = _forgottenPasswordCode;
    map['forgotten_password_time'] = _forgottenPasswordTime;
    map['remember_selector'] = _rememberSelector;
    map['remember_code'] = _rememberCode;
    map['created_on'] = _createdOn;
    map['last_login'] = _lastLogin;
    map['active'] = _active;
    map['company'] = _company;
    map['address'] = _address;
    map['bonus'] = _bonus;
    map['cash_received'] = _cashReceived;
    map['dob'] = _dob;
    map['country_code'] = _countryCode;
    map['city'] = _city;
    map['age'] = _age;
    map['gender'] = _gender;
    map['area'] = _area;
    map['street'] = _street;
    map['pincode'] = _pincode;
    map['serviceable_zipcodes'] = _serviceableZipcodes;
    map['apikey'] = _apikey;
    map['referral_code'] = _referralCode;
    map['friends_code'] = _friendsCode;
    map['fcm_id'] = _fcmId;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    map['created_at'] = _createdAt;
    map['otp'] = _otp;
    map['gold_wallet'] = _goldWallet;
    map['silver_wallet'] = _silverWallet;
    map['unique_id'] = _uniqueId;
    map['is_email_verified'] = _isEmailVerified;
    map['kyc_doc_type'] = _kycDocType;
    map['front_view'] = _frontView;
    map['back_view'] = _backView;
    map['is_kyc'] = _isKyc;
    map['mpin'] = _mpin;
    map['is_mpin_set'] = _isMpinSet;
    map['measurement_relation'] = _measurementRelation;
    return map;
  }

}