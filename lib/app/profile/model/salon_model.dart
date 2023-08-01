class SalonModel {
  String? id;
  String? email;
  String? name;
  String? about;
  String? address;
  String? deviceToken;
  List? images;
  Map? location;
  List? openingTime;
  String? subscripeDuration;
  int? views;

  SalonModel({
    this.name,
    this.id,
    this.email,
    this.about,
    this.address,
    this.deviceToken,
    this.images,
    this.location,
    this.openingTime,
    this.subscripeDuration,
    this.views,
  });

  SalonModel.fromJson(Map<String, dynamic>? json){
    name = json!['name'];
    id = json!['id'];
    email = json!['email'];
    about = json!['about'];
    address = json!['address'];
    deviceToken = json!['deviceToken'];
    images = json!['images'];
    location = json!['location'];
    openingTime = json!['openingTime'];
    subscripeDuration = json!['subscripeDuration'];
    views = json!['views'];
  }

  Map<String, dynamic> toMap(){
    return {
      'name' : name,
      'id' : id,
      'email' : email,
      'about' : about,
      'address' : address,
      'deviceToken' : deviceToken,
      'images' : images,
      'location' : location,
      'openingTime' : openingTime,
      'subscription-end-date' : subscripeDuration,
      'views' : views,
    };
  }
}