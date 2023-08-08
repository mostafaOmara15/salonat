class OfferModel {
  OfferModel({
      this.descriptionen, 
      this.image, 
      this.enddate, 
      this.priceafter, 
      this.salonid, 
      this.descriptionar, 
      this.startdate, 
      this.id, 
      this.pricebefore,});

  OfferModel.fromJson(dynamic json) {
    descriptionen = json['description-en'];
    image = json['image'];
    enddate = json['end-date'];
    priceafter = json['price-after'];
    salonid = json['salon-id'];
    descriptionar = json['description-ar'];
    startdate = json['start-date'];
    id = json['id'];
    pricebefore = json['price-before'];
  }
  String? descriptionen;
  String? image;
  String? enddate;
  String? priceafter;
  String? salonid;
  String? descriptionar;
  String? startdate;
  String? id;
  String? pricebefore;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['description-en'] = descriptionen;
    map['image'] = image;
    map['end-date'] = enddate;
    map['price-after'] = priceafter;
    map['salon-id'] = salonid;
    map['description-ar'] = descriptionar;
    map['start-date'] = startdate;
    map['id'] = id;
    map['price-before'] = pricebefore;
    return map;
  }

}