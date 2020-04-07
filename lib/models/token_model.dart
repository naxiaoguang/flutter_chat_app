class TokenModel {
  int id;
  String email;
  String uuid;
  String createdAt;
  String lastLoginIp;
  String profilePicUrl;
  String fullName;
  int ca;

  TokenModel(
      {this.id,
      this.email,
      this.uuid,
      this.createdAt,
      this.lastLoginIp,
      this.profilePicUrl,
      this.fullName,
      this.ca});

  TokenModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    uuid = json['uuid'];
    createdAt = json['created_at'];
    lastLoginIp = json['last_login_ip'];
    profilePicUrl = json['profile_pic_url'];
    fullName = json['full_name'];
    ca = json['ca'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['uuid'] = this.uuid;
    data['created_at'] = this.createdAt;
    data['last_login_ip'] = this.lastLoginIp;
    data['profile_pic_url'] = this.profilePicUrl;
    data['full_name'] = this.fullName;
    data['ca'] = this.ca;
    return data;
  }
}
