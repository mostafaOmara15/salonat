class BookingModel {
  BookingModel({
      this.amount, 
      this.clientphone, 
      this.createddate, 
      this.clientname, 
      this.bookingdate, 
      this.uid, 
      this.hasdiscount, 
      this.modificationdate, 
      this.salonid, 
      this.bookingservice, 
      this.id, 
      this.time, 
      this.discountamount, 
      this.status,});

  BookingModel.fromJson(dynamic json) {
    amount = json['amount'];
    clientphone = json['client-phone'];
    createddate = json['created-date'];
    clientname = json['client-name'];
    bookingdate = json['booking-date'];
    uid = json['uid'];
    hasdiscount = json['has-discount'];
    modificationdate = json['modification -date'];
    salonid = json['salon-id'];
    if (json['booking-service'] != null) {
      bookingservice = [];
      json['booking-service'].forEach((v) {
        bookingservice?.add(BookingService.fromJson(v));
      });
    }
    id = json['id'];
    time = json['time'];
    discountamount = json['discount-amount'];
    status = json['status'];
  }
  String? amount;
  String? clientphone;
  String? createddate;
  String? clientname;
  String? bookingdate;
  String? uid;
  bool? hasdiscount;
  String? modificationdate;
  String? salonid;
  List<BookingService>? bookingservice;
  String? id;
  String? time;
  String? discountamount;
  num? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['amount'] = amount;
    map['client-phone'] = clientphone;
    map['created-date'] = createddate;
    map['client-name'] = clientname;
    map['booking-date'] = bookingdate;
    map['uid'] = uid;
    map['has-discount'] = hasdiscount;
    map['modification -date'] = modificationdate;
    map['salon-id'] = salonid;
    if (bookingservice != null) {
      map['booking-service'] = bookingservice?.map((v) => v.toJson()).toList();
    }
    map['id'] = id;
    map['time'] = time;
    map['discount-amount'] = discountamount;
    map['status'] = status;
    return map;
  }

}

class BookingService {
  BookingService({
      this.staffid, 
      this.subserviceid,});

  BookingService.fromJson(dynamic json) {
    staffid = json['staff-id'];
    subserviceid = json['sub-service-id'];
  }
  String? staffid;
  String? subserviceid;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['staff-id'] = staffid;
    map['sub-service-id'] = subserviceid;
    return map;
  }

}