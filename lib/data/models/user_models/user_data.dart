class UserData {
  String? sId;
  String? firstName;
  String? lastName;
  String? email;
  bool? emailVerified;
  String? phone;
  bool? phoneVerified;
  String? avatarUrl;
  String? city;
  int? role;

  UserData(
      {this.sId,
      this.firstName,
      this.lastName,
      this.email,
      this.emailVerified,
      this.phone,
      this.phoneVerified,
      this.avatarUrl,
      this.city,
      this.role});

  UserData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    emailVerified = json['email_verified'];
    phone = json['phone'];
    phoneVerified = json['phone_verified'];
    avatarUrl = json['avatar_url'];
    city = json['city'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['_id'] = sId;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['email_verified'] = emailVerified;
    data['phone'] = phone;
    data['phone_verified'] = phoneVerified;
    data['avatar_url'] = avatarUrl;
    data['city'] = city;
    data['role'] = role;
    return data;
  }
}
