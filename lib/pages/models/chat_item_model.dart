class ChatItemModel {
  final String senderId ;
  final String message;

ChatItemModel({this.senderId, this.message});
static List<ChatItemModel> list = [

  ChatItemModel(
    senderId: "1",
    message: "salut le boss"
    ),
    ChatItemModel(
    senderId: "1",
    message: "ca va ?"
    ),
    ChatItemModel(
    senderId: "1",
    message: "oui salut bro commemt"
    ),
    ChatItemModel(
    senderId: "2",
    message: "oui ca va !"
    ),
     ChatItemModel(
    senderId: "2",
    message: "ok cool je suis fatigue !"
    ),
];
}