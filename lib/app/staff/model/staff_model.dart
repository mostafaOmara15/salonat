import 'package:salonat/app/services/model/sub_services_model.dart';

class StaffModel {
  StaffModel({
      this.image, 
      this.salonid, 
      this.subservices, 
      this.name, 
      this.createdat, 
      this.id,});

  StaffModel.fromJson(dynamic json) {
    image = json['image'];
    salonid = json['salon-id'];
    subservices = json['sub-services'] != null ? json['sub-services'].cast<String>() : [];
    name = json['name'];
    createdat = json['created-at'];
    id = json['id'];
  }
  String? image;
  String? salonid;
  List<String>? subservices;
  String? name;
  String? createdat;
  String? id;
  double rate=0;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['image'] = image;
    map['salon-id'] = salonid;
    map['sub-services'] = subservices;
    map['name'] = name;
    map['created-at'] = createdat;
    map['id'] = id;
    return map;
  }

}