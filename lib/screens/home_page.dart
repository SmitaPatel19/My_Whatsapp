import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_whatsapp/screens/status_home_page.dart';
import '../auth/controller/auth_controller.dart';
import 'camera_page_home.dart';
import 'call_home_page.dart';
import 'chats_home_page.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> with SingleTickerProviderStateMixin{
  late Timer timer;
  late TabController _tabController;

  updateUserPresence() {
    ref.read(authControllerProvider).updateUserPresence();
  }

  @override
  void initState() {
    updateUserPresence();
    timer = Timer.periodic(
      const Duration(minutes: 1),
          (timer) => setState(() {}),
    );
    super.initState();
    _tabController = TabController(length: 4,initialIndex: 1, vsync: this,);
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'My WhatsApp',
            style: TextStyle(letterSpacing: 1),
          ),
          elevation: 1,
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
            indicatorWeight: 3,
            indicatorColor: Colors.white,
            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
            splashFactory: NoSplash.splashFactory,
            tabs: [
              Tab(
                icon: Icon(Icons.groups),
              ),
              Tab(text: 'CHATS'),
              Tab(text: 'STATUS'),
              Tab(text: 'CALLS'),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            Center(child: Text("Community")),
            // Center(child: Text("Chats")),
            // //ChatsPage(chats: widget.chats,sourceChat: widget.sourceChat,),
            // Center(child: Text("Status")),
            // Center(child: Text("Calls")),
            ChatHomePage(),
            StatusHomePage(),
            CallHomePage(),
          ],
        ),
      ),
    );
  }
}