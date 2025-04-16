import 'dart:io';
import 'package:flutter/material.dart';

class CameraViewPage2 extends StatelessWidget {
  const CameraViewPage2({Key? key, required this.imagepath}) : super(key: key);
  final imagepath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
          title: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.clear)),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.hd_outlined,
                  size: 22,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.crop_rotate,
                  size: 22,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.sticky_note_2_outlined,
                  size: 22,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.title_outlined,
                  size: 23,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.mode_edit_outlined,
                  size: 22,
                )),
          ],
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 250,
              child: Image.file(
                File(imagepath),
                fit: BoxFit.cover,
              ),
              //color: Colors.blue,
            ),
            Positioned(
              bottom: 0,
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 70,
                    child: Card(
                      margin: EdgeInsets.only(left: 2, right: 2, bottom: 8),
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
                              onPressed: () {},
                              icon: Icon(
                                Icons.add_photo_alternate,
                                size: 22,
                              ),
                            ),
                            prefixIconColor: Colors.white,
                            suffixIcon: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.replay_circle_filled_rounded,
                                  color: Colors.white,
                                ))),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 8, right: 2, bottom: 8),
                    child: CircleAvatar(
                      backgroundColor: Colors.teal.shade700,
                      radius: 25,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.check),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ));
  }
}
