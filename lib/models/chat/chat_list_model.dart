class ChatListModel {
  int response;
  int totalPages;
  List<Items> items;

  ChatListModel({this.response, this.totalPages, this.items});

  ChatListModel.fromJson(Map<String, dynamic> json) {
    response = json['response'];
    totalPages = json['total_pages'];
    if (json['items'] != null) {
      items = new List<Items>();
      json['items'].forEach((v) {
        items.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['response'] = this.response;
    data['total_pages'] = this.totalPages;
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String room;
  String sender;
  String receiver;
  String createdAt;
  String senderTitle;
  Null profileImg;
  int isOnline;

  Items(
      {this.room,
      this.sender,
      this.receiver,
      this.createdAt,
      this.senderTitle,
      this.profileImg,
      this.isOnline});

  Items.fromJson(Map<String, dynamic> json) {
    room = json['room'];
    sender = json['sender'];
    receiver = json['receiver'];
    createdAt = json['created_at'];
    senderTitle = json['sender_title'];
    profileImg = json['profile_img'];
    isOnline = json['isOnline'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['room'] = this.room;
    data['sender'] = this.sender;
    data['receiver'] = this.receiver;
    data['created_at'] = this.createdAt;
    data['sender_title'] = this.senderTitle;
    data['profile_img'] = this.profileImg;
    data['isOnline'] = this.isOnline;
    return data;
  }
}
