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
  String createdAt;
  String sender;
  String receiver;
  String senderTitle;
  String receiverTitle;
  String senderProfilePic;
  String receiverProfilePic;
  int receiverStatus;
  int senderStatus;

  Items(
      {this.room,
      this.createdAt,
      this.sender,
      this.receiver,
      this.senderTitle,
      this.receiverTitle,
      this.senderProfilePic,
      this.receiverProfilePic,
      this.receiverStatus,
      this.senderStatus});

  Items.fromJson(Map<String, dynamic> json) {
    room = json['room'];
    createdAt = json['created_at'];
    sender = json['sender'];
    receiver = json['receiver'];
    senderTitle = json['sender_title'];
    receiverTitle = json['receiver_title'];
    senderProfilePic = json['sender_profile_pic'];
    receiverProfilePic = json['receiver_profile_pic'];
    receiverStatus = json['receiver_status'];
    senderStatus = json['sender_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['room'] = this.room;
    data['created_at'] = this.createdAt;
    data['sender'] = this.sender;
    data['receiver'] = this.receiver;
    data['sender_title'] = this.senderTitle;
    data['receiver_title'] = this.receiverTitle;
    data['sender_profile_pic'] = this.senderProfilePic;
    data['receiver_profile_pic'] = this.receiverProfilePic;
    data['receiver_status'] = this.receiverStatus;
    data['sender_status'] = this.senderStatus;
    return data;
  }
}
