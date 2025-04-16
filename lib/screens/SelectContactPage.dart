import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_whatsapp/widgets/ButtonCard.dart';
import 'package:my_whatsapp/widgets/contact_card.dart';
import 'package:my_whatsapp/Model/ChatModel.dart';
import 'package:my_whatsapp/screens/GroupPage.dart';

class SelectContactPage extends StatefulWidget {

  const SelectContactPage({super.key});

  @override
  State<SelectContactPage> createState() => _SelectContactPageState();
}

class _SelectContactPageState extends State<SelectContactPage> {
  @override
  Widget build(BuildContext context) {

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
    return Scaffold(
        appBar: AppBar(
          title: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Select contact",style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w500,
              ),),
              SizedBox(height: 5,),
              Text("1140 contacts",style: TextStyle(
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
            PopupMenuButton<String>(
              onSelected: (value){
                print(value);
              },
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(child: Text("Invite a fiend")),
                  PopupMenuItem(child: Text("Contacts")),
                  PopupMenuItem(child: Text("Refresh")),
                  PopupMenuItem(child: Text("Help")),
                ];
              },
            ),
          ],
        ),

      body: ListView.builder(
          itemCount: contacts.length+ 3, // Set the itemCount to the number of items you want to display
          itemBuilder: (context, index) {
            if (index == 0) {
              return InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (builder) => GroupPage()));
                },
                  child: ButtonCard(name: "New group", icon: Icons.group)
              );
            } else if (index == 1) {
              return InkWell(
                onTap: (){

                },
                child: ButtonCard(
                  name: "New contact",
                  icon: Icons.person_add,
                  iconButton: IconButton(
                    onPressed: () {

                    },
                    icon: Icon(
                      Icons.qr_code,
                      size: 25,
                      color: Colors.blueGrey.shade400,
                    ),
                  ),
                ),
              );
            } else if (index == 2) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: (){

                    },
                      child: ButtonCard(name: "New community", icon: Icons.groups_rounded)),

                  Padding(
                    padding: const EdgeInsets.only(left: 15,bottom: 5,top: 15),
                    child: Text("Contacts on WhatsApp",style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.blueGrey.shade500
                    ),),
                  ),
                ],
              );
            }

            // return ContactCard(contacts: contacts[index-3]);
          }
      )
    );
  }
}

