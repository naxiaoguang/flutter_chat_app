class ConversationModel {
  int response;
  int totalPages;
  List<Items> items;

  ConversationModel({this.response, this.totalPages, this.items});

  ConversationModel.fromJson(Map<String, dynamic> json) {
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
  String sender;
  String message;
  String createdAt;

  Items({this.sender, this.message, this.createdAt});

  Items.fromJson(Map<String, dynamic> json) {
    sender = json['sender'];
    message = json['message'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sender'] = this.sender;
    data['message'] = this.message;
    data['created_at'] = this.createdAt;
    return data;
  }
}
