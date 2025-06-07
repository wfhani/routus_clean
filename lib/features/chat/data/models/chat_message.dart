class ChatMessage {
  int? id;
  String? senderId;
  String? receiverId;
  String? content;
  String? messageType;
  String? timestamp;
  String? senderType;
  String? receiverType;
  String? createdAt;
  String? updatedAt;

  ChatMessage(
      {this.id,
        this.senderId,
        this.receiverId,
        this.content,
        this.messageType,
        this.timestamp,
        this.senderType,
        this.receiverType,
        this.createdAt,
        this.updatedAt});

  ChatMessage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    senderId = json['sender_id']?.toString();
    receiverId = json['receiver_id']?.toString();
    content = json['content'];
    messageType = json['message_type'];
    timestamp = json['timestamp'];
    senderType = json['sender_type'];
    receiverType = json['receiver_type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['sender_id'] = senderId;
    data['receiver_id'] = receiverId;
    data['content'] = content;
    data['message_type'] = messageType;
    data['timestamp'] = timestamp;
    data['sender_type'] = senderType;
    data['receiver_type'] = receiverType;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
