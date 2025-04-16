import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
//import 'package:my_whatsapp/screens/camera_view_page2.dart';
// import 'package:path/path.dart' as path;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'VideoViewPage.dart';

List<CameraDescription>? cameras;

class VideoLayout extends StatefulWidget {
  const VideoLayout({super.key});

  @override
  State<VideoLayout> createState() => _VideoLayoutState();
}

class _VideoLayoutState extends State<VideoLayout> with SingleTickerProviderStateMixin{


  CameraController ? _cameraController;
  late Future<void> cameraValue;
  bool isRecording=false;
  String videopath="";
  @override
  void initState(){
    super.initState();
    cameraValue = _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    try {
      if (cameras != null && cameras!.isNotEmpty) {
        _cameraController = CameraController(cameras![0], ResolutionPreset.high, enableAudio: true);
        await _cameraController!.initialize();
      }
    } catch (e) {
      print("Error initializing camera: $e");
    }
  }

  @override
  void dispose() {
    // Dispose of the camera controller and other resources here
    _cameraController?.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: Row(

          children: [
            IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.clear,color: Colors.white,)
            ),

            SizedBox(width: 90,),
            Text("00:00",style: TextStyle(
                color: Colors.white,
                fontSize: 15
            ),),
          ],
        ),

        actions: [
          IconButton(onPressed: (){

          }, icon: Icon(Icons.flash_off),color: Colors.white,),
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
                        return CameraPreview(_cameraController!);
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
                              await _cameraController?.startVideoRecording();
                              setState(() {
                                isRecording=true;
                              });
                            },
                            onLongPressUp: ()async{
                              XFile? videopath = await _cameraController?.stopVideoRecording();
                              setState(() {
                                isRecording = false;
                                if (videopath != null) {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => VideoViewPage(videopath: videopath.path),
                                  ));
                                }
                              });
                            },

                            onTap: () async{
                              final video=join((await getTemporaryDirectory()).path,"${DateTime.now()}.mp4");
                              await _cameraController?.startVideoRecording();
                              setState(() {
                                isRecording=true;
                                videopath=video;
                              });
                            },

                            onDoubleTap: () async{
                              await _cameraController?.stopVideoRecording();
                              setState(() {
                                isRecording = false;
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> VideoViewPage(videopath: videopath)));
                              });
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

                          IconButton(onPressed: (){

                          }, icon: Icon(Icons.flip_camera_android,
                              color: Colors.white,
                              size: 28
                          )
                          )
                        ],
                      ),
                    ),
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