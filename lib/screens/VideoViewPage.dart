import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoViewPage extends StatefulWidget {
  const VideoViewPage ({Key? key,required this.videopath}) : super(key: key);
  final String videopath;

  @override
  State<VideoViewPage> createState() => _VideoViewPageState();
}

class _VideoViewPageState extends State<VideoViewPage> {

  late VideoPlayerController _playerController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _playerController=VideoPlayerController.file(File(widget.videopath))
    ..initialize().then((_) {
    // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
    setState(() {});
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
          title: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.clear)),

          actions: [
            IconButton(onPressed: (){

            }, icon: Icon(Icons.hd_outlined,size: 22,)),

            IconButton(onPressed: (){

            }, icon: Icon(Icons.crop_rotate,size: 22,)),

            IconButton(onPressed: (){

            }, icon: Icon(Icons.sticky_note_2_outlined,size: 22,)),

            IconButton(onPressed: (){

            }, icon: Icon(Icons.title_outlined,size: 23,)),

            IconButton(onPressed: (){

            }, icon: Icon(Icons.mode_edit_outlined,size: 22,)),
          ],
        ),

        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height-250,
                  child:  Stack(
                    children:[
                      _playerController.value.isInitialized
                        ? Container(
                            width: MediaQuery.of(context).size.width,
                          child: AspectRatio(
                              aspectRatio: _playerController.value.aspectRatio,
                              child: VideoPlayer(_playerController),
                            ),
                        )
                        : Container(color: Colors.white,),

                      Align(
                        alignment: Alignment.center,
                        child: CircleAvatar(
                          backgroundColor: Colors.black38,
                          radius: 33,
                          child: InkWell(
                            onTap: (){
                              setState(() {
                                _playerController.value.isPlaying
                                    ? _playerController.pause()
                                    : _playerController.play();
                              });
                            },
                            child: Icon(_playerController.value.isPlaying? Icons.pause:Icons.play_arrow,
                              color: Colors.white,
                              size: 50,
                            ),
                          ),
                        ),
                      ),
                  ]
                  ),
                ),

                Positioned(
                  bottom: 0,
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width-70,
                        child: Card(
                          margin: EdgeInsets.only(left: 2,right: 2,bottom: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          color: Colors.blueGrey.shade900,
                          child: TextFormField(
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                            ),
                            textAlignVertical: TextAlignVertical.center,
                            keyboardType: TextInputType.multiline,
                            maxLines: 5,
                            minLines: 1,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Add a caption...",
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                ),

                                prefixIcon: IconButton(
                                  onPressed: (){

                                  },
                                  icon: Icon(Icons.add_photo_alternate,size: 22,),
                                ),
                                prefixIconColor: Colors.white,

                                suffixIcon: IconButton(onPressed: (){

                                }, icon: Icon(Icons.replay_circle_filled_rounded,color: Colors.white,))
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 8,right:2,bottom: 8),
                        child: CircleAvatar(
                          backgroundColor: Colors.teal.shade700,
                          radius: 25,
                          child: IconButton(
                            onPressed: (){

                            },
                            icon: Icon(Icons.check),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              ]
          ),
        )
    );
  }
}
