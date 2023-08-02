class MainServicesModel {
  MainServicesModel({
      this.image, 
      this.titleen, 
      this.id, 
      this.salonsid, 
      this.titlear,});

  MainServicesModel.fromJson(dynamic json) {
    image = json['image'].toString();
    titleen = json['title-en'];
    id = json['id'];
    salonsid = json['salons-id'] != null ? json['salons-id'].cast<String>() : [];
    titlear = json['title-ar'];
  }
  String? image;
  String? titleen;
  String? id;
  List<String>? salonsid;
  String? titlear;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['image'] = image.toString();
    map['title-en'] = titleen;
    map['id'] = id;
    map['salons-id'] = salonsid;
    map['title-ar'] = titlear;
    return map;
  }

}