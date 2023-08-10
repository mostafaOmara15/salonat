class ReviewModel {
  ReviewModel({
      this.uid, 
      this.salonid, 
      this.comment, 
      this.id, 
      this.createddate, 
      this.clientimage, 
      this.clientname,});

  ReviewModel.fromJson(dynamic json) {
    uid = json['uid'];
    salonid = json['salon-id'];
    comment = json['comment'];
    id = json['id'];
    createddate = json['created-date'];
    clientimage = json['client-image'];
    clientname = json['client-name'];
  }
  String? uid;
  String? salonid;
  String? comment;
  String? id;
  String? createddate;
  String? clientimage;
  String? clientname;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['uid'] = uid;
    map['salon-id'] = salonid;
    map['comment'] = comment;
    map['id'] = id;
    map['created-date'] = createddate;
    map['client-image'] = clientimage;
    map['client-name'] = clientname;
    return map;
  }

}