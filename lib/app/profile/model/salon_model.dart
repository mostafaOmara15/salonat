class SalonModel {
  SalonModel({
    this.openingtime,
    this.images,
    this.address,
    this.devicetoken,
    this.name,
    this.subscriptionenddate,
    this.about,
    this.location,
    this.id,
    this.views,
    this.email,
  });

  SalonModel.fromJson(dynamic json) {
    if (json['opening-time'] != null) {
      openingtime = [];
      json['opening-time'].forEach((v) {
        openingtime?.add(OpeningTime.fromJson(v));
      });
    }
    images = json['images'] != null ? json['images'].cast<String>() : [];
    address = json['address'];
    devicetoken = json['device-token'];
    name = json['name'];
    subscriptionenddate = json['subscription-end-date'];
    about = json['about'];
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    id = json['id'];
    views = json['views'];
    email = json['email'];
  }

  List<OpeningTime>? openingtime;
  List<String>? images;
  String? address;
  String? devicetoken;
  String? name;
  String? subscriptionenddate;
  String? about;
  Location? location;
  String? id;
  num? views;
  String? email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (openingtime != null) {
      map['opening-time'] = openingtime?.map((v) => v.toJson()).toList();
    }
    map['images'] = images;
    map['address'] = address;
    map['device-token'] = devicetoken;
    map['name'] = name;
    map['subscription-end-date'] = subscriptionenddate;
    map['about'] = about;
    if (location != null) {
      map['location'] = location?.toJson();
    }
    map['id'] = id;
    map['views'] = views;
    map['email'] = email;
    return map;
  }
}

class Location {
  Location({
    this.lat,
    this.long,
  });

  Location.fromJson(dynamic json) {
    lat = json['lat'];
    long = json['long'];
  }

  String? lat;
  String? long;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lat'] = lat;
    map['long'] = long;
    return map;
  }
}

class OpeningTime {
  OpeningTime({
    this.day,
    this.close,
    this.open,
  });

  OpeningTime.fromJson(dynamic json) {
    day = json['day'];
    close = json['close'];
    open = json['open'];
  }

  String? day;
  String? close;
  String? open;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['day'] = day;
    map['close'] = close;
    map['open'] = open;
    return map;
  }
}
