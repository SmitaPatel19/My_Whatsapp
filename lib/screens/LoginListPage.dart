import 'package:flutter/material.dart';
import 'package:my_whatsapp/widgets/ButtonCard.dart';
import 'package:my_whatsapp/widgets/contact_card.dart';
import 'package:my_whatsapp/Model/ChatModel.dart';
import 'package:my_whatsapp/screens/home_page.dart';

class LoginListPage extends StatefulWidget {
  const LoginListPage({super.key});

  @override
  State<LoginListPage> createState() => _LoginListPageState();
}

class _LoginListPageState extends State<LoginListPage> {

  late ChatModel sourceChat;

  List<ChatModel> chats = [
    ChatModel(name: "You",
      icon: "person.svg",
      isGroup: false,
      time: "5: 15 pm",
      currentmsg: "Hii",
      id: 1,),
    // ChatModel(name: "Group",
    //     icon: "group.svg",
    //     isGroup: true,
    //     time: "2: 35 pm",
    //     currentmsg: "Smita: Hii Everyone"),
    ChatModel(name: "Anika💕",
        icon: "person.svg",
        isGroup: false,
        time: "2: 28 pm",
        currentmsg: "Awesome😘",
        id: 2,),
    ChatModel(name: "Janhvi❤️❤️",
        icon: "person.svg",
        isGroup: false,
        time: "1: 50 pm",
        currentmsg: "Good",
        id: 3,),
    ChatModel(name: "Shailly",
      icon: "person.svg",
      isGroup: false,
      time: "5: 59 pm",
      currentmsg: "done",
      id: 4,),
    ChatModel(name: "Niyati",
      icon: "person.svg",
      isGroup: false,
      time: "1: 15 pm",
      currentmsg: "tum pagl ho",
      id: 5,),
    ChatModel(name: "Pragati",
      icon: "person.svg",
      isGroup: false,
      time: "00: 15 pm",
      currentmsg: "Matrix multiplication",
      id: 6,),
    ChatModel(name: "Tanishka",
      icon: "person.svg",
      isGroup: false,
      time: "10: 38 pm",
      currentmsg: "Hmmm..",
      id: 7,),
    ChatModel(name: "Sapna",
      icon: "person.svg",
      isGroup: false,
      time: "yesterday",
      currentmsg: "Kya hua?",
      id: 8,),
    ChatModel(name: "Sarah",
      icon: "person.svg",
      isGroup: false,
      time: "5: 15 pm",
      currentmsg: "Konsi code likhna h?",
      id: 9,),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
      ),
      body: ListView.builder(
        itemCount: chats.length,
          itemBuilder: (context,index) => InkWell(
            onTap: (){
              sourceChat = chats.removeAt(index);
              Navigator.push(context, MaterialPageRoute(builder: (builder) => 
              HomePage(),
                // HomePage(chats: chats,sourceChat: sourceChat,)
              ));
            },
              // child: ContactCard(contacts: chats[index]),
          ),
      ),
    );
  }
}

