// import 'dart:convert';
// /// error : false
// /// message : "Products retrieved successfully !"
// /// min_price : "44"
// /// max_price : "49000"
// /// search : null
// /// filters : []
// /// tags : ["coins"]
// /// total : "1"
// /// offset : "0"
// /// product : [{"total":"6","sales":"1","stock_type":null,"is_prices_inclusive_tax":"1","sizes":[],"size_info":"","standout":"","type":"simple_product","attr_value_ids":"","seller_rating":"3.2","seller_slug":"alpha-shop","seller_no_of_ratings":"6","seller_profile":"https://developmentalphawizz.com/attica_gold/uploads/seller/download_(82)1.jpg","store_name":"Alpha Shop","store_description":"Alpha has introduced a new strapline","seller_id":"1","seller_name":null,"id":"173","stock":null,"name":"Silver Coin","category_id":"55","sub_category_id":"71","short_description":"Silver Coin","price":"5000","weight":"10","slug":"silver-coin","description":"","total_allowed_quantity":null,"deliverable_type":"1","deliverable_zipcodes":null,"minimum_order_quantity":"1","quantity_step_size":"1","cod_allowed":"1","row_order":"0","rating":"0","no_of_ratings":"0","image":"https://developmentalphawizz.com/attica_gold/uploads/media/2022/SCLG00010-1__208936509.jpeg","is_returnable":"0","is_cancelable":"0","cancelable_till":"","indicator":"0","other_images":[],"video_type":"","video":"","tags":["coins"],"warranty_period":"","guarantee_period":"","made_in":"","availability":null,"category_name":"Silver","tax_percentage":"3","standouts":[],"price_break":[],"review_images":[],"attributes":[],"variants":[{"id":"188","product_id":"173","attribute_value_ids":"","attribute_set":"","price":"15000","special_price":"14500","sku":"","stock":null,"images":[],"availability":"","status":"1","date_added":"2022-07-08 15:24:57","variant_ids":"","attr_name":"","variant_values":"","swatche_type":"","swatche_value":"","images_md":[],"images_sm":[],"cart_count":"0","is_purchased":1}],"min_max_price":{"min_price":5000,"max_price":5000,"special_price":14500,"max_special_price":14500,"discount_in_percentage":-190},"deliverable_zipcodes_ids":null,"is_deliverable":false,"is_purchased":true,"is_favorite":0,"image_md":"https://developmentalphawizz.com/attica_gold/uploads/media/2022/SCLG00010-1__208936509.jpeg","image_sm":"https://developmentalphawizz.com/attica_gold/uploads/media/2022/SCLG00010-1__208936509.jpeg","other_images_sm":[],"other_images_md":[],"variant_attributes":[]}]
//
// ProductsModel productsModelFromJson(String str) => ProductsModel.fromJson(json.decode(str));
// String productsModelToJson(ProductsModel data) => json.encode(data.toJson());
// class ProductsModel {
//   ProductsModel({
//       bool? error,
//       String? message,
//       String? minPrice,
//       String? maxPrice,
//       dynamic search,
//       List<dynamic>? filters,
//       List<String>? tags,
//       String? total,
//       String? offset,
//       List<Product>? product,}){
//     _error = error;
//     _message = message;
//     _minPrice = minPrice;
//     _maxPrice = maxPrice;
//     _search = search;
//     _filters = filters;
//     _tags = tags;
//     _total = total;
//     _offset = offset;
//     _product = product;
// }
//
//   ProductsModel.fromJson(dynamic json) {
//     _error = json['error'];
//     _message = json['message'];
//     _minPrice = json['min_price'];
//     _maxPrice = json['max_price'];
//     _search = json['search'];
//     if (json['filters'] != null) {
//       _filters = [];
//       json['filters'].forEach((v) {
//         _filters?.add(v.fromJson(v));
//       });
//     }
//     _tags = json['tags'] != null ? json['tags'].cast<String>() : [];
//     _total = json['total'];
//     _offset = json['offset'];
//     if (json['product'] != null) {
//       _product = [];
//       json['product'].forEach((v) {
//         _product?.add(Product.fromJson(v));
//       });
//     }
//   }
//   bool? _error;
//   String? _message;
//   String? _minPrice;
//   String? _maxPrice;
//   dynamic _search;
//   List<dynamic>? _filters;
//   List<String>? _tags;
//   String? _total;
//   String? _offset;
//   List<Product>? _product;
// ProductsModel copyWith({  bool? error,
//   String? message,
//   String? minPrice,
//   String? maxPrice,
//   dynamic search,
//   List<dynamic>? filters,
//   List<String>? tags,
//   String? total,
//   String? offset,
//   List<Product>? product,
// }) => ProductsModel(  error: error ?? _error,
//   message: message ?? _message,
//   minPrice: minPrice ?? _minPrice,
//   maxPrice: maxPrice ?? _maxPrice,
//   search: search ?? _search,
//   filters: filters ?? _filters,
//   tags: tags ?? _tags,
//   total: total ?? _total,
//   offset: offset ?? _offset,
//   product: product ?? _product,
// );
//   bool? get error => _error;
//   String? get message => _message;
//   String? get minPrice => _minPrice;
//   String? get maxPrice => _maxPrice;
//   dynamic get search => _search;
//   List<dynamic>? get filters => _filters;
//   List<String>? get tags => _tags;
//   String? get total => _total;
//   String? get offset => _offset;
//   List<Product>? get product => _product;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['error'] = _error;
//     map['message'] = _message;
//     map['min_price'] = _minPrice;
//     map['max_price'] = _maxPrice;
//     map['search'] = _search;
//     if (_filters != null) {
//       map['filters'] = _filters?.map((v) => v.toJson()).toList();
//     }
//     map['tags'] = _tags;
//     map['total'] = _total;
//     map['offset'] = _offset;
//     if (_product != null) {
//       map['product'] = _product?.map((v) => v.toJson()).toList();
//     }
//     return map;
//   }
//
// }
//
// /// total : "6"
// /// sales : "1"
// /// stock_type : null
// /// is_prices_inclusive_tax : "1"
// /// sizes : []
// /// size_info : ""
// /// standout : ""
// /// type : "simple_product"
// /// attr_value_ids : ""
// /// seller_rating : "3.2"
// /// seller_slug : "alpha-shop"
// /// seller_no_of_ratings : "6"
// /// seller_profile : "https://developmentalphawizz.com/attica_gold/uploads/seller/download_(82)1.jpg"
// /// store_name : "Alpha Shop"
// /// store_description : "Alpha has introduced a new strapline"
// /// seller_id : "1"
// /// seller_name : null
// /// id : "173"
// /// stock : null
// /// name : "Silver Coin"
// /// category_id : "55"
// /// sub_category_id : "71"
// /// short_description : "Silver Coin"
// /// price : "5000"
// /// weight : "10"
// /// slug : "silver-coin"
// /// description : ""
// /// total_allowed_quantity : null
// /// deliverable_type : "1"
// /// deliverable_zipcodes : null
// /// minimum_order_quantity : "1"
// /// quantity_step_size : "1"
// /// cod_allowed : "1"
// /// row_order : "0"
// /// rating : "0"
// /// no_of_ratings : "0"
// /// image : "https://developmentalphawizz.com/attica_gold/uploads/media/2022/SCLG00010-1__208936509.jpeg"
// /// is_returnable : "0"
// /// is_cancelable : "0"
// /// cancelable_till : ""
// /// indicator : "0"
// /// other_images : []
// /// video_type : ""
// /// video : ""
// /// tags : ["coins"]
// /// warranty_period : ""
// /// guarantee_period : ""
// /// made_in : ""
// /// availability : null
// /// category_name : "Silver"
// /// tax_percentage : "3"
// /// standouts : []
// /// price_break : []
// /// review_images : []
// /// attributes : []
// /// variants : [{"id":"188","product_id":"173","attribute_value_ids":"","attribute_set":"","price":"15000","special_price":"14500","sku":"","stock":null,"images":[],"availability":"","status":"1","date_added":"2022-07-08 15:24:57","variant_ids":"","attr_name":"","variant_values":"","swatche_type":"","swatche_value":"","images_md":[],"images_sm":[],"cart_count":"0","is_purchased":1}]
// /// min_max_price : {"min_price":5000,"max_price":5000,"special_price":14500,"max_special_price":14500,"discount_in_percentage":-190}
// /// deliverable_zipcodes_ids : null
// /// is_deliverable : false
// /// is_purchased : true
// /// is_favorite : 0
// /// image_md : "https://developmentalphawizz.com/attica_gold/uploads/media/2022/SCLG00010-1__208936509.jpeg"
// /// image_sm : "https://developmentalphawizz.com/attica_gold/uploads/media/2022/SCLG00010-1__208936509.jpeg"
// /// other_images_sm : []
// /// other_images_md : []
// /// variant_attributes : []
//
// Product productFromJson(String str) => Product.fromJson(json.decode(str));
// String productToJson(Product data) => json.encode(data.toJson());
// class Product {
//   Product({
//       String? total,
//       String? sales,
//       dynamic stockType,
//       String? isPricesInclusiveTax,
//       List<dynamic>? sizes,
//       String? sizeInfo,
//       String? standout,
//       String? type,
//       String? attrValueIds,
//       String? sellerRating,
//       String? sellerSlug,
//       String? sellerNoOfRatings,
//       String? sellerProfile,
//       String? storeName,
//       String? storeDescription,
//       String? sellerId,
//       dynamic sellerName,
//       String? id,
//       dynamic stock,
//       String? name,
//       String? categoryId,
//       String? subCategoryId,
//       String? shortDescription,
//       String? price,
//       String? weight,
//       String? slug,
//       String? description,
//       dynamic totalAllowedQuantity,
//       String? deliverableType,
//       dynamic deliverableZipcodes,
//       String? minimumOrderQuantity,
//       String? quantityStepSize,
//       String? codAllowed,
//       String? rowOrder,
//       String? rating,
//       String? noOfRatings,
//       String? image,
//       String? isReturnable,
//       String? isCancelable,
//       String? cancelableTill,
//       String? indicator,
//       List<dynamic>? otherImages,
//       String? videoType,
//       String? video,
//       List<String>? tags,
//       String? warrantyPeriod,
//       String? guaranteePeriod,
//       String? madeIn,
//       dynamic availability,
//       String? categoryName,
//       String? taxPercentage,
//       List<dynamic>? standouts,
//       List<dynamic>? priceBreak,
//       List<dynamic>? reviewImages,
//       List<dynamic>? attributes,
//       List<Variants>? variants,
//       MinMaxPrice? minMaxPrice,
//       dynamic deliverableZipcodesIds,
//       bool? isDeliverable,
//       bool? isPurchased,
//       num? isFavorite,
//       String? imageMd,
//       String? imageSm,
//       List<dynamic>? otherImagesSm,
//       List<dynamic>? otherImagesMd,
//       List<dynamic>? variantAttributes,}){
//     _total = total;
//     _sales = sales;
//     _stockType = stockType;
//     _isPricesInclusiveTax = isPricesInclusiveTax;
//     _sizes = sizes;
//     _sizeInfo = sizeInfo;
//     _standout = standout;
//     _type = type;
//     _attrValueIds = attrValueIds;
//     _sellerRating = sellerRating;
//     _sellerSlug = sellerSlug;
//     _sellerNoOfRatings = sellerNoOfRatings;
//     _sellerProfile = sellerProfile;
//     _storeName = storeName;
//     _storeDescription = storeDescription;
//     _sellerId = sellerId;
//     _sellerName = sellerName;
//     _id = id;
//     _stock = stock;
//     _name = name;
//     _categoryId = categoryId;
//     _subCategoryId = subCategoryId;
//     _shortDescription = shortDescription;
//     _price = price;
//     _weight = weight;
//     _slug = slug;
//     _description = description;
//     _totalAllowedQuantity = totalAllowedQuantity;
//     _deliverableType = deliverableType;
//     _deliverableZipcodes = deliverableZipcodes;
//     _minimumOrderQuantity = minimumOrderQuantity;
//     _quantityStepSize = quantityStepSize;
//     _codAllowed = codAllowed;
//     _rowOrder = rowOrder;
//     _rating = rating;
//     _noOfRatings = noOfRatings;
//     _image = image;
//     _isReturnable = isReturnable;
//     _isCancelable = isCancelable;
//     _cancelableTill = cancelableTill;
//     _indicator = indicator;
//     _otherImages = otherImages;
//     _videoType = videoType;
//     _video = video;
//     _tags = tags;
//     _warrantyPeriod = warrantyPeriod;
//     _guaranteePeriod = guaranteePeriod;
//     _madeIn = madeIn;
//     _availability = availability;
//     _categoryName = categoryName;
//     _taxPercentage = taxPercentage;
//     _standouts = standouts;
//     _priceBreak = priceBreak;
//     _reviewImages = reviewImages;
//     _attributes = attributes;
//     _variants = variants;
//     _minMaxPrice = minMaxPrice;
//     _deliverableZipcodesIds = deliverableZipcodesIds;
//     _isDeliverable = isDeliverable;
//     _isPurchased = isPurchased;
//     _isFavorite = isFavorite;
//     _imageMd = imageMd;
//     _imageSm = imageSm;
//     _otherImagesSm = otherImagesSm;
//     _otherImagesMd = otherImagesMd;
//     _variantAttributes = variantAttributes;
// }
//
//   Product.fromJson(dynamic json) {
//     _total = json['total'];
//     _sales = json['sales'];
//     _stockType = json['stock_type'];
//     _isPricesInclusiveTax = json['is_prices_inclusive_tax'];
//     // if (json['sizes'] != null) {
//     //   _sizes = [];
//     //   json['sizes'].forEach((v) {
//     //     _sizes?.add(v.fromJson(v));
//     //   });
//     // }
//     _sizeInfo = json['size_info'];
//     _standout = json['standout'];
//     _type = json['type'];
//     _attrValueIds = json['attr_value_ids'];
//     _sellerRating = json['seller_rating'];
//     _sellerSlug = json['seller_slug'];
//     _sellerNoOfRatings = json['seller_no_of_ratings'];
//     _sellerProfile = json['seller_profile'];
//     _storeName = json['store_name'];
//     _storeDescription = json['store_description'];
//     _sellerId = json['seller_id'];
//     _sellerName = json['seller_name'];
//     _id = json['id'];
//     _stock = json['stock'];
//     _name = json['name'];
//     _categoryId = json['category_id'];
//     _subCategoryId = json['sub_category_id'];
//     _shortDescription = json['short_description'];
//     _price = json['price'];
//     _weight = json['weight'];
//     _slug = json['slug'];
//     _description = json['description'];
//     _totalAllowedQuantity = json['total_allowed_quantity'];
//     _deliverableType = json['deliverable_type'];
//     _deliverableZipcodes = json['deliverable_zipcodes'];
//     _minimumOrderQuantity = json['minimum_order_quantity'];
//     _quantityStepSize = json['quantity_step_size'];
//     _codAllowed = json['cod_allowed'];
//     _rowOrder = json['row_order'];
//     _rating = json['rating'];
//     _noOfRatings = json['no_of_ratings'];
//     _image = json['image'];
//     _isReturnable = json['is_returnable'];
//     _isCancelable = json['is_cancelable'];
//     _cancelableTill = json['cancelable_till'];
//     _indicator = json['indicator'];
//     // if (json['other_images'] != null) {
//     //   _otherImages = [];
//     //   json['other_images'].forEach((v) {
//     //     _otherImages?.add(v.fromJson(v));
//     //   });
//     // }
//     _videoType = json['video_type'];
//     _video = json['video'];
//     _tags = json['tags'] != null ? json['tags'].cast<String>() : [];
//     _warrantyPeriod = json['warranty_period'];
//     _guaranteePeriod = json['guarantee_period'];
//     _madeIn = json['made_in'];
//     _availability = json['availability'];
//     _categoryName = json['category_name'];
//     _taxPercentage = json['tax_percentage'];
//     // if (json['standouts'] != null) {
//     //   _standouts = [];
//     //   json['standouts'].forEach((v) {
//     //     _standouts?.add(v.fromJson(v));
//     //   });
//     // }
//     // if (json['price_break'] != null) {
//     //   _priceBreak = [];
//     //   json['price_break'].forEach((v) {
//     //     _priceBreak?.add(v.fromJson(v));
//     //   });
//     // }
//     if (json['review_images'] != null) {
//       _reviewImages = [];
//       json['review_images'].forEach((v) {
//         _reviewImages?.add(v.fromJson(v));
//       });
//     }
//     if (json['attributes'] != null) {
//       _attributes = [];
//       json['attributes'].forEach((v) {
//         _attributes?.add(v.fromJson(v));
//       });
//     }
//     if (json['variants'] != null) {
//       _variants = [];
//       json['variants'].forEach((v) {
//         _variants?.add(Variants.fromJson(v));
//       });
//     }
//     _minMaxPrice = json['min_max_price'] != null ? MinMaxPrice.fromJson(json['min_max_price']) : null;
//     _deliverableZipcodesIds = json['deliverable_zipcodes_ids'];
//     _isDeliverable = json['is_deliverable'];
//     _isPurchased = json['is_purchased'];
//     _isFavorite = json['is_favorite'];
//     _imageMd = json['image_md'];
//     _imageSm = json['image_sm'];
//     if (json['other_images_sm'] != null) {
//       _otherImagesSm = [];
//       json['other_images_sm'].forEach((v) {
//         _otherImagesSm?.add(v.fromJson(v));
//       });
//     }
//     if (json['other_images_md'] != null) {
//       _otherImagesMd = [];
//       json['other_images_md'].forEach((v) {
//         _otherImagesMd?.add(v.fromJson(v));
//       });
//     }
//     if (json['variant_attributes'] != null) {
//       _variantAttributes = [];
//       json['variant_attributes'].forEach((v) {
//         _variantAttributes?.add(v.fromJson(v));
//       });
//     }
//   }
//   String? _total;
//   String? _sales;
//   dynamic _stockType;
//   String? _isPricesInclusiveTax;
//   List<dynamic>? _sizes;
//   String? _sizeInfo;
//   String? _standout;
//   String? _type;
//   String? _attrValueIds;
//   String? _sellerRating;
//   String? _sellerSlug;
//   String? _sellerNoOfRatings;
//   String? _sellerProfile;
//   String? _storeName;
//   String? _storeDescription;
//   String? _sellerId;
//   dynamic _sellerName;
//   String? _id;
//   dynamic _stock;
//   String? _name;
//   String? _categoryId;
//   String? _subCategoryId;
//   String? _shortDescription;
//   String? _price;
//   String? _weight;
//   String? _slug;
//   String? _description;
//   dynamic _totalAllowedQuantity;
//   String? _deliverableType;
//   dynamic _deliverableZipcodes;
//   String? _minimumOrderQuantity;
//   String? _quantityStepSize;
//   String? _codAllowed;
//   String? _rowOrder;
//   String? _rating;
//   String? _noOfRatings;
//   String? _image;
//   String? _isReturnable;
//   String? _isCancelable;
//   String? _cancelableTill;
//   String? _indicator;
//   List<dynamic>? _otherImages;
//   String? _videoType;
//   String? _video;
//   List<String>? _tags;
//   String? _warrantyPeriod;
//   String? _guaranteePeriod;
//   String? _madeIn;
//   dynamic _availability;
//   String? _categoryName;
//   String? _taxPercentage;
//   List<dynamic>? _standouts;
//   List<dynamic>? _priceBreak;
//   List<dynamic>? _reviewImages;
//   List<dynamic>? _attributes;
//   List<Variants>? _variants;
//   MinMaxPrice? _minMaxPrice;
//   dynamic _deliverableZipcodesIds;
//   bool? _isDeliverable;
//   bool? _isPurchased;
//   num? _isFavorite;
//   String? _imageMd;
//   String? _imageSm;
//   List<dynamic>? _otherImagesSm;
//   List<dynamic>? _otherImagesMd;
//   List<dynamic>? _variantAttributes;
// Product copyWith({  String? total,
//   String? sales,
//   dynamic stockType,
//   String? isPricesInclusiveTax,
//   List<dynamic>? sizes,
//   String? sizeInfo,
//   String? standout,
//   String? type,
//   String? attrValueIds,
//   String? sellerRating,
//   String? sellerSlug,
//   String? sellerNoOfRatings,
//   String? sellerProfile,
//   String? storeName,
//   String? storeDescription,
//   String? sellerId,
//   dynamic sellerName,
//   String? id,
//   dynamic stock,
//   String? name,
//   String? categoryId,
//   String? subCategoryId,
//   String? shortDescription,
//   String? price,
//   String? weight,
//   String? slug,
//   String? description,
//   dynamic totalAllowedQuantity,
//   String? deliverableType,
//   dynamic deliverableZipcodes,
//   String? minimumOrderQuantity,
//   String? quantityStepSize,
//   String? codAllowed,
//   String? rowOrder,
//   String? rating,
//   String? noOfRatings,
//   String? image,
//   String? isReturnable,
//   String? isCancelable,
//   String? cancelableTill,
//   String? indicator,
//   List<dynamic>? otherImages,
//   String? videoType,
//   String? video,
//   List<String>? tags,
//   String? warrantyPeriod,
//   String? guaranteePeriod,
//   String? madeIn,
//   dynamic availability,
//   String? categoryName,
//   String? taxPercentage,
//   List<dynamic>? standouts,
//   List<dynamic>? priceBreak,
//   List<dynamic>? reviewImages,
//   List<dynamic>? attributes,
//   List<Variants>? variants,
//   MinMaxPrice? minMaxPrice,
//   dynamic deliverableZipcodesIds,
//   bool? isDeliverable,
//   bool? isPurchased,
//   num? isFavorite,
//   String? imageMd,
//   String? imageSm,
//   List<dynamic>? otherImagesSm,
//   List<dynamic>? otherImagesMd,
//   List<dynamic>? variantAttributes,
// }) => Product(  total: total ?? _total,
//   sales: sales ?? _sales,
//   stockType: stockType ?? _stockType,
//   isPricesInclusiveTax: isPricesInclusiveTax ?? _isPricesInclusiveTax,
//   sizes: sizes ?? _sizes,
//   sizeInfo: sizeInfo ?? _sizeInfo,
//   standout: standout ?? _standout,
//   type: type ?? _type,
//   attrValueIds: attrValueIds ?? _attrValueIds,
//   sellerRating: sellerRating ?? _sellerRating,
//   sellerSlug: sellerSlug ?? _sellerSlug,
//   sellerNoOfRatings: sellerNoOfRatings ?? _sellerNoOfRatings,
//   sellerProfile: sellerProfile ?? _sellerProfile,
//   storeName: storeName ?? _storeName,
//   storeDescription: storeDescription ?? _storeDescription,
//   sellerId: sellerId ?? _sellerId,
//   sellerName: sellerName ?? _sellerName,
//   id: id ?? _id,
//   stock: stock ?? _stock,
//   name: name ?? _name,
//   categoryId: categoryId ?? _categoryId,
//   subCategoryId: subCategoryId ?? _subCategoryId,
//   shortDescription: shortDescription ?? _shortDescription,
//   price: price ?? _price,
//   weight: weight ?? _weight,
//   slug: slug ?? _slug,
//   description: description ?? _description,
//   totalAllowedQuantity: totalAllowedQuantity ?? _totalAllowedQuantity,
//   deliverableType: deliverableType ?? _deliverableType,
//   deliverableZipcodes: deliverableZipcodes ?? _deliverableZipcodes,
//   minimumOrderQuantity: minimumOrderQuantity ?? _minimumOrderQuantity,
//   quantityStepSize: quantityStepSize ?? _quantityStepSize,
//   codAllowed: codAllowed ?? _codAllowed,
//   rowOrder: rowOrder ?? _rowOrder,
//   rating: rating ?? _rating,
//   noOfRatings: noOfRatings ?? _noOfRatings,
//   image: image ?? _image,
//   isReturnable: isReturnable ?? _isReturnable,
//   isCancelable: isCancelable ?? _isCancelable,
//   cancelableTill: cancelableTill ?? _cancelableTill,
//   indicator: indicator ?? _indicator,
//   otherImages: otherImages ?? _otherImages,
//   videoType: videoType ?? _videoType,
//   video: video ?? _video,
//   tags: tags ?? _tags,
//   warrantyPeriod: warrantyPeriod ?? _warrantyPeriod,
//   guaranteePeriod: guaranteePeriod ?? _guaranteePeriod,
//   madeIn: madeIn ?? _madeIn,
//   availability: availability ?? _availability,
//   categoryName: categoryName ?? _categoryName,
//   taxPercentage: taxPercentage ?? _taxPercentage,
//   standouts: standouts ?? _standouts,
//   priceBreak: priceBreak ?? _priceBreak,
//   reviewImages: reviewImages ?? _reviewImages,
//   attributes: attributes ?? _attributes,
//   variants: variants ?? _variants,
//   minMaxPrice: minMaxPrice ?? _minMaxPrice,
//   deliverableZipcodesIds: deliverableZipcodesIds ?? _deliverableZipcodesIds,
//   isDeliverable: isDeliverable ?? _isDeliverable,
//   isPurchased: isPurchased ?? _isPurchased,
//   isFavorite: isFavorite ?? _isFavorite,
//   imageMd: imageMd ?? _imageMd,
//   imageSm: imageSm ?? _imageSm,
//   otherImagesSm: otherImagesSm ?? _otherImagesSm,
//   otherImagesMd: otherImagesMd ?? _otherImagesMd,
//   variantAttributes: variantAttributes ?? _variantAttributes,
// );
//   String? get total => _total;
//   String? get sales => _sales;
//   dynamic get stockType => _stockType;
//   String? get isPricesInclusiveTax => _isPricesInclusiveTax;
//   List<dynamic>? get sizes => _sizes;
//   String? get sizeInfo => _sizeInfo;
//   String? get standout => _standout;
//   String? get type => _type;
//   String? get attrValueIds => _attrValueIds;
//   String? get sellerRating => _sellerRating;
//   String? get sellerSlug => _sellerSlug;
//   String? get sellerNoOfRatings => _sellerNoOfRatings;
//   String? get sellerProfile => _sellerProfile;
//   String? get storeName => _storeName;
//   String? get storeDescription => _storeDescription;
//   String? get sellerId => _sellerId;
//   dynamic get sellerName => _sellerName;
//   String? get id => _id;
//   dynamic get stock => _stock;
//   String? get name => _name;
//   String? get categoryId => _categoryId;
//   String? get subCategoryId => _subCategoryId;
//   String? get shortDescription => _shortDescription;
//   String? get price => _price;
//   String? get weight => _weight;
//   String? get slug => _slug;
//   String? get description => _description;
//   dynamic get totalAllowedQuantity => _totalAllowedQuantity;
//   String? get deliverableType => _deliverableType;
//   dynamic get deliverableZipcodes => _deliverableZipcodes;
//   String? get minimumOrderQuantity => _minimumOrderQuantity;
//   String? get quantityStepSize => _quantityStepSize;
//   String? get codAllowed => _codAllowed;
//   String? get rowOrder => _rowOrder;
//   String? get rating => _rating;
//   String? get noOfRatings => _noOfRatings;
//   String? get image => _image;
//   String? get isReturnable => _isReturnable;
//   String? get isCancelable => _isCancelable;
//   String? get cancelableTill => _cancelableTill;
//   String? get indicator => _indicator;
//   List<dynamic>? get otherImages => _otherImages;
//   String? get videoType => _videoType;
//   String? get video => _video;
//   List<String>? get tags => _tags;
//   String? get warrantyPeriod => _warrantyPeriod;
//   String? get guaranteePeriod => _guaranteePeriod;
//   String? get madeIn => _madeIn;
//   dynamic get availability => _availability;
//   String? get categoryName => _categoryName;
//   String? get taxPercentage => _taxPercentage;
//   List<dynamic>? get standouts => _standouts;
//   List<dynamic>? get priceBreak => _priceBreak;
//   List<dynamic>? get reviewImages => _reviewImages;
//   List<dynamic>? get attributes => _attributes;
//   List<Variants>? get variants => _variants;
//   MinMaxPrice? get minMaxPrice => _minMaxPrice;
//   dynamic get deliverableZipcodesIds => _deliverableZipcodesIds;
//   bool? get isDeliverable => _isDeliverable;
//   bool? get isPurchased => _isPurchased;
//   num? get isFavorite => _isFavorite;
//   String? get imageMd => _imageMd;
//   String? get imageSm => _imageSm;
//   List<dynamic>? get otherImagesSm => _otherImagesSm;
//   List<dynamic>? get otherImagesMd => _otherImagesMd;
//   List<dynamic>? get variantAttributes => _variantAttributes;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['total'] = _total;
//     map['sales'] = _sales;
//     map['stock_type'] = _stockType;
//     map['is_prices_inclusive_tax'] = _isPricesInclusiveTax;
//     if (_sizes != null) {
//       map['sizes'] = _sizes?.map((v) => v.toJson()).toList();
//     }
//     map['size_info'] = _sizeInfo;
//     map['standout'] = _standout;
//     map['type'] = _type;
//     map['attr_value_ids'] = _attrValueIds;
//     map['seller_rating'] = _sellerRating;
//     map['seller_slug'] = _sellerSlug;
//     map['seller_no_of_ratings'] = _sellerNoOfRatings;
//     map['seller_profile'] = _sellerProfile;
//     map['store_name'] = _storeName;
//     map['store_description'] = _storeDescription;
//     map['seller_id'] = _sellerId;
//     map['seller_name'] = _sellerName;
//     map['id'] = _id;
//     map['stock'] = _stock;
//     map['name'] = _name;
//     map['category_id'] = _categoryId;
//     map['sub_category_id'] = _subCategoryId;
//     map['short_description'] = _shortDescription;
//     map['price'] = _price;
//     map['weight'] = _weight;
//     map['slug'] = _slug;
//     map['description'] = _description;
//     map['total_allowed_quantity'] = _totalAllowedQuantity;
//     map['deliverable_type'] = _deliverableType;
//     map['deliverable_zipcodes'] = _deliverableZipcodes;
//     map['minimum_order_quantity'] = _minimumOrderQuantity;
//     map['quantity_step_size'] = _quantityStepSize;
//     map['cod_allowed'] = _codAllowed;
//     map['row_order'] = _rowOrder;
//     map['rating'] = _rating;
//     map['no_of_ratings'] = _noOfRatings;
//     map['image'] = _image;
//     map['is_returnable'] = _isReturnable;
//     map['is_cancelable'] = _isCancelable;
//     map['cancelable_till'] = _cancelableTill;
//     map['indicator'] = _indicator;
//     if (_otherImages != null) {
//       map['other_images'] = _otherImages?.map((v) => v.toJson()).toList();
//     }
//     map['video_type'] = _videoType;
//     map['video'] = _video;
//     map['tags'] = _tags;
//     map['warranty_period'] = _warrantyPeriod;
//     map['guarantee_period'] = _guaranteePeriod;
//     map['made_in'] = _madeIn;
//     map['availability'] = _availability;
//     map['category_name'] = _categoryName;
//     map['tax_percentage'] = _taxPercentage;
//     if (_standouts != null) {
//       map['standouts'] = _standouts?.map((v) => v.toJson()).toList();
//     }
//     if (_priceBreak != null) {
//       map['price_break'] = _priceBreak?.map((v) => v.toJson()).toList();
//     }
//     if (_reviewImages != null) {
//       map['review_images'] = _reviewImages?.map((v) => v.toJson()).toList();
//     }
//     if (_attributes != null) {
//       map['attributes'] = _attributes?.map((v) => v.toJson()).toList();
//     }
//     if (_variants != null) {
//       map['variants'] = _variants?.map((v) => v.toJson()).toList();
//     }
//     if (_minMaxPrice != null) {
//       map['min_max_price'] = _minMaxPrice?.toJson();
//     }
//     map['deliverable_zipcodes_ids'] = _deliverableZipcodesIds;
//     map['is_deliverable'] = _isDeliverable;
//     map['is_purchased'] = _isPurchased;
//     map['is_favorite'] = _isFavorite;
//     map['image_md'] = _imageMd;
//     map['image_sm'] = _imageSm;
//     if (_otherImagesSm != null) {
//       map['other_images_sm'] = _otherImagesSm?.map((v) => v.toJson()).toList();
//     }
//     if (_otherImagesMd != null) {
//       map['other_images_md'] = _otherImagesMd?.map((v) => v.toJson()).toList();
//     }
//     if (_variantAttributes != null) {
//       map['variant_attributes'] = _variantAttributes?.map((v) => v.toJson()).toList();
//     }
//     return map;
//   }
//
// }
//
// /// min_price : 5000
// /// max_price : 5000
// /// special_price : 14500
// /// max_special_price : 14500
// /// discount_in_percentage : -190
//
// MinMaxPrice minMaxPriceFromJson(String str) => MinMaxPrice.fromJson(json.decode(str));
// String minMaxPriceToJson(MinMaxPrice data) => json.encode(data.toJson());
// class MinMaxPrice {
//   MinMaxPrice({
//       num? minPrice,
//       num? maxPrice,
//       num? specialPrice,
//       num? maxSpecialPrice,
//       num? discountInPercentage,}){
//     _minPrice = minPrice;
//     _maxPrice = maxPrice;
//     _specialPrice = specialPrice;
//     _maxSpecialPrice = maxSpecialPrice;
//     _discountInPercentage = discountInPercentage;
// }
//
//   MinMaxPrice.fromJson(dynamic json) {
//     _minPrice = json['min_price'];
//     _maxPrice = json['max_price'];
//     _specialPrice = json['special_price'];
//     _maxSpecialPrice = json['max_special_price'];
//     _discountInPercentage = json['discount_in_percentage'];
//   }
//   num? _minPrice;
//   num? _maxPrice;
//   num? _specialPrice;
//   num? _maxSpecialPrice;
//   num? _discountInPercentage;
// MinMaxPrice copyWith({  num? minPrice,
//   num? maxPrice,
//   num? specialPrice,
//   num? maxSpecialPrice,
//   num? discountInPercentage,
// }) => MinMaxPrice(  minPrice: minPrice ?? _minPrice,
//   maxPrice: maxPrice ?? _maxPrice,
//   specialPrice: specialPrice ?? _specialPrice,
//   maxSpecialPrice: maxSpecialPrice ?? _maxSpecialPrice,
//   discountInPercentage: discountInPercentage ?? _discountInPercentage,
// );
//   num? get minPrice => _minPrice;
//   num? get maxPrice => _maxPrice;
//   num? get specialPrice => _specialPrice;
//   num? get maxSpecialPrice => _maxSpecialPrice;
//   num? get discountInPercentage => _discountInPercentage;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['min_price'] = _minPrice;
//     map['max_price'] = _maxPrice;
//     map['special_price'] = _specialPrice;
//     map['max_special_price'] = _maxSpecialPrice;
//     map['discount_in_percentage'] = _discountInPercentage;
//     return map;
//   }
//
// }
//
// /// id : "188"
// /// product_id : "173"
// /// attribute_value_ids : ""
// /// attribute_set : ""
// /// price : "15000"
// /// special_price : "14500"
// /// sku : ""
// /// stock : null
// /// images : []
// /// availability : ""
// /// status : "1"
// /// date_added : "2022-07-08 15:24:57"
// /// variant_ids : ""
// /// attr_name : ""
// /// variant_values : ""
// /// swatche_type : ""
// /// swatche_value : ""
// /// images_md : []
// /// images_sm : []
// /// cart_count : "0"
// /// is_purchased : 1
//
// Variants variantsFromJson(String str) => Variants.fromJson(json.decode(str));
// String variantsToJson(Variants data) => json.encode(data.toJson());
// class Variants {
//   Variants({
//       String? id,
//       String? productId,
//       String? attributeValueIds,
//       String? attributeSet,
//       String? price,
//       String? specialPrice,
//       String? sku,
//       dynamic stock,
//       List<dynamic>? images,
//       String? availability,
//       String? status,
//       String? dateAdded,
//       String? variantIds,
//       String? attrName,
//       String? variantValues,
//       String? swatcheType,
//       String? swatcheValue,
//       List<dynamic>? imagesMd,
//       List<dynamic>? imagesSm,
//       String? cartCount,
//       num? isPurchased,}){
//     _id = id;
//     _productId = productId;
//     _attributeValueIds = attributeValueIds;
//     _attributeSet = attributeSet;
//     _price = price;
//     _specialPrice = specialPrice;
//     _sku = sku;
//     _stock = stock;
//     _images = images;
//     _availability = availability;
//     _status = status;
//     _dateAdded = dateAdded;
//     _variantIds = variantIds;
//     _attrName = attrName;
//     _variantValues = variantValues;
//     _swatcheType = swatcheType;
//     _swatcheValue = swatcheValue;
//     _imagesMd = imagesMd;
//     _imagesSm = imagesSm;
//     _cartCount = cartCount;
//     _isPurchased = isPurchased;
// }
//
//   Variants.fromJson(dynamic json) {
//     _id = json['id'];
//     _productId = json['product_id'];
//     _attributeValueIds = json['attribute_value_ids'];
//     _attributeSet = json['attribute_set'];
//     _price = json['price'];
//     _specialPrice = json['special_price'];
//     _sku = json['sku'];
//     _stock = json['stock'];
//     if (json['images'] != null) {
//       _images = [];
//       json['images'].forEach((v) {
//         _images?.add(v.fromJson(v));
//       });
//     }
//     _availability = json['availability'];
//     _status = json['status'];
//     _dateAdded = json['date_added'];
//     _variantIds = json['variant_ids'];
//     _attrName = json['attr_name'];
//     _variantValues = json['variant_values'];
//     _swatcheType = json['swatche_type'];
//     _swatcheValue = json['swatche_value'];
//     if (json['images_md'] != null) {
//       _imagesMd = [];
//       json['images_md'].forEach((v) {
//         _imagesMd?.add(v.fromJson(v));
//       });
//     }
//     if (json['images_sm'] != null) {
//       _imagesSm = [];
//       json['images_sm'].forEach((v) {
//         _imagesSm?.add(v.fromJson(v));
//       });
//     }
//     _cartCount = json['cart_count'];
//     _isPurchased = json['is_purchased'];
//   }
//   String? _id;
//   String? _productId;
//   String? _attributeValueIds;
//   String? _attributeSet;
//   String? _price;
//   String? _specialPrice;
//   String? _sku;
//   dynamic _stock;
//   List<dynamic>? _images;
//   String? _availability;
//   String? _status;
//   String? _dateAdded;
//   String? _variantIds;
//   String? _attrName;
//   String? _variantValues;
//   String? _swatcheType;
//   String? _swatcheValue;
//   List<dynamic>? _imagesMd;
//   List<dynamic>? _imagesSm;
//   String? _cartCount;
//   num? _isPurchased;
// Variants copyWith({  String? id,
//   String? productId,
//   String? attributeValueIds,
//   String? attributeSet,
//   String? price,
//   String? specialPrice,
//   String? sku,
//   dynamic stock,
//   List<dynamic>? images,
//   String? availability,
//   String? status,
//   String? dateAdded,
//   String? variantIds,
//   String? attrName,
//   String? variantValues,
//   String? swatcheType,
//   String? swatcheValue,
//   List<dynamic>? imagesMd,
//   List<dynamic>? imagesSm,
//   String? cartCount,
//   num? isPurchased,
// }) => Variants(  id: id ?? _id,
//   productId: productId ?? _productId,
//   attributeValueIds: attributeValueIds ?? _attributeValueIds,
//   attributeSet: attributeSet ?? _attributeSet,
//   price: price ?? _price,
//   specialPrice: specialPrice ?? _specialPrice,
//   sku: sku ?? _sku,
//   stock: stock ?? _stock,
//   images: images ?? _images,
//   availability: availability ?? _availability,
//   status: status ?? _status,
//   dateAdded: dateAdded ?? _dateAdded,
//   variantIds: variantIds ?? _variantIds,
//   attrName: attrName ?? _attrName,
//   variantValues: variantValues ?? _variantValues,
//   swatcheType: swatcheType ?? _swatcheType,
//   swatcheValue: swatcheValue ?? _swatcheValue,
//   imagesMd: imagesMd ?? _imagesMd,
//   imagesSm: imagesSm ?? _imagesSm,
//   cartCount: cartCount ?? _cartCount,
//   isPurchased: isPurchased ?? _isPurchased,
// );
//   String? get id => _id;
//   String? get productId => _productId;
//   String? get attributeValueIds => _attributeValueIds;
//   String? get attributeSet => _attributeSet;
//   String? get price => _price;
//   String? get specialPrice => _specialPrice;
//   String? get sku => _sku;
//   dynamic get stock => _stock;
//   List<dynamic>? get images => _images;
//   String? get availability => _availability;
//   String? get status => _status;
//   String? get dateAdded => _dateAdded;
//   String? get variantIds => _variantIds;
//   String? get attrName => _attrName;
//   String? get variantValues => _variantValues;
//   String? get swatcheType => _swatcheType;
//   String? get swatcheValue => _swatcheValue;
//   List<dynamic>? get imagesMd => _imagesMd;
//   List<dynamic>? get imagesSm => _imagesSm;
//   String? get cartCount => _cartCount;
//   num? get isPurchased => _isPurchased;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = _id;
//     map['product_id'] = _productId;
//     map['attribute_value_ids'] = _attributeValueIds;
//     map['attribute_set'] = _attributeSet;
//     map['price'] = _price;
//     map['special_price'] = _specialPrice;
//     map['sku'] = _sku;
//     map['stock'] = _stock;
//     if (_images != null) {
//       map['images'] = _images?.map((v) => v.toJson()).toList();
//     }
//     map['availability'] = _availability;
//     map['status'] = _status;
//     map['date_added'] = _dateAdded;
//     map['variant_ids'] = _variantIds;
//     map['attr_name'] = _attrName;
//     map['variant_values'] = _variantValues;
//     map['swatche_type'] = _swatcheType;
//     map['swatche_value'] = _swatcheValue;
//     if (_imagesMd != null) {
//       map['images_md'] = _imagesMd?.map((v) => v.toJson()).toList();
//     }
//     if (_imagesSm != null) {
//       map['images_sm'] = _imagesSm?.map((v) => v.toJson()).toList();
//     }
//     map['cart_count'] = _cartCount;
//     map['is_purchased'] = _isPurchased;
//     return map;
//   }
//
// }

import 'dart:convert';
/// error : false
/// message : "Products retrieved successfully !"
/// min_price : "44"
/// max_price : "49000"
/// search : null
/// filters : []
/// tags : ["Test Variation product"]
/// total : "1"
/// offset : "0"
/// product : [{"total":"14","sales":"1","stock_type":null,"is_prices_inclusive_tax":"1","sizes":["5","6","7"],"size_info":"","standout":"","type":"simple_product","attr_value_ids":"","seller_rating":"3.2","seller_slug":"alpha-shop","seller_no_of_ratings":"6","seller_profile":"https://developmentalphawizz.com/attica_gold/uploads/seller/download_(82)1.jpg","store_name":"Alpha Shop","store_description":"Alpha has introduced a new strapline","seller_id":"1","seller_name":null,"id":"193","stock":null,"name":"Test Variation product","category_id":"54","sub_category_id":"63","short_description":"Test Variation product","price":"","weight":"10","slug":"test-variation-product-1","description":"<p>sdfasd fasdfasdfasdf</p>","total_allowed_quantity":"4","deliverable_type":"1","deliverable_zipcodes":null,"minimum_order_quantity":"1","quantity_step_size":"1","cod_allowed":"0","row_order":"0","rating":"0","no_of_ratings":"0","image":"https://developmentalphawizz.com/attica_gold/uploads/media/2022/Chain.jpeg","is_returnable":"0","is_cancelable":"0","cancelable_till":"","indicator":"0","other_images":["https://developmentalphawizz.com/attica_gold/uploads/media/2022/images_(1).jpg","https://developmentalphawizz.com/attica_gold/uploads/media/2022/DER019050.jpg"],"video_type":"","video":"","tags":["Test Variation product"],"warranty_period":"","guarantee_period":"","made_in":"India","availability":null,"category_name":"Gold","tax_percentage":"3","standouts":[],"price_break":[{"title":"Gold","data":[{"component_type":"18 KT White Gold","rate":"5","unit":"gm","weight":"5","discount":""},{"component_type":"Making Charges","rate":"50","unit":"gm","weight":"18","discount":""}]},{"title":"Gemstone","data":[{"component_type":"SI IJ round - 7 No.s","rate":"6","unit":"gm","weight":"15","discount":"20"}]}],"review_images":[],"attributes":[],"variants":[{"id":"210","product_id":"193","attribute_value_ids":"","attribute_set":"","price":"500","special_price":"50","sku":"","stock":null,"images":[],"availability":"","status":"1","date_added":"2022-11-18 18:36:59","variant_ids":"","attr_name":"","variant_values":"","swatche_type":"","swatche_value":"","images_md":[],"images_sm":[],"cart_count":"0","is_purchased":0}],"min_max_price":{"min_price":0,"max_price":0,"special_price":50,"max_special_price":50,"discount_in_percentage":0},"deliverable_zipcodes_ids":null,"is_deliverable":false,"is_purchased":false,"is_favorite":0,"image_md":"https://developmentalphawizz.com/attica_gold/uploads/media/2022/Chain.jpeg","image_sm":"https://developmentalphawizz.com/attica_gold/uploads/media/2022/thumb-sm/Chain.jpeg","other_images_md":["https://developmentalphawizz.com/attica_gold/uploads/media/2022/images_(1).jpg","https://developmentalphawizz.com/attica_gold/uploads/media/2022/DER019050.jpg"],"other_images_sm":["https://developmentalphawizz.com/attica_gold/uploads/media/2022/images_(1).jpg","https://developmentalphawizz.com/attica_gold/uploads/media/2022/DER019050.jpg"],"variant_attributes":[]}]

ProductsModel productsModelFromJson(String str) => ProductsModel.fromJson(json.decode(str));
String productsModelToJson(ProductsModel data) => json.encode(data.toJson());
class ProductsModel {
  ProductsModel({
    bool? error,
    String? message,
    String? minPrice,
    String? maxPrice,
    dynamic search,
    List<dynamic>? filters,
    List<String>? tags,
    String? total,
    String? offset,
    List<Product>? product,}){
    _error = error;
    _message = message;
    _minPrice = minPrice;
    _maxPrice = maxPrice;
    _search = search;
    _filters = filters;
    _tags = tags;
    _total = total;
    _offset = offset;
    _product = product;
  }

  ProductsModel.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    _minPrice = json['min_price'];
    _maxPrice = json['max_price'];
    _search = json['search'];
    if (json['filters'] != null) {
      _filters = [];
      json['filters'].forEach((v) {
        _filters?.add(v.fromJson(v));
      });
    }
    _tags = json['tags'] != null ? json['tags'].cast<String>() : [];
    _total = json['total'];
    _offset = json['offset'];
    if (json['product'] != null) {
      _product = [];
      json['product'].forEach((v) {
        _product?.add(Product.fromJson(v));
      });
    }
  }
  bool? _error;
  String? _message;
  String? _minPrice;
  String? _maxPrice;
  dynamic _search;
  List<dynamic>? _filters;
  List<String>? _tags;
  String? _total;
  String? _offset;
  List<Product>? _product;
  ProductsModel copyWith({  bool? error,
    String? message,
    String? minPrice,
    String? maxPrice,
    dynamic search,
    List<dynamic>? filters,
    List<String>? tags,
    String? total,
    String? offset,
    List<Product>? product,
  }) => ProductsModel(  error: error ?? _error,
    message: message ?? _message,
    minPrice: minPrice ?? _minPrice,
    maxPrice: maxPrice ?? _maxPrice,
    search: search ?? _search,
    filters: filters ?? _filters,
    tags: tags ?? _tags,
    total: total ?? _total,
    offset: offset ?? _offset,
    product: product ?? _product,
  );
  bool? get error => _error;
  String? get message => _message;
  String? get minPrice => _minPrice;
  String? get maxPrice => _maxPrice;
  dynamic get search => _search;
  List<dynamic>? get filters => _filters;
  List<String>? get tags => _tags;
  String? get total => _total;
  String? get offset => _offset;
  List<Product>? get product => _product;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['error'] = _error;
    map['message'] = _message;
    map['min_price'] = _minPrice;
    map['max_price'] = _maxPrice;
    map['search'] = _search;
    if (_filters != null) {
      map['filters'] = _filters?.map((v) => v.toJson()).toList();
    }
    map['tags'] = _tags;
    map['total'] = _total;
    map['offset'] = _offset;
    if (_product != null) {
      map['product'] = _product?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// total : "14"
/// sales : "1"
/// stock_type : null
/// is_prices_inclusive_tax : "1"
/// sizes : ["5","6","7"]
/// size_info : ""
/// standout : ""
/// type : "simple_product"
/// attr_value_ids : ""
/// seller_rating : "3.2"
/// seller_slug : "alpha-shop"
/// seller_no_of_ratings : "6"
/// seller_profile : "https://developmentalphawizz.com/attica_gold/uploads/seller/download_(82)1.jpg"
/// store_name : "Alpha Shop"
/// store_description : "Alpha has introduced a new strapline"
/// seller_id : "1"
/// seller_name : null
/// id : "193"
/// stock : null
/// name : "Test Variation product"
/// category_id : "54"
/// sub_category_id : "63"
/// short_description : "Test Variation product"
/// price : ""
/// weight : "10"
/// slug : "test-variation-product-1"
/// description : "<p>sdfasd fasdfasdfasdf</p>"
/// total_allowed_quantity : "4"
/// deliverable_type : "1"
/// deliverable_zipcodes : null
/// minimum_order_quantity : "1"
/// quantity_step_size : "1"
/// cod_allowed : "0"
/// row_order : "0"
/// rating : "0"
/// no_of_ratings : "0"
/// image : "https://developmentalphawizz.com/attica_gold/uploads/media/2022/Chain.jpeg"
/// is_returnable : "0"
/// is_cancelable : "0"
/// cancelable_till : ""
/// indicator : "0"
/// other_images : ["https://developmentalphawizz.com/attica_gold/uploads/media/2022/images_(1).jpg","https://developmentalphawizz.com/attica_gold/uploads/media/2022/DER019050.jpg"]
/// video_type : ""
/// video : ""
/// tags : ["Test Variation product"]
/// warranty_period : ""
/// guarantee_period : ""
/// made_in : "India"
/// availability : null
/// category_name : "Gold"
/// tax_percentage : "3"
/// standouts : []
/// price_break : [{"title":"Gold","data":[{"component_type":"18 KT White Gold","rate":"5","unit":"gm","weight":"5","discount":""},{"component_type":"Making Charges","rate":"50","unit":"gm","weight":"18","discount":""}]},{"title":"Gemstone","data":[{"component_type":"SI IJ round - 7 No.s","rate":"6","unit":"gm","weight":"15","discount":"20"}]}]
/// review_images : []
/// attributes : []
/// variants : [{"id":"210","product_id":"193","attribute_value_ids":"","attribute_set":"","price":"500","special_price":"50","sku":"","stock":null,"images":[],"availability":"","status":"1","date_added":"2022-11-18 18:36:59","variant_ids":"","attr_name":"","variant_values":"","swatche_type":"","swatche_value":"","images_md":[],"images_sm":[],"cart_count":"0","is_purchased":0}]
/// min_max_price : {"min_price":0,"max_price":0,"special_price":50,"max_special_price":50,"discount_in_percentage":0}
/// deliverable_zipcodes_ids : null
/// is_deliverable : false
/// is_purchased : false
/// is_favorite : 0
/// image_md : "https://developmentalphawizz.com/attica_gold/uploads/media/2022/Chain.jpeg"
/// image_sm : "https://developmentalphawizz.com/attica_gold/uploads/media/2022/thumb-sm/Chain.jpeg"
/// other_images_md : ["https://developmentalphawizz.com/attica_gold/uploads/media/2022/images_(1).jpg","https://developmentalphawizz.com/attica_gold/uploads/media/2022/DER019050.jpg"]
/// other_images_sm : ["https://developmentalphawizz.com/attica_gold/uploads/media/2022/images_(1).jpg","https://developmentalphawizz.com/attica_gold/uploads/media/2022/DER019050.jpg"]
/// variant_attributes : []

Product productFromJson(String str) => Product.fromJson(json.decode(str));
String productToJson(Product data) => json.encode(data.toJson());
class Product {
  Product({
    String? total,
    String? sales,
    dynamic stockType,
    String? isPricesInclusiveTax,
    List<String>? sizes,
    String? sizeInfo,
    String? standout,
    String? type,
    String? attrValueIds,
    String? sellerRating,
    String? sellerSlug,
    String? sellerNoOfRatings,
    String? sellerProfile,
    String? storeName,
    String? storeDescription,
    String? sellerId,
    dynamic sellerName,
    String? id,
    dynamic stock,
    String? name,
    String? categoryId,
    String? subCategoryId,
    String? shortDescription,
    String? price,
    String? weight,
    String? slug,
    String? description,
    String? totalAllowedQuantity,
    String? deliverableType,
    dynamic deliverableZipcodes,
    String? minimumOrderQuantity,
    String? quantityStepSize,
    String? codAllowed,
    String? rowOrder,
    String? rating,
    String? noOfRatings,
    String? image,
    String? isReturnable,
    String? isCancelable,
    String? cancelableTill,
    String? indicator,
    List<String>? otherImages,
    String? videoType,
    String? video,
    List<String>? tags,
    String? warrantyPeriod,
    String? guaranteePeriod,
    String? madeIn,
    dynamic availability,
    String? categoryName,
    String? taxPercentage,
    List<Standouts>? standouts,
    List<PriceBreak>? priceBreak,
    List<dynamic>? reviewImages,
    List<dynamic>? attributes,
    List<Variants>? variants,
    MinMaxPrice? minMaxPrice,
    dynamic deliverableZipcodesIds,
    bool? isDeliverable,
    bool? isPurchased,
    int? isFavorite,
    String? imageMd,
    String? imageSm,
    List<String>? otherImagesMd,
    List<String>? otherImagesSm,
    List<dynamic>? variantAttributes,}){
    _total = total;
    _sales = sales;
    _stockType = stockType;
    _isPricesInclusiveTax = isPricesInclusiveTax;
    _sizes = sizes;
    _sizeInfo = sizeInfo;
    _standout = standout;
    _type = type;
    _attrValueIds = attrValueIds;
    _sellerRating = sellerRating;
    _sellerSlug = sellerSlug;
    _sellerNoOfRatings = sellerNoOfRatings;
    _sellerProfile = sellerProfile;
    _storeName = storeName;
    _storeDescription = storeDescription;
    _sellerId = sellerId;
    _sellerName = sellerName;
    _id = id;
    _stock = stock;
    _name = name;
    _categoryId = categoryId;
    _subCategoryId = subCategoryId;
    _shortDescription = shortDescription;
    _price = price;
    _weight = weight;
    _slug = slug;
    _description = description;
    _totalAllowedQuantity = totalAllowedQuantity;
    _deliverableType = deliverableType;
    _deliverableZipcodes = deliverableZipcodes;
    _minimumOrderQuantity = minimumOrderQuantity;
    _quantityStepSize = quantityStepSize;
    _codAllowed = codAllowed;
    _rowOrder = rowOrder;
    _rating = rating;
    _noOfRatings = noOfRatings;
    _image = image;
    _isReturnable = isReturnable;
    _isCancelable = isCancelable;
    _cancelableTill = cancelableTill;
    _indicator = indicator;
    _otherImages = otherImages;
    _videoType = videoType;
    _video = video;
    _tags = tags;
    _warrantyPeriod = warrantyPeriod;
    _guaranteePeriod = guaranteePeriod;
    _madeIn = madeIn;
    _availability = availability;
    _categoryName = categoryName;
    _taxPercentage = taxPercentage;
    _standouts = standouts;
    _priceBreak = priceBreak;
    _reviewImages = reviewImages;
    _attributes = attributes;
    _variants = variants;
    _minMaxPrice = minMaxPrice;
    _deliverableZipcodesIds = deliverableZipcodesIds;
    _isDeliverable = isDeliverable;
    _isPurchased = isPurchased;
    _isFavorite = isFavorite;
    _imageMd = imageMd;
    _imageSm = imageSm;
    _otherImagesMd = otherImagesMd;
    _otherImagesSm = otherImagesSm;
    _variantAttributes = variantAttributes;
  }

  Product.fromJson(dynamic json) {
    _total = json['total'];
    _sales = json['sales'];
    _stockType = json['stock_type'];
    _isPricesInclusiveTax = json['is_prices_inclusive_tax'];
    _sizes = json['sizes'] != null ? json['sizes'].cast<String>() : [];
    _sizeInfo = json['size_info'];
    _standout = json['standout'];
    _type = json['type'];
    _attrValueIds = json['attr_value_ids'];
    _sellerRating = json['seller_rating'];
    _sellerSlug = json['seller_slug'];
    _sellerNoOfRatings = json['seller_no_of_ratings'];
    _sellerProfile = json['seller_profile'];
    _storeName = json['store_name'];
    _storeDescription = json['store_description'];
    _sellerId = json['seller_id'];
    _sellerName = json['seller_name'];
    _id = json['id'];
    _stock = json['stock'];
    _name = json['name'];
    _categoryId = json['category_id'];
    _subCategoryId = json['sub_category_id'];
    _shortDescription = json['short_description'];
    _price = json['price'];
    _weight = json['weight'];
    _slug = json['slug'];
    _description = json['description'];
    _totalAllowedQuantity = json['total_allowed_quantity'];
    _deliverableType = json['deliverable_type'];
    _deliverableZipcodes = json['deliverable_zipcodes'];
    _minimumOrderQuantity = json['minimum_order_quantity'];
    _quantityStepSize = json['quantity_step_size'];
    _codAllowed = json['cod_allowed'];
    _rowOrder = json['row_order'];
    _rating = json['rating'];
    _noOfRatings = json['no_of_ratings'];
    _image = json['image'];
    _isReturnable = json['is_returnable'];
    _isCancelable = json['is_cancelable'];
    _cancelableTill = json['cancelable_till'];
    _indicator = json['indicator'];
    _otherImages = json['other_images'] != null ? json['other_images'].cast<String>() : [];
    _videoType = json['video_type'];
    _video = json['video'];
    _tags = json['tags'] != null ? json['tags'].cast<String>() : [];
    _warrantyPeriod = json['warranty_period'];
    _guaranteePeriod = json['guarantee_period'];
    _madeIn = json['made_in'];
    _availability = json['availability'];
    _categoryName = json['category_name'];
    _taxPercentage = json['tax_percentage'];
    if (json['standouts'] != null) {
      _standouts = <Standouts>[];
      json['standouts'].forEach((v) {
        _standouts?.add(Standouts.fromJson(v));
      });
    }

    if (json['price_break'] != null) {
      _priceBreak = [];
      json['price_break'].forEach((v) {
        _priceBreak?.add(PriceBreak.fromJson(v));
      });
    }
    if (json['review_images'] != null) {
      _reviewImages = [];
      json['review_images'].forEach((v) {
        _reviewImages?.add(v.fromJson(v));
      });
    }
    if (json['attributes'] != null) {
      _attributes = [];
      json['attributes'].forEach((v) {
        _attributes?.add(v.fromJson(v));
      });
    }
    if (json['variants'] != null) {
      _variants = [];
      json['variants'].forEach((v) {
        _variants?.add(Variants.fromJson(v));
      });
    }
    // _minMaxPrice = json['min_max_price'] != null ? MinMaxPrice.fromJson(json['min_max_price']) : null;
    _deliverableZipcodesIds = json['deliverable_zipcodes_ids'];
    _isDeliverable = json['is_deliverable'];
    _isPurchased = json['is_purchased'];
    _isFavorite = json['is_favorite'];
    _imageMd = json['image_md'];
    _imageSm = json['image_sm'];
    _otherImagesMd = json['other_images_md'] != null ? json['other_images_md'].cast<String>() : [];
    _otherImagesSm = json['other_images_sm'] != null ? json['other_images_sm'].cast<String>() : [];
    if (json['variant_attributes'] != null) {
      _variantAttributes = [];
      json['variant_attributes'].forEach((v) {
        _variantAttributes?.add(v.fromJson(v));
      });
    }
  }
  String? _total;
  String? _sales;
  dynamic _stockType;
  String? _isPricesInclusiveTax;
  List<String>? _sizes;
  String? _sizeInfo;
  String? _standout;
  String? _type;
  String? _attrValueIds;
  String? _sellerRating;
  String? _sellerSlug;
  String? _sellerNoOfRatings;
  String? _sellerProfile;
  String? _storeName;
  String? _storeDescription;
  String? _sellerId;
  dynamic _sellerName;
  String? _id;
  dynamic _stock;
  String? _name;
  String? _categoryId;
  String? _subCategoryId;
  String? _shortDescription;
  String? _price;
  String? _weight;
  String? _slug;
  String? _description;
  String? _totalAllowedQuantity;
  String? _deliverableType;
  dynamic _deliverableZipcodes;
  String? _minimumOrderQuantity;
  String? _quantityStepSize;
  String? _codAllowed;
  String? _rowOrder;
  String? _rating;
  String? _noOfRatings;
  String? _image;
  String? _isReturnable;
  String? _isCancelable;
  String? _cancelableTill;
  String? _indicator;
  List<String>? _otherImages;
  String? _videoType;
  String? _video;
  List<String>? _tags;
  String? _warrantyPeriod;
  String? _guaranteePeriod;
  String? _madeIn;
  dynamic _availability;
  String? _categoryName;
  String? _taxPercentage;
  List<Standouts>? _standouts;
  List<PriceBreak>? _priceBreak;
  List<dynamic>? _reviewImages;
  List<dynamic>? _attributes;
  List<Variants>? _variants;
  MinMaxPrice? _minMaxPrice;
  dynamic _deliverableZipcodesIds;
  bool? _isDeliverable;
  bool? _isPurchased;
  int? _isFavorite;
  String? _imageMd;
  String? _imageSm;
  List<String>? _otherImagesMd;
  List<String>? _otherImagesSm;
  List<dynamic>? _variantAttributes;
  Product copyWith({  String? total,
    String? sales,
    dynamic stockType,
    String? isPricesInclusiveTax,
    List<String>? sizes,
    String? sizeInfo,
    String? standout,
    String? type,
    String? attrValueIds,
    String? sellerRating,
    String? sellerSlug,
    String? sellerNoOfRatings,
    String? sellerProfile,
    String? storeName,
    String? storeDescription,
    String? sellerId,
    dynamic sellerName,
    String? id,
    dynamic stock,
    String? name,
    String? categoryId,
    String? subCategoryId,
    String? shortDescription,
    String? price,
    String? weight,
    String? slug,
    String? description,
    String? totalAllowedQuantity,
    String? deliverableType,
    dynamic deliverableZipcodes,
    String? minimumOrderQuantity,
    String? quantityStepSize,
    String? codAllowed,
    String? rowOrder,
    String? rating,
    String? noOfRatings,
    String? image,
    String? isReturnable,
    String? isCancelable,
    String? cancelableTill,
    String? indicator,
    List<String>? otherImages,
    String? videoType,
    String? video,
    List<String>? tags,
    String? warrantyPeriod,
    String? guaranteePeriod,
    String? madeIn,
    dynamic availability,
    String? categoryName,
    String? taxPercentage,
    List<Standouts>? standouts,
    List<PriceBreak>? priceBreak,
    List<dynamic>? reviewImages,
    List<dynamic>? attributes,
    List<Variants>? variants,
    MinMaxPrice? minMaxPrice,
    dynamic deliverableZipcodesIds,
    bool? isDeliverable,
    bool? isPurchased,
    int? isFavorite,
    String? imageMd,
    String? imageSm,
    List<String>? otherImagesMd,
    List<String>? otherImagesSm,
    List<dynamic>? variantAttributes,
  }) => Product(  total: total ?? _total,
    sales: sales ?? _sales,
    stockType: stockType ?? _stockType,
    isPricesInclusiveTax: isPricesInclusiveTax ?? _isPricesInclusiveTax,
    sizes: sizes ?? _sizes,
    sizeInfo: sizeInfo ?? _sizeInfo,
    standout: standout ?? _standout,
    type: type ?? _type,
    attrValueIds: attrValueIds ?? _attrValueIds,
    sellerRating: sellerRating ?? _sellerRating,
    sellerSlug: sellerSlug ?? _sellerSlug,
    sellerNoOfRatings: sellerNoOfRatings ?? _sellerNoOfRatings,
    sellerProfile: sellerProfile ?? _sellerProfile,
    storeName: storeName ?? _storeName,
    storeDescription: storeDescription ?? _storeDescription,
    sellerId: sellerId ?? _sellerId,
    sellerName: sellerName ?? _sellerName,
    id: id ?? _id,
    stock: stock ?? _stock,
    name: name ?? _name,
    categoryId: categoryId ?? _categoryId,
    subCategoryId: subCategoryId ?? _subCategoryId,
    shortDescription: shortDescription ?? _shortDescription,
    price: price ?? _price,
    weight: weight ?? _weight,
    slug: slug ?? _slug,
    description: description ?? _description,
    totalAllowedQuantity: totalAllowedQuantity ?? _totalAllowedQuantity,
    deliverableType: deliverableType ?? _deliverableType,
    deliverableZipcodes: deliverableZipcodes ?? _deliverableZipcodes,
    minimumOrderQuantity: minimumOrderQuantity ?? _minimumOrderQuantity,
    quantityStepSize: quantityStepSize ?? _quantityStepSize,
    codAllowed: codAllowed ?? _codAllowed,
    rowOrder: rowOrder ?? _rowOrder,
    rating: rating ?? _rating,
    noOfRatings: noOfRatings ?? _noOfRatings,
    image: image ?? _image,
    isReturnable: isReturnable ?? _isReturnable,
    isCancelable: isCancelable ?? _isCancelable,
    cancelableTill: cancelableTill ?? _cancelableTill,
    indicator: indicator ?? _indicator,
    otherImages: otherImages ?? _otherImages,
    videoType: videoType ?? _videoType,
    video: video ?? _video,
    tags: tags ?? _tags,
    warrantyPeriod: warrantyPeriod ?? _warrantyPeriod,
    guaranteePeriod: guaranteePeriod ?? _guaranteePeriod,
    madeIn: madeIn ?? _madeIn,
    availability: availability ?? _availability,
    categoryName: categoryName ?? _categoryName,
    taxPercentage: taxPercentage ?? _taxPercentage,
    standouts: standouts ?? _standouts,
    priceBreak: priceBreak ?? _priceBreak,
    reviewImages: reviewImages ?? _reviewImages,
    attributes: attributes ?? _attributes,
    variants: variants ?? _variants,
    minMaxPrice: minMaxPrice ?? _minMaxPrice,
    deliverableZipcodesIds: deliverableZipcodesIds ?? _deliverableZipcodesIds,
    isDeliverable: isDeliverable ?? _isDeliverable,
    isPurchased: isPurchased ?? _isPurchased,
    isFavorite: isFavorite ?? _isFavorite,
    imageMd: imageMd ?? _imageMd,
    imageSm: imageSm ?? _imageSm,
    otherImagesMd: otherImagesMd ?? _otherImagesMd,
    otherImagesSm: otherImagesSm ?? _otherImagesSm,
    variantAttributes: variantAttributes ?? _variantAttributes,
  );
  String? get total => _total;
  String? get sales => _sales;
  dynamic get stockType => _stockType;
  String? get isPricesInclusiveTax => _isPricesInclusiveTax;
  List<String>? get sizes => _sizes;
  String? get sizeInfo => _sizeInfo;
  String? get standout => _standout;
  String? get type => _type;
  String? get attrValueIds => _attrValueIds;
  String? get sellerRating => _sellerRating;
  String? get sellerSlug => _sellerSlug;
  String? get sellerNoOfRatings => _sellerNoOfRatings;
  String? get sellerProfile => _sellerProfile;
  String? get storeName => _storeName;
  String? get storeDescription => _storeDescription;
  String? get sellerId => _sellerId;
  dynamic get sellerName => _sellerName;
  String? get id => _id;
  dynamic get stock => _stock;
  String? get name => _name;
  String? get categoryId => _categoryId;
  String? get subCategoryId => _subCategoryId;
  String? get shortDescription => _shortDescription;
  String? get price => _price;
  String? get weight => _weight;
  String? get slug => _slug;
  String? get description => _description;
  String? get totalAllowedQuantity => _totalAllowedQuantity;
  String? get deliverableType => _deliverableType;
  dynamic get deliverableZipcodes => _deliverableZipcodes;
  String? get minimumOrderQuantity => _minimumOrderQuantity;
  String? get quantityStepSize => _quantityStepSize;
  String? get codAllowed => _codAllowed;
  String? get rowOrder => _rowOrder;
  String? get rating => _rating;
  String? get noOfRatings => _noOfRatings;
  String? get image => _image;
  String? get isReturnable => _isReturnable;
  String? get isCancelable => _isCancelable;
  String? get cancelableTill => _cancelableTill;
  String? get indicator => _indicator;
  List<String>? get otherImages => _otherImages;
  String? get videoType => _videoType;
  String? get video => _video;
  List<String>? get tags => _tags;
  String? get warrantyPeriod => _warrantyPeriod;
  String? get guaranteePeriod => _guaranteePeriod;
  String? get madeIn => _madeIn;
  dynamic get availability => _availability;
  String? get categoryName => _categoryName;
  String? get taxPercentage => _taxPercentage;
  List<Standouts>? get standouts => _standouts;
  List<PriceBreak>? get priceBreak => _priceBreak;
  List<dynamic>? get reviewImages => _reviewImages;
  List<dynamic>? get attributes => _attributes;
  List<Variants>? get variants => _variants;
  MinMaxPrice? get minMaxPrice => _minMaxPrice;
  dynamic get deliverableZipcodesIds => _deliverableZipcodesIds;
  bool? get isDeliverable => _isDeliverable;
  bool? get isPurchased => _isPurchased;
  int? get isFavorite => _isFavorite;
  String? get imageMd => _imageMd;
  String? get imageSm => _imageSm;
  List<String>? get otherImagesMd => _otherImagesMd;
  List<String>? get otherImagesSm => _otherImagesSm;
  List<dynamic>? get variantAttributes => _variantAttributes;


  set isFavorite(int? value) {
    _isFavorite = value;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total'] = _total;
    map['sales'] = _sales;
    map['stock_type'] = _stockType;
    map['is_prices_inclusive_tax'] = _isPricesInclusiveTax;
    map['sizes'] = _sizes;
    map['size_info'] = _sizeInfo;
    map['standout'] = _standout;
    map['type'] = _type;
    map['attr_value_ids'] = _attrValueIds;
    map['seller_rating'] = _sellerRating;
    map['seller_slug'] = _sellerSlug;
    map['seller_no_of_ratings'] = _sellerNoOfRatings;
    map['seller_profile'] = _sellerProfile;
    map['store_name'] = _storeName;
    map['store_description'] = _storeDescription;
    map['seller_id'] = _sellerId;
    map['seller_name'] = _sellerName;
    map['id'] = _id;
    map['stock'] = _stock;
    map['name'] = _name;
    map['category_id'] = _categoryId;
    map['sub_category_id'] = _subCategoryId;
    map['short_description'] = _shortDescription;
    map['price'] = _price;
    map['weight'] = _weight;
    map['slug'] = _slug;
    map['description'] = _description;
    map['total_allowed_quantity'] = _totalAllowedQuantity;
    map['deliverable_type'] = _deliverableType;
    map['deliverable_zipcodes'] = _deliverableZipcodes;
    map['minimum_order_quantity'] = _minimumOrderQuantity;
    map['quantity_step_size'] = _quantityStepSize;
    map['cod_allowed'] = _codAllowed;
    map['row_order'] = _rowOrder;
    map['rating'] = _rating;
    map['no_of_ratings'] = _noOfRatings;
    map['image'] = _image;
    map['is_returnable'] = _isReturnable;
    map['is_cancelable'] = _isCancelable;
    map['cancelable_till'] = _cancelableTill;
    map['indicator'] = _indicator;
    map['other_images'] = _otherImages;
    map['video_type'] = _videoType;
    map['video'] = _video;
    map['tags'] = _tags;
    map['warranty_period'] = _warrantyPeriod;
    map['guarantee_period'] = _guaranteePeriod;
    map['made_in'] = _madeIn;
    map['availability'] = _availability;
    map['category_name'] = _categoryName;
    map['tax_percentage'] = _taxPercentage;
    if (_standouts != null) {
      map['standouts'] = _standouts?.map((v) => v.toJson()).toList();
    }
    if (_priceBreak != null) {
      map['price_break'] = _priceBreak?.map((v) => v.toJson()).toList();
    }
    if (_reviewImages != null) {
      map['review_images'] = _reviewImages?.map((v) => v.toJson()).toList();
    }
    if (_attributes != null) {
      map['attributes'] = _attributes?.map((v) => v.toJson()).toList();
    }
    if (_variants != null) {
      map['variants'] = _variants?.map((v) => v.toJson()).toList();
    }
    if (_minMaxPrice != null) {
      map['min_max_price'] = _minMaxPrice?.toJson();
    }
    map['deliverable_zipcodes_ids'] = _deliverableZipcodesIds;
    map['is_deliverable'] = _isDeliverable;
    map['is_purchased'] = _isPurchased;
    map['is_favorite'] = _isFavorite;
    map['image_md'] = _imageMd;
    map['image_sm'] = _imageSm;
    map['other_images_md'] = _otherImagesMd;
    map['other_images_sm'] = _otherImagesSm;
    if (_variantAttributes != null) {
      map['variant_attributes'] = _variantAttributes?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// min_price : 0
/// max_price : 0
/// special_price : 50
/// max_special_price : 50
/// discount_in_percentage : 0

MinMaxPrice minMaxPriceFromJson(String str) => MinMaxPrice.fromJson(json.decode(str));
String minMaxPriceToJson(MinMaxPrice data) => json.encode(data.toJson());
class MinMaxPrice {
  MinMaxPrice({
    int? minPrice,
    int? maxPrice,
    int? specialPrice,
    int? maxSpecialPrice,
    int? discountInPercentage,}){
    _minPrice = minPrice;
    _maxPrice = maxPrice;
    _specialPrice = specialPrice;
    _maxSpecialPrice = maxSpecialPrice;
    _discountInPercentage = discountInPercentage;
  }

  MinMaxPrice.fromJson(dynamic json) {
    _minPrice = json['min_price'];
    _maxPrice = json['max_price'];
    // _specialPrice = json['special_price'];
    _maxSpecialPrice = json['max_special_price'];
    _discountInPercentage = json['discount_in_percentage'];
  }
  int? _minPrice;
  int? _maxPrice;
  int? _specialPrice;
  int? _maxSpecialPrice;
  int? _discountInPercentage;
  MinMaxPrice copyWith({  int? minPrice,
    int? maxPrice,
    int? specialPrice,
    int? maxSpecialPrice,
    int? discountInPercentage,
  }) => MinMaxPrice(  minPrice: minPrice ?? _minPrice,
    maxPrice: maxPrice ?? _maxPrice,
    specialPrice: specialPrice ?? _specialPrice,
    maxSpecialPrice: maxSpecialPrice ?? _maxSpecialPrice,
    discountInPercentage: discountInPercentage ?? _discountInPercentage,
  );
  int? get minPrice => _minPrice;
  int? get maxPrice => _maxPrice;
  int? get specialPrice => _specialPrice;
  int? get maxSpecialPrice => _maxSpecialPrice;
  int? get discountInPercentage => _discountInPercentage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['min_price'] = _minPrice;
    map['max_price'] = _maxPrice;
    map['special_price'] = _specialPrice;
    map['max_special_price'] = _maxSpecialPrice;
    map['discount_in_percentage'] = _discountInPercentage;
    return map;
  }

}

/// id : "210"
/// product_id : "193"
/// attribute_value_ids : ""
/// attribute_set : ""
/// price : "500"
/// special_price : "50"
/// sku : ""
/// stock : null
/// images : []
/// availability : ""
/// status : "1"
/// date_added : "2022-11-18 18:36:59"
/// variant_ids : ""
/// attr_name : ""
/// variant_values : ""
/// swatche_type : ""
/// swatche_value : ""
/// images_md : []
/// images_sm : []
/// cart_count : "0"
/// is_purchased : 0

Variants variantsFromJson(String str) => Variants.fromJson(json.decode(str));
String variantsToJson(Variants data) => json.encode(data.toJson());
class Variants {
  Variants({
    String? id,
    String? productId,
    String? attributeValueIds,
    String? attributeSet,
    String? price,
    String? specialPrice,
    String? sku,
    dynamic stock,
    List<dynamic>? images,
    String? availability,
    String? status,
    String? dateAdded,
    String? variantIds,
    String? attrName,
    String? variantValues,
    String? swatcheType,
    String? swatcheValue,
    List<dynamic>? imagesMd,
    List<dynamic>? imagesSm,
    String? cartCount,
    int? isPurchased,}){
    _id = id;
    _productId = productId;
    _attributeValueIds = attributeValueIds;
    _attributeSet = attributeSet;
    _price = price;
    _specialPrice = specialPrice;
    _sku = sku;
    _stock = stock;
    _images = images;
    _availability = availability;
    _status = status;
    _dateAdded = dateAdded;
    _variantIds = variantIds;
    _attrName = attrName;
    _variantValues = variantValues;
    _swatcheType = swatcheType;
    _swatcheValue = swatcheValue;
    _imagesMd = imagesMd;
    _imagesSm = imagesSm;
    _cartCount = cartCount;
    _isPurchased = isPurchased;
  }

  Variants.fromJson(dynamic json) {
    _id = json['id'];
    _productId = json['product_id'];
    _attributeValueIds = json['attribute_value_ids'];
    _attributeSet = json['attribute_set'];
    _price = json['price'];
    _specialPrice = json['special_price'];
    _sku = json['sku'];
    _stock = json['stock'];
    if (json['images'] != null) {
      _images = [];
      json['images'].forEach((v) {
        _images?.add(v.fromJson(v));
      });
    }
    _availability = json['availability'];
    _status = json['status'];
    _dateAdded = json['date_added'];
    _variantIds = json['variant_ids'];
    _attrName = json['attr_name'];
    _variantValues = json['variant_values'];
    _swatcheType = json['swatche_type'];
    _swatcheValue = json['swatche_value'];
    if (json['images_md'] != null) {
      _imagesMd = [];
      json['images_md'].forEach((v) {
        _imagesMd?.add(v.fromJson(v));
      });
    }
    if (json['images_sm'] != null) {
      _imagesSm = [];
      json['images_sm'].forEach((v) {
        _imagesSm?.add(v.fromJson(v));
      });
    }
    _cartCount = json['cart_count'];
    _isPurchased = json['is_purchased'];
  }
  String? _id;
  String? _productId;
  String? _attributeValueIds;
  String? _attributeSet;
  String? _price;
  String? _specialPrice;
  String? _sku;
  dynamic _stock;
  List<dynamic>? _images;
  String? _availability;
  String? _status;
  String? _dateAdded;
  String? _variantIds;
  String? _attrName;
  String? _variantValues;
  String? _swatcheType;
  String? _swatcheValue;
  List<dynamic>? _imagesMd;
  List<dynamic>? _imagesSm;
  String? _cartCount;
  int? _isPurchased;
  Variants copyWith({  String? id,
    String? productId,
    String? attributeValueIds,
    String? attributeSet,
    String? price,
    String? specialPrice,
    String? sku,
    dynamic stock,
    List<dynamic>? images,
    String? availability,
    String? status,
    String? dateAdded,
    String? variantIds,
    String? attrName,
    String? variantValues,
    String? swatcheType,
    String? swatcheValue,
    List<dynamic>? imagesMd,
    List<dynamic>? imagesSm,
    String? cartCount,
    int? isPurchased,
  }) => Variants(  id: id ?? _id,
    productId: productId ?? _productId,
    attributeValueIds: attributeValueIds ?? _attributeValueIds,
    attributeSet: attributeSet ?? _attributeSet,
    price: price ?? _price,
    specialPrice: specialPrice ?? _specialPrice,
    sku: sku ?? _sku,
    stock: stock ?? _stock,
    images: images ?? _images,
    availability: availability ?? _availability,
    status: status ?? _status,
    dateAdded: dateAdded ?? _dateAdded,
    variantIds: variantIds ?? _variantIds,
    attrName: attrName ?? _attrName,
    variantValues: variantValues ?? _variantValues,
    swatcheType: swatcheType ?? _swatcheType,
    swatcheValue: swatcheValue ?? _swatcheValue,
    imagesMd: imagesMd ?? _imagesMd,
    imagesSm: imagesSm ?? _imagesSm,
    cartCount: cartCount ?? _cartCount,
    isPurchased: isPurchased ?? _isPurchased,
  );
  String? get id => _id;
  String? get productId => _productId;
  String? get attributeValueIds => _attributeValueIds;
  String? get attributeSet => _attributeSet;
  String? get price => _price;
  String? get specialPrice => _specialPrice;
  String? get sku => _sku;
  dynamic get stock => _stock;
  List<dynamic>? get images => _images;
  String? get availability => _availability;
  String? get status => _status;
  String? get dateAdded => _dateAdded;
  String? get variantIds => _variantIds;
  String? get attrName => _attrName;
  String? get variantValues => _variantValues;
  String? get swatcheType => _swatcheType;
  String? get swatcheValue => _swatcheValue;
  List<dynamic>? get imagesMd => _imagesMd;
  List<dynamic>? get imagesSm => _imagesSm;
  String? get cartCount => _cartCount;
  int? get isPurchased => _isPurchased;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['product_id'] = _productId;
    map['attribute_value_ids'] = _attributeValueIds;
    map['attribute_set'] = _attributeSet;
    map['price'] = _price;
    map['special_price'] = _specialPrice;
    map['sku'] = _sku;
    map['stock'] = _stock;
    if (_images != null) {
      map['images'] = _images?.map((v) => v.toJson()).toList();
    }
    map['availability'] = _availability;
    map['status'] = _status;
    map['date_added'] = _dateAdded;
    map['variant_ids'] = _variantIds;
    map['attr_name'] = _attrName;
    map['variant_values'] = _variantValues;
    map['swatche_type'] = _swatcheType;
    map['swatche_value'] = _swatcheValue;
    if (_imagesMd != null) {
      map['images_md'] = _imagesMd?.map((v) => v.toJson()).toList();
    }
    if (_imagesSm != null) {
      map['images_sm'] = _imagesSm?.map((v) => v.toJson()).toList();
    }
    map['cart_count'] = _cartCount;
    map['is_purchased'] = _isPurchased;
    return map;
  }

}

/// title : "Gold"
/// data : [{"component_type":"18 KT White Gold","rate":"5","unit":"gm","weight":"5","discount":""},{"component_type":"Making Charges","rate":"50","unit":"gm","weight":"18","discount":""}]

PriceBreak priceBreakFromJson(String str) => PriceBreak.fromJson(json.decode(str));
String priceBreakToJson(PriceBreak data) => json.encode(data.toJson());
class PriceBreak {
  PriceBreak({
    String? title,
    List<Data>? data,}){
    _title = title;
    _data = data;
  }

  PriceBreak.fromJson(dynamic json) {
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
  PriceBreak copyWith({  String? title,
    List<Data>? data,
  }) => PriceBreak(  title: title ?? _title,
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

/// component_type : "18 KT White Gold"
/// rate : "5"
/// unit : "gm"
/// weight : "5"
/// discount : ""

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
    String? componentType,
    String? componentName,
    String? rate,
    String? unit,
    String? weight,
    String? discount,}){
    _componentType = componentType;
    _componentName = componentName;
    _rate = rate;
    _unit = unit;
    _weight = weight;
    _discount = discount;
  }

  Data.fromJson(dynamic json) {
    _componentType = json['component_type'];
    _componentName = json['component_name'];
    _rate = json['rate'];
    _unit = json['unit'];
    _weight = json['weight'];
    _discount = json['discount'];
  }
  String? _componentType;
  String? _componentName;
  String? _rate;
  String? _unit;
  String? _weight;
  String? _discount;
  Data copyWith({
    String? componentType,
    String? componentName,
    String? rate,
    String? unit,
    String? weight,
    String? discount,
  }) => Data(
    componentType: componentType ?? _componentType,
    componentName: componentName ?? _componentName,
    rate: rate ?? _rate,
    unit: unit ?? _unit,
    weight: weight ?? _weight,
    discount: discount ?? _discount,
  );
  String? get componentType => _componentType;
  String? get componentName => _componentName;
  String? get rate => _rate;
  String? get unit => _unit;
  String? get weight => _weight;
  String? get discount => _discount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['component_type'] = _componentType;
    map['component_name'] = _componentName;
    map['rate'] = _rate;
    map['unit'] = _unit;
    map['weight'] = _weight;
    map['discount'] = _discount;
    return map;
  }

}


class Standouts {
  String? id;
  String? text;
  String? icon;
  String? createAt;

  Standouts({this.id, this.text, this.icon, this.createAt});

  Standouts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
    icon = json['icon'];
    createAt = json['create_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['text'] = this.text;
    data['icon'] = this.icon;
    data['create_at'] = this.createAt;
    return data;
  }
}