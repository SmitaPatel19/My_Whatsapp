import 'package:flutter/material.dart';

class OwnMessageCard extends StatelessWidget {
  const OwnMessageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width-45,
          ),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          margin: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
          color: Color(0xffdcf8c6),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10,right: 85,bottom: 8,top: 05),
                child: Text("Hiii",style: TextStyle(
                  fontSize: 16,
                ),
                ),
              ),
              Positioned(
                bottom: 1,
                right: 10,
                child: Row(
                  children: [
                    Text("11:02 pm",style:TextStyle(
                      fontSize: 11,
                      color: Colors.grey.shade600,
                    ),),

                    SizedBox(width: 5,),

                    Icon(Icons.done_all,size: 18,),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
