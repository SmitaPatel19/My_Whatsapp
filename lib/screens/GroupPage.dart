import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_whatsapp/widgets/AvatarCard.dart';
//import 'package:my_whatsapp/Custom%20UI/ButtonCard.dart';
import 'package:my_whatsapp/widgets/contact_card.dart';
import 'package:my_whatsapp/Model/ChatModel.dart';

class GroupPage extends StatefulWidget {

  const GroupPage({super.key});

  @override
  GroupPageState createState() => GroupPageState();
}

class GroupPageState extends State<GroupPage> {

  List<ChatModel> contacts = [
    ChatModel(
        name: "You",
        status: "Meassage yourself"
    ),
    ChatModel(
        name: "......",
        status: "Hey there! I am using WhatsApp."
    ),
    ChatModel(
        name: "Anika💕",
        status: "Hey there! I am using WhatsApp."
    ),
    ChatModel(
        name: "Janhvi❤️❤️",
        status: "Love Yourself"
    ),
    ChatModel(
        name: "Arya😘",
        status: "Only WhatsApp, no calls❌"
    )
  ];
  List<ChatModel> groups = [];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("New group",style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w500,
              ),),
              SizedBox(height: 5,),
              Text("Add participants",style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),),
            ],
          ),

          actions: [
            IconButton(
              onPressed: (){

              },
              icon: Icon(Icons.search),
            ),
          ],
        ),

        body: Stack(
          children: [
            ListView.builder(
                itemCount: contacts.length + 1,// Set the itemCount to the number of items you want to display
                itemBuilder: (context, index) {

                  if(index==0){
                    return Container(
                      height: groups.length > 0 ? 90 : 10,
                    );
                  }
                    return InkWell(
                      onTap: (){
                        if(contacts[index-1].select == false){
                          setState(() {
                            groups.add(contacts[index -1]);
                            contacts[index-1].select = true;
                          });

                        }
                        else{
                          setState(() {
                            contacts[index-1].select = false;
                            groups.remove(contacts[index -1]);
                          });
                        }
                      },
                        // child: ContactCard(contacts: contacts[index -1])
                    );
                }
            ),

            groups.length>0 ? Column(
              children: [
                Container(
                  height: 83,
                  color: Colors.white,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: contacts.length,
                    itemBuilder: (context,index) {
                      if(contacts[index].select == true){
                        return InkWell(
                          onTap: (){
                            setState(() {
                              groups.remove(contacts[index]);
                              contacts[index].select = false;
                            });
                          },
                          child: AvatarCard(
                            contacts: contacts[index],
                          ),
                        );
                      }
                      else{
                        return Container();
                      }
                    }
                  ),
                ),

                Divider(thickness: 1,),
              ],
            ) : Container(),
          ],
        )
    );
  }
}

