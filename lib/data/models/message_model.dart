class MessageModel {
  MessageModel({
    this.text,
    this.senderId,
    this.receiverId,
    this.dateTime,
  });

  String? senderId;
  String? receiverId;
  String? dateTime;
  String? text;

  MessageModel.fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      senderId = json['senderId'];
      receiverId = json['receiverId'];
      dateTime = json['dateTime'];
      text = json['text'];
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'receiverId': receiverId,
      'dateTime': dateTime,
      'text': text,
    };
  }
}
