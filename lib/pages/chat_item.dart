import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hello/pages/models/chat_item_model.dart';
import 'package:hello/pages/models/chat_model.dart';

class ChatItemPage extends StatefulWidget {
  @override
  _ChatItemPageState createState() => _ChatItemPageState();
}

class _ChatItemPageState extends State<ChatItemPage> {
  ChatModel currentChat = ChatModel.list.elementAt(0);
  String currentUser = "1";
  String pairId = "2";
  List<ChatItemModel> chatItems = ChatItemModel.list;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        elevation: 0,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        title: Text("${currentChat.contact.name}"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        ],
      ),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: chatItems.length,
              reverse: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                  ),
                  child: Row(
                    mainAxisAlignment: chatItems[index].senderId == currentUser
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                    children: <Widget>[
                      _isFirstMessage(chatItems, index) &&
                              chatItems[index].senderId == pairId
                          ? Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/teacher.jpg")),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(100),
                                ),
                              ),
                            )
                          : Container(width: 30, height: 30),
                      Container(
                        /*constraints: BoxConstraints(
                                maxWidth:MadiaQuery.of(context).size.width * .7.
                              ),
                              */
                        padding: EdgeInsets.symmetric(
                          vertical: 6,
                          horizontal: 12,
                        ),
                        margin: EdgeInsets.symmetric(
                          vertical: 6,
                          horizontal: 12,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(11),
                                bottomRight: Radius.circular(11),
                                topLeft: Radius.circular(
                                    _isFirstMessage(chatItems, index) ? 0 : 11),
                                bottomLeft: Radius.circular(11)),
                            color: chatItems[index].senderId == currentUser
                                ? Colors.black45
                                : Colors.black87),
                        child: Text("${chatItems[index].message}",
                            style:
                                TextStyle(color: Colors.white, fontSize: 16)),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          if (currentChat.isTyping)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SpinKitThreeBounce(
                        color: Colors.white,
                        size: 20.0,
                      ),
                    ],
                  ),
                  Text("${currentChat.contact.name} is typing...")
                ],
              ),
            ),
        ],
      ),
      bottomNavigationBar: _buildInput(),
    );
  }

  Widget _buildInput() {
    return Container(
        margin: EdgeInsets.all(12),
        //padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Colors.black45,
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            )),
        child: Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: Padding(
                    padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                    child: Icon(
                      Icons.mode_edit,
                    ),
                  ),
                  hintText: "Type something...",
                  hintStyle: TextStyle(
                    color: Colors.white30,
                  ),
                ),
              ),
            ),
            IconButton(
                icon: Icon(
                  Icons.attach_file,
                  color: Colors.blue,
                ),
                onPressed: null),
            IconButton(
                icon: Icon(
                  Icons.alternate_email,
                  color: Colors.blue,
                ),
                onPressed: null)
          ],
        ));
  }

  _isFirstMessage(List<ChatItemModel> chatItems, int index) {
    return (chatItems[index].senderId !=
            chatItems[index - 1 < 0 ? 0 : index - 1].senderId) ||
        index == 0;
  }
}
