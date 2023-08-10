class SalonModel {
  SalonModel({
    this.subscriptionjoindate,
    this.openingtime,
    this.coverimages,
    this.address,
    this.devicetoken,
    this.subscriptionenddate,
    this.name,
    this.location,
    this.views,
    this.aboutEn,
    this.aboutAr,
    this.email,
  });

  SalonModel.fromJson(dynamic json) {
    final map = <String, dynamic>{};
    subscriptionjoindate = json['subscription-join-date'];
    if (json['opening-time'] != null) {
      openingtime = [];
      json['opening-time'].forEach((v) {
        openingtime?.add(OpeningTime.fromJson(v));
      });
    }
    if (location != null) {
      map['location'] = location?.toJson();
    }
    views = json['views'];

    coverimages =
        json['cover-images'] != null ? json['cover-images'].cast<String>() : [];
    devicetoken =
        json['device-token'] != null ? json['device-token'].cast<String>() : [];
    address = json['address'];
    subscriptionenddate = json['subscription-end-date'];
    name = json['name'];
    aboutEn = json['about-en'];
    aboutAr = json['about-ar'];
    email = json['email'];
  }

  String? subscriptionjoindate;
  List<OpeningTime>? openingtime;
  List<String>? coverimages;
  String? address;
  List<dynamic>? devicetoken;
  String? subscriptionenddate;
  String? name;
  num? views;
  Location? location;
  String? aboutEn;
  String? aboutAr;
  String? email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['subscription-join-date'] = subscriptionjoindate;
    if (openingtime != null) {
      map['opening-time'] = openingtime?.map((v) => v.toJson()).toList();
    }
    if (location != null) {
      map['location'] = location?.toJson();
    }
    map['views'] = views;
    map['cover-images'] = coverimages;
    map['address'] = address;
    if (devicetoken != null) {
      map['device-token'] = devicetoken?.map((v) => v.toJson()).toList();
    }
    map['subscription-end-date'] = subscriptionenddate;
    map['name'] = name;
    map['about-en'] = aboutEn;
    map['about-ar'] = aboutAr;
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
    this.close,
    this.day,
    this.open,
    this.isClosed,
  });

  OpeningTime.fromJson(dynamic json) {
    close = json['close'];
    day = json['day'];
    open = json['open'];
    isClosed = json['is-closed'];
  }

  String? close;
  String? day;
  String? open;
  bool? isClosed;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['close'] = close;
    map['day'] = day;
    map['open'] = open;
    map['is-closed'] = isClosed;
    return map;
  }
}