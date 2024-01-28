import 'package:flutter/material.dart';
import 'package:my_whatsapp/Model/ChatModel.dart';
import 'package:my_whatsapp/Pages/CameraPage.dart';
import 'package:my_whatsapp/Pages/ChatsPage.dart';

class HomePage extends StatefulWidget {

  const HomePage({super.key,
    // required this.chats,
    // required this.sourceChat
  });
  // final List<ChatModel> chats ;
  // final ChatModel sourceChat;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this,initialIndex: 1,);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("My WhatsApp"),
          actions: [
            IconButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => CameraPage()));
            }, icon: Icon(Icons.camera_alt_outlined,),),

            IconButton(onPressed: (){

            }, icon: Icon(Icons.search)),

            PopupMenuButton<String>(

                onSelected: (value){
                  print(value);
                },
                itemBuilder: (BuildContext context){
              return [
                PopupMenuItem(child: Text("New group"),value: "New group"),
                PopupMenuItem(child: Text("New broadcast"),value: "New broadcast",),
                PopupMenuItem(child: Text("Linked devices"),value: "Linked devices",),
                PopupMenuItem(child: Text("Starred messages"),value: "Starred messages",),
                PopupMenuItem(child: Text("Payments"),value: "Payments",),
                PopupMenuItem(child: Text("Settings"),value: "Settings",),
              ];
            }),
          ],

        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: [
              Tab(
                icon: Icon(Icons.groups),
              ),
            Tab(
              text: "Chats",
            ),
            Tab(
              text: "Status",
            ),
            Tab(
              text: "Calls",
            )
          ],
        ),
      ),

      body: TabBarView(
        controller: _tabController,
        children: [
          Center(child: Text("Community")),
          //ChatsPage(chats: widget.chats,sourceChat: widget.sourceChat,),
          Center(child: Text("Status")),
          Center(child: Text("Calls")),
        ],
      ),
    );
  }
}
