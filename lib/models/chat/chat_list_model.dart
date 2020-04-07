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

  Items({this.room, this.sender, this.receiver, this.createdAt});

  Items.fromJson(Map<String, dynamic> json) {
    room = json['room'];
    sender = json['sender'];
    receiver = json['receiver'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['room'] = this.room;
    data['sender'] = this.sender;
    data['receiver'] = this.receiver;
    data['created_at'] = this.createdAt;
    return data;
  }
}
