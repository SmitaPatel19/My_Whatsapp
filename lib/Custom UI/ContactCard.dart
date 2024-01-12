import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_whatsapp/Model/ChatModel.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({super.key,required this.contacts});
  final ChatModel contacts;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 45,
        width: 50,
        child: Stack(
          children: [
            CircleAvatar(
              backgroundColor: Colors.blueGrey.shade200,
              radius: 20,
              child: SvgPicture.asset(
                "assets/person.svg",
                color: Colors.white,
                height: 35,
                width: 35,
              ),
            ),

            contacts.select ?? false ? Positioned(
                bottom: 2,
                right: 4,
                child: CircleAvatar(
                  radius: 11,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.check_circle,color: Colors.teal,size: 19,))
            ) : Container(),
          ],
        ),
      ),

      title: Text(contacts.name ?? "",style: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w500,
      ),
      ),

      subtitle: Text(contacts.status ?? "",),
    );
  }
}
