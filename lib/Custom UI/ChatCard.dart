import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_whatsapp/Model/ChatModel.dart';
//import 'package:my_whatsapp/Pages/ChatsPage.dart';
import 'package:my_whatsapp/Pages/ChattingsPage.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({super.key,required this.chatModel, required this.sourceChat});
  final ChatModel chatModel;
  final ChatModel sourceChat;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => 
        ChattingsPage(chatModel: chatModel,sourceChat: sourceChat,)));
      },
      child: ListTile(

          leading: CircleAvatar(
            backgroundColor: Colors.blueGrey.shade200,
            radius: 25,
            child: SvgPicture.asset(
              chatModel.isGroup ?? false ?  "assets/groups.svg" : "assets/person.svg",
              color: Colors.white,
              height: 38,
              width: 38,
            ),
          ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Text(chatModel.name ?? "",style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),),

            Text(chatModel.time ?? "",style: TextStyle(
                fontSize: 12,
                color: Colors.grey
            ),),
          ],
        ),
        subtitle: Row(
          children: [
            Icon(Icons.done_all_sharp,size: 18,color: Colors.blue.shade400,),
            SizedBox(width: 4,),
            Text(chatModel.currentmsg ?? ""),
          ],
        ),
      ),
    );
  }
}
