class CarModel {
  //  Car Model according to dummy json Located at    (json_of_car/car.dart)
  String? category;
  String? color;
  String? model;
  String? make;
  String? registrationNo;

  CarModel(
      {this.category, this.color, this.model, this.make, this.registrationNo});

  CarModel.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    color = json['color'];
    model = json['model'];
    make = json['make'];
    registrationNo = json['registration-no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category'] = category;
    data['color'] = color;
    data['model'] = model;
    data['make'] = make;
    data['registration-no'] = registrationNo;
    return data;
  }
}
