import 'contact_model.dart';

class ChatModel {
  final bool isTyping;
  final String lastMessage;
  final String lastMessageTime;
  final ContactModel contact;

  ChatModel(
      {this.isTyping, this.lastMessage, this.lastMessageTime, this.contact});
  static List<ChatModel> list = [
    ChatModel(
      isTyping: true,
      lastMessage: "hello!",
      lastMessageTime: "2d",
      contact: ContactModel(name: "Sylvain"),
    ),
    ChatModel(
      isTyping: true,
      lastMessage: "Cc",
      lastMessageTime: "2d",
      contact: ContactModel(name: "Odek"),
    ),
  ];
}
