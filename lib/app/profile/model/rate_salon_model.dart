class RateSalonModel {
  RateSalonModel({
      this.uid, 
      this.rate, 
      this.salonid, 
      this.id,});

  RateSalonModel.fromJson(dynamic json) {
    uid = json['uid'];
    rate = json['rate'];
    salonid = json['salon-id'];
    id = json['id'];
  }
  String? uid;
  num? rate;
  String? salonid;
  String? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['uid'] = uid;
    map['rate'] = rate;
    map['salon-id'] = salonid;
    map['id'] = id;
    return map;
  }

}