import 'package:flutter/material.dart';
import 'package:my_whatsapp/Custom%20UI/ChatCard.dart';
import 'package:my_whatsapp/Model/ChatModel.dart';
import 'package:my_whatsapp/Pages/SelectContactPage.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({super.key, required this.chats, required this.sourceChat});
  final List<ChatModel> chats ;
  final ChatModel sourceChat;

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

// List<ChatModel> chats = [
//   ChatModel(name: "You",
//       icon: "person.svg",
//       isGroup: false,
//       time: "5: 15 pm",
//       currentmsg: "Hii",),
//
//   ChatModel(name: "Group",
//       icon: "group.svg",
//       isGroup: true,
//       time: "2: 35 pm",
//       currentmsg: "Smita: Hii Everyone"),
//   ChatModel(name: "Anika💕",
//       icon: "person.svg",
//       isGroup: false,
//       time: "2: 28 pm",
//       currentmsg: "Awesome😘"),
//   ChatModel(name: "Janhvi❤️❤️",
//       icon: "person.svg",
//       isGroup: false,
//       time: "1: 50 pm",
//       currentmsg: "Good"),
// ];

class _ChatsPageState extends State<ChatsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFF075E55),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (builder) => SelectContactPage()));
          },
          child: Icon(Icons.chat),
        ),

      body: ListView.builder(
        itemCount: widget.chats.length,
          itemBuilder: (context,index) =>
           ChatCard(chatModel: widget.chats[index],sourceChat: widget.sourceChat,),
      ),
    );
  }
}
