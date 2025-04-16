import 'dart:math';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:my_whatsapp/screens/camera_view_page2.dart';
//import 'package:my_whatsapp/screens/VideoLayout.dart';
import 'package:my_whatsapp/screens/VideoViewPage.dart';
// import 'package:path/path.dart' as path;
//import 'package:path/path.dart';
//import 'package:path_provider/path_provider.dart';

List<CameraDescription>  ? cameras;

class CameraLayout extends StatefulWidget {
  const CameraLayout({super.key});

  @override
  State<CameraLayout> createState() => _CameraLayoutState();
}

class _CameraLayoutState extends State<CameraLayout> with SingleTickerProviderStateMixin{

  //late TabController _tabController;
  late CameraController _cameraController;
  late Future<void> cameraValue;
  bool isRecording=false;
  //String videopath="";
  bool flash=false;
  bool iscamerafront=true;
  double transform=0;


  @override
  void initState() {

    super.initState();
    //_tabController = TabController(length: 2, vsync: this,initialIndex: 1,);
    if (cameras != null && cameras!.isNotEmpty) {
      _cameraController = CameraController(cameras![0], ResolutionPreset.high, enableAudio: true);
      cameraValue = _cameraController.initialize();
    }
  }

  @override
  void dispose() {

    super.dispose();
    //_cameraController?.dispose();
    _cameraController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.clear,color: Colors.white,)
        ),

        actions: [
          IconButton(onPressed: (){
            setState(() {
              flash = !flash;
            });
            flash ? _cameraController.setFlashMode(FlashMode.torch)
                  : _cameraController.setFlashMode(FlashMode.off);
          }, icon: Icon(flash? Icons.flash_on : Icons.flash_off),color: Colors.white,),
        ],
      ),

      body: Container(
        color: Colors.blueGrey.shade900,
        child: Stack(
          children: [
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: FutureBuilder<void>(
                  future: cameraValue,
                  builder: (context,snapshot){
                  if(snapshot.connectionState == ConnectionState.done){
                    return CameraPreview(_cameraController);
                  }
                  else{
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }
                ),
              ),
            ),

            Positioned(
              bottom: 0,
              child: Container(
                height: 160,
                color: Colors.blueGrey.shade900,
                padding: EdgeInsets.only(bottom: 5),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Container(
                      color: Colors.black,
                      height: 80,

                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          IconButton(onPressed: (){

                          }, icon: Icon(Icons.photo,
                            color: Colors.white,
                            size: 28,

                            ),
                          ),

                          GestureDetector(
                            onLongPress: ()async{
                              // final video=join((await getTemporaryDirectory()).path,"${DateTime.now()}.mp4");
                              await _cameraController.startVideoRecording();
                              setState(() {
                                isRecording=true;
                                // videopath=video;
                              });
                            },
                            onLongPressUp: ()async{
                              XFile videopath = await _cameraController.stopVideoRecording();
                              setState(() {
                                isRecording = false;
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> VideoViewPage(videopath: videopath.path)));
                              });
                            },
                            onTap: () async{
                              if (isRecording == false) try{
                                XFile image=await _cameraController.takePicture();
                                Navigator.push(context, MaterialPageRoute(builder: (context) => CameraViewPage2(imagepath: image.path),));
                            }catch(e){}
                            },
                              child: isRecording? Icon(Icons.radio_button_on,
                                color: Colors.red,
                                size: 90,
                              ) :
                              Icon(Icons.radio_button_checked_sharp,
                                color: Colors.white,
                                size: 70,
                              ),
                          ),

                          IconButton(onPressed: ()async {
                            setState(() {
                              iscamerafront = !iscamerafront;
                              transform=transform+pi;
                            });
                            int cameraPos = iscamerafront? 0 : 1;
                            _cameraController=CameraController(cameras![cameraPos],ResolutionPreset.high ,enableAudio: true);
                            cameraValue = _cameraController.initialize();
                          }, icon: Transform.rotate(
                            angle: transform,
                            child: Icon(Icons.flip_camera_android,
                            color: Colors.white,
                            size: 28
                              ),
                          )
                          )
                        ],
                      ),
                    ),

                    //SizedBox(height: 4,),

                    // Container(
                    //
                    //   child: TabBar(
                    //       controller: _tabController,
                    //       indicatorColor: Colors.transparent,
                    //       isScrollable: true,
                    //
                    //       tabs: [
                    //     Container(
                    //       height: 35,
                    //       width: 70,
                    //       decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(22),
                    //         color: Colors.blueGrey.shade700
                    //       ),
                    //       child: Center(
                    //         child: Text("Video",style: TextStyle(
                    //           fontSize: 15
                    //         ),),
                    //       ),
                    //     ),
                    //
                    //     Container(
                    //       height: 35,
                    //       width: 70,
                    //       decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(22),
                    //           color: Colors.blueGrey.shade700
                    //       ),
                    //       child: Center(
                    //         child: Text("Photo",style: TextStyle(
                    //           fontSize: 15
                    //         ),),
                    //       ),
                    //     ),
                    //   ]
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  }