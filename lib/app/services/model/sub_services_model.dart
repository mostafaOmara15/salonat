class SubServicesModel {
  SubServicesModel({
      this.descriptionen, 
      this.duration, 
      this.price, 
      this.salonid, 
      this.titleen, 
      this.descriptionar, 
      this.createdat, 
      this.mainserviceid, 
      this.id, 
      this.titlear,
 });

  SubServicesModel.fromJson(dynamic json) {
    descriptionen = json['description-en'];
    duration = json['duration'];
    price = json['price'];
    salonid = json['salon-id'];
    titleen = json['title-en'];
    descriptionar = json['description-ar'];
    createdat = json['created-at'];
    mainserviceid = json['main-service-id'];
    id = json['id'];
    titlear = json['title-ar'];
  }
  String? descriptionen;
  String? duration;
  String? price;
  String? salonid;
  String? titleen;
  String? descriptionar;
  String? createdat;
  String? mainserviceid;
  String? id;
  String? titlear;
  bool  isSelected=false;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['description-en'] = descriptionen;
    map['duration'] = duration;
    map['price'] = price;
    map['salon-id'] = salonid;
    map['title-en'] = titleen;
    map['description-ar'] = descriptionar;
    map['created-at'] = createdat;
    map['main-service-id'] = mainserviceid;
    map['id'] = id;
    map['title-ar'] = titlear;
    return map;
  }

}