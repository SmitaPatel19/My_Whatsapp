import 'package:flutter/material.dart';
import 'package:my_whatsapp/Model/CameraLayout.dart';
import 'package:my_whatsapp/Pages/VideoLayout.dart';
//import 'package:my_whatsapp/main.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> with SingleTickerProviderStateMixin{

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this,initialIndex: 1,);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      bottomSheet: Container(
        height: 80,
        width: MediaQuery.of(context).size.width,
        color: Colors.blueGrey.shade900,
        child: Padding(
          padding: EdgeInsets.only(top: 8),
          child: Align(
            alignment: Alignment.topCenter,
            child: TabBar(
                          controller: _tabController,
                          isScrollable: true,
                          indicatorColor: Colors.blueGrey.shade900,

                          tabs: [
                            Container(
                              height: 35,
                              width: 70,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(22),
                                  color: Colors.blueGrey.shade700
                              ),
                              child: Center(
                                child: Text("Video",style: TextStyle(
                                    fontSize: 15
                                ),),
                              ),
                            ),

                            Container(
                              height: 35,
                              width: 70,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(22),
                                  color: Colors.blueGrey.shade700
                              ),
                              child: Center(
                                child: Text("Photo",style: TextStyle(
                                    fontSize: 15
                                ),),
                              ),
                            ),
                          ]
                      ),
          ),
        ),
      ),

      body: TabBarView(
          controller: _tabController,
            children: [
              VideoLayout(),
              CameraLayout(),
            ]),


    );
  }
}
