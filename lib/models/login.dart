class DLogin {
  Doctor? data;
  String? token;
  String? message;
  int? code;
  String? errors;

  DLogin({this.data, this.token, this.message, this.code, this.errors});

  DLogin.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Doctor.fromJson(json['data']) : null;
    token = json['token'];
    message = json['message'];
    code = json['code'];
    errors = json['errors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['token'] = this.token;
    data['message'] = this.message;
    data['code'] = this.code;
    data['errors'] = this.errors;
    return data;
  }
}

class Doctor {
  int? id;
  String? name;
  String? email;
  String? title;
  String? address;
  String? type;
  List? patientId;
  String? createdAt;
  String? updatedAt;

  Doctor(
      {this.id,
      this.name,
      this.email,
      this.title,
      this.address,
      this.type,
      this.patientId,
      this.createdAt,
      this.updatedAt});

  Doctor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    title = json['title'];
    address = json['address'];
    type = json['type'];
    
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['title'] = this.title;
    data['address'] = this.address;
    data['type'] = this.type;
    if (this.patientId != null) {
      data['patient_id'] = this.patientId!.map((v) => v.toJson()).toList();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}