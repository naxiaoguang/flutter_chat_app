class IOUserModel {
  var uuid;
  var uname;

  IOUserModel({this.uuid, this.uname});

  IOUserModel.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    uname = json['uname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['uname'] = this.uname;
    return data;
  }
}
