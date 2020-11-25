import 'package:flutter/material.dart';
import 'package:hello/pages/chat_Item.dart';
import 'package:hello/pages/models/chat_model.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatModel> list = ChatModel.list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        //elevation:10,
        title: Text(
          "Hello",
          style: TextStyle(
              // fontSize:32,
              ),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.filter, color: Colors.white), onPressed: null)
        ],
      ),
      body: Column(children: <Widget>[
        Container(
          height: 38,
          margin: EdgeInsets.all(15),
          padding: EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.black45,
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
          ),
          child: TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(Icons.search, color: Colors.white54),
                hintText: "Search",
                hintStyle: TextStyle(
                  color: Colors.white54,
                )),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => ChatItemPage(),
                    ),
                  );
                },
                leading: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    image: DecorationImage(
                        image: AssetImage("assets/teacher.jpg")),
                  ),
                ),
                title: Text(
                  list[index].contact.name,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                subtitle:
                /*
                 list[index].isTyping
                    ? Row(
                      children:<Widget>[
                        SpinKitThreeBounce(
                          color: Colors.white,
                          size: 20.0,
                        ),
                      ],
                    )
                */ 
                 Row(
                  children: <Widget>[
                    Text(list[index].lastMessage,
                        style: TextStyle(
                          color: Colors.white54,
                        )),
                    SizedBox(
                      width: 25,
                    ),
                    Text(list[index].lastMessageTime + "days ago",
                        style: TextStyle(
                          color: Colors.white54,
                        )),
                  ],
                ),
              );
            },
          ),
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
          color: Colors.indigo,
        ),
        backgroundColor: Colors.white,
      ),
      bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          currentIndex: 2,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.indigo,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.black54,
          unselectedItemColor: Colors.white,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text(""),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              title: Text(""),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              title: Text(""),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              title: Text(""),
            ),
          ]),
    );
  }
}

