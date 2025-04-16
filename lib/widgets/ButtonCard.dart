import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';
//import 'package:my_whatsapp/model/ChatModel.dart';

class ButtonCard extends StatelessWidget {
  const ButtonCard({super.key,required this.name,required this.icon,this.iconButton});
  final String name;
  final IconData icon;
  final IconButton? iconButton;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.teal.shade500,
        radius: 20,
        child: Icon(icon,size: 25,color: Colors.white,),
      ),

      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name ,style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
          ),
        if (iconButton != null) iconButton!,
        ],
      ),

    );
  }
}
