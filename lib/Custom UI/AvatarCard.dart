import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_whatsapp/Model/ChatModel.dart';

class AvatarCard extends StatelessWidget {
  const AvatarCard({super.key, required this.contacts});
  final ChatModel contacts;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8 ,horizontal: 13),
      child: Column(
        children: [
          Stack(
            children: [
              CircleAvatar(
                backgroundColor: Colors.blueGrey.shade200,
                radius: 24,
                child: SvgPicture.asset(
                  "assets/person.svg",
                  color: Colors.white,
                  height: 41,
                  width: 41,
                ),
              ),

             Positioned(
                  bottom: -2,
                  right: -2,
                  child: CircleAvatar(
                      radius: 11,
                      backgroundColor: Colors.white,
                      child: SvgPicture.asset("assets/close.svg",color: Colors.blueGrey.shade600,)
                  )
              ),
            ],
          ),

          SizedBox(height: 4,),

          Text(contacts.name ?? "",style: TextStyle(
            fontSize: 13,
            color: Colors.blueGrey.shade600
          ),
          ),
        ],
      ),
    );
  }
}
