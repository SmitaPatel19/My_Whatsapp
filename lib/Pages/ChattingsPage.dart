import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_whatsapp/Custom%20UI/OwnMessageCard.dart';
import 'package:my_whatsapp/Custom%20UI/ReplyCard.dart';
import 'package:my_whatsapp/Model/ChatModel.dart';
import 'package:my_whatsapp/Pages/CameraPage.dart';
// import 'package:socket_io_client/socket_io_client.dart' as IO;


class ChattingsPage extends StatefulWidget {
  const ChattingsPage({super.key, required this.chatModel, required this.sourceChat});
  final ChatModel chatModel;
  final ChatModel sourceChat;

  @override
  State<ChattingsPage> createState() => _ChattingsPageState();
}

class _ChattingsPageState extends State<ChattingsPage> {
  bool show = false;
  FocusNode focusNode = FocusNode();
  // IO.Socket socket=IO.io("http://192.168.56.1:5000",<String, dynamic>{
  //   "transports":["websocket"],
  //   "autoConnect": false,
  // });
  // IO.Socket socket = IO.io('http://localhost:3000',
  //     IO.OptionBuilder().setTransports(['websocket']).build());
  bool sendButton=false;
  
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
      super.initState();
      // connect();
      focusNode.addListener(() {
        if(focusNode.hasFocus){
          setState(() {
            show=false;
          });
        }
      });
  }
  
  // connect(){
  //   // socket=IO.io("http://192.168.56.1:3000",<String, dynamic>{
  //   //   "transports":["websocket"],
  //   //   "autoConnect": false,
  //   // });
  //
  //   socket.connect();
  //   socket.emit("signin", widget.sourceChat.id);
  //   socket.onConnect((data) {
  //     print("Connection established");
  //     socket.on("message", (data) => {
  //
  //     });
  //   });
  //   // print(socket.connected);
  //
  //   socket.onConnectError((data) => print("Connect Error: $data"));
  //   socket.onDisconnect((data) => print("Socket.IO server disconnected"));
  // }

  // void sendMessage(String message,int sourceId,int targetId){
  //   socket.emit("message",{"message": message, "sourceId" : sourceId, "targetId" : targetId});
  // }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        Image.asset('assets/whatsapp background image.png',
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),

        Scaffold(

          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leadingWidth: 70,
            titleSpacing: 0,
            leading: InkWell(
              onTap: (){
                  Navigator.pop(context);
              },
              child: Row(
                children: [

                  Icon(Icons.arrow_back,size: 24,),

                  CircleAvatar(
                    child: SvgPicture.asset(
                      widget.chatModel.isGroup ?? false ?  "assets/groups.svg" : "assets/person.svg",
                      color: Colors.white,
                      height: 35,
                      width: 35,
                    ),
                    radius: 19,
                    backgroundColor: Colors.blueGrey.shade100,
                  ),
                ],
              ),
            ),

            title: InkWell(
              onTap: (){

              },
              child: Container(
                margin: EdgeInsets.only(left: 3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(widget.chatModel.name ?? "",style: TextStyle(
                      fontSize: 18.5,
                    ),),

                    // SizedBox(height: 3.5,),

                    Text("last seen today at 3:15 pm",style: TextStyle(
                      fontSize: 13,
                      color: Colors.white70,
                      fontWeight: FontWeight.normal
                    ),),
                  ],
                ),
              ),
            ),

            actions: [
              IconButton(onPressed: (){

              }, icon: Icon(Icons.videocam_rounded,size: 26,)),

              IconButton(onPressed: (){

              }, icon: Icon(Icons.call,size: 23,)),

              PopupMenuButton<String>(
                onSelected: (value){
                  print(value);
                },
                  itemBuilder: (BuildContext context){
                return [
                  PopupMenuItem(
                    child: Text("View contact"),
                    value: "View contact",
                  ),
                  PopupMenuItem(
                      child: Text("Media, links, and docs"),
                      value: "Media, links, and docs",
                  ),
                  PopupMenuItem(
                    child: Text("Search"),
                    value: "Search",
                  ),
                  PopupMenuItem(
                    child: Text("Mute notifications"),
                    value: "Mute notifications",
                  ),
                  PopupMenuItem(
                    child: Text("Disappearing messages"),
                    value: "Disappearing messages",
                  ),
                  PopupMenuItem(
                    child: Text("Wallpaper"),
                    value: "Wallpaper",
                  ),
                  PopupMenuItem(
                    child: Text("More"),
                    value: "More",
                  )
                ];
              }),
            ],
          ),

          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: WillPopScope(
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height-159,
                    child: ListView(
                      shrinkWrap: true,
                      children: [

                        OwnMessageCard(),
                        ReplyCard(),
                        OwnMessageCard(),
                        ReplyCard(),
                        OwnMessageCard(),
                        ReplyCard(),
                        ReplyCard(),
                        OwnMessageCard(),
                        ReplyCard(),
                        OwnMessageCard(),
                        ReplyCard(),
                        OwnMessageCard(),
                        ReplyCard(),
                        OwnMessageCard(),
                        ReplyCard(),
                        OwnMessageCard(),
                        OwnMessageCard(),
                        OwnMessageCard(),
                        OwnMessageCard(),
                        OwnMessageCard(),
                        OwnMessageCard(),
                        ReplyCard(),
                        OwnMessageCard(),
                        ReplyCard(),
                        OwnMessageCard(),
                        ReplyCard(),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                            children: [
                              Container(
                                //margin: EdgeInsets.only(left: 4,bottom: 10),
                                width : MediaQuery.of(context).size.width - 60,
                                  child: Card(
                                    margin: EdgeInsets.only(left: 2,right: 2,bottom: 8),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: TextFormField(
                                      controller: _controller,
                                      focusNode: focusNode,
                                      textAlignVertical: TextAlignVertical.center,
                                      cursorColor: Colors.teal.shade400,
                                      cursorHeight: 25,
                                      style: TextStyle(fontSize: 18,),
                                      keyboardType: TextInputType.multiline,
                                      maxLines: 5,
                                      minLines: 1,

                                      onChanged: (value){
                                        if(value.length>0){
                                          setState(() {
                                            sendButton=true;
                                          });
                                        }
                                        else{
                                          setState(() {
                                            sendButton=false;
                                          });
                                        }
                                      },

                                      onTap: (){
                                        if(show){
                                          setState(() {
                                            show=!show;
                                          });
                                        }
                                      },
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Message",
                                        hintStyle: TextStyle(
                                            color: Colors.blueGrey.shade400,
                                            fontSize: 19,
                                        ),

                                        prefixIcon: IconButton(
                                          onPressed: (){
                                            focusNode.unfocus();
                                            focusNode.canRequestFocus = false;
                                            setState(() {
                                              show = !show;
                                            });
                                            },
                                          icon: Icon(Icons.emoji_emotions_outlined,size: 25,),
                                        ),
                                        prefixIconColor: Colors.blueGrey.shade400,

                                        suffixIcon: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            IconButton(
                                              onPressed: (){
                                                showModalBottomSheet(
                                                  backgroundColor: Colors.transparent,
                                                    context: context,
                                                    builder: (builder) => bottomsheet());
                                              },
                                              icon: Icon(Icons.attach_file,size: 23,),
                                            ),

                                            IconButton(
                                                onPressed: (){

                                                },
                                                icon: Icon(Icons.currency_rupee,size: 23,)
                                            ),

                                            IconButton(
                                              onPressed: (){
                                                Navigator.push(context, MaterialPageRoute(builder: (context) => CameraPage()));
                                              },
                                                icon: Icon(Icons.camera_alt,size: 23,)
                                            ),
                                          ],
                                        ),
                                        suffixIconColor: Colors.blueGrey.shade400,
                                        contentPadding: EdgeInsets.all(5),
                                      ),
                                    ),
                                  )
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 2,right:2,bottom: 8),
                                child: CircleAvatar(
                                  backgroundColor: Colors.teal.shade500,
                                  radius: 25,
                                  child: IconButton(
                                    onPressed: (){
                                      if(sendButton==true){
                                        // sendMessage(_controller.text, widget.sourceChat.id!, widget.chatModel.id!);
                                        _controller.clear();
                                      }
                                    },
                                    icon: Icon(sendButton? Icons.send : Icons.mic),
                                  ),
                                ),
                              ),
                            ],
                        ),
                        show ? EmojiSelect() : Container(),
                      ],
                    ),
                    ),
                ],
              ),
              onWillPop: (){
                if(show){
                  setState(() {
                    show=false;
                  }
                  );
                }
                else{
                  Navigator.pop(context);
                }
                return Future.value(false);
              },
            ),
          ),


        ),
      ],
    );
  }

  Widget bottomsheet(){
    return Container(
      height: 380,
      child: Card(
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        margin: EdgeInsets.only(left: 15,bottom: 60,right: 15),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(35.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(

                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  iconCreation(Icons.insert_drive_file, Colors.deepPurpleAccent , "Document"),
                  iconCreation(Icons.camera_alt, Color(0xFFff1493), "Camera"),
                  iconCreation(Icons.photo, Colors.purple, "Gallary"),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  iconCreation(Icons.headphones, Colors.deepOrange, "Audio"),
                  iconCreation(Icons.location_on, Colors.green.shade800, "Location"),
                  iconCreation(Icons.currency_rupee_rounded, Colors.teal, "Payment"),
                ],
              ),

              Row(

                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  iconCreation(Icons.person, Colors.blue, "Contact"),
                  iconCreation(Icons.bar_chart, Colors.teal, "Poll"),
                  SizedBox(width: 60,),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget iconCreation(IconData icon,Color color,String text){
    return Column(
      children: [
        CircleAvatar(
          radius: 28,
          backgroundColor: color,
          child: Icon(
            icon,
            color: Colors.white,
            size: 25,
          ),
        ),
        Text(text),
      ],
    );
  }

  Widget EmojiSelect(){
    return SizedBox(
      height: 285,
      child: EmojiPicker(
        textEditingController: _controller,
        config: Config(
          columns : 7,
          bgColor: Colors.teal.shade800,
        ),
        onEmojiSelected: (emoji, catagory){
        print(emoji);
        setState(() {
          //_controller.text = _controller.text + emoji?.emoji;
        });
      }),
    );
  }
}
