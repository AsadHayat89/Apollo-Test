class User {
  String? message;
  Data? data;

  User({this.message, this.data});

  User.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<AllUsers>? allUsers;

  Data({this.allUsers});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['all-users'] != null) {
      allUsers = <AllUsers>[];
      json['all-users'].forEach((v) {
        allUsers!.add(new AllUsers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.allUsers != null) {
      data['all-users'] = this.allUsers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllUsers {
  int? id;
  String? fname;
  String? lname;
  String? username;
  String? email;
  String? profile;
  String? phone;

  AllUsers(
      {this.id,
        this.fname,
        this.lname,
        this.username,
        this.email,
        this.profile,
        this.phone});

  AllUsers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fname = json['fname'];
    lname = json['lname'];
    username = json['username'];
    email = json['email'];
    profile = json['profile'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fname'] = this.fname;
    data['lname'] = this.lname;
    data['username'] = this.username;
    data['email'] = this.email;
    data['profile'] = this.profile;
    data['phone'] = this.phone;
    return data;
  }
}
