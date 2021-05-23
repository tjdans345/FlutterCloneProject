import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreatePage extends StatefulWidget {
  final FirebaseUser user; //유저 정보
  const CreatePage(this.user);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final textEditingController = TextEditingController();

  File _image;

  @override
  void dispose() {
    //메모리 해제 메서드
    textEditingController.dispose(); // 메모리 해제
    print('해제');
    super.dispose();
  }

  @override
  //build는 클래스가 생성될 때 호출 됨
  Widget build(BuildContext context) {
    print('생성');
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigoAccent,
        onPressed: _getImage,
        child: Icon(Icons.camera),
      ),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              final firebaseStorageRef = FirebaseStorage.instance
                  .ref()
                  .child('post')
                  .child('${DateTime.now().millisecondsSinceEpoch}.png');

              final task = firebaseStorageRef.putFile(
                  //파일 업로드 요청
                  _image,
                  StorageMetadata(contentType: 'image/png'));

              task.onComplete.then((value) {
                //파일 업로드가 성공하면 result값으로 value를 가져와서 .then을 사용해서
                //Future로 리턴 되면 .then 사용 가능

                //photo Url 경로를 얻은 다음
                var downloadUrl = value.ref.getDownloadURL();

                //파이어데이터베이스에 DB Data를 넣어준다
                downloadUrl.then((uri) {
                  var doc = Firestore.instance.collection('post').document();
                  doc.setData({
                    'id': doc.documentID,
                    'photoUrl': uri.toString(),
                    'contents': textEditingController.text,
                    'email': widget.user.email,
                    'displayName': widget.user.displayName,
                    'userPhotoUrl': widget.user.photoUrl
                  }).then((onValue) {
                    Navigator.pop(context);
                  });
                });
              });
            })
      ],
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      //화면이 넘어갈 때 스크롤 속성을 준다
      child: Column(
        children: <Widget>[
          _image == null ? Text("No Image") : Image.file(_image),
          TextField(
            decoration: InputDecoration(hintText: '내용을 입력하세요'),
            controller: textEditingController,
          )
        ],
      ),
    );
  }

  Future _getImage() async {
    PickedFile image =
        await ImagePicker().getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(image.path);
    });

    // 2번째 주석도 사용가능
    // final pickedFile =
    //     await ImagePicker().getImage(source: ImageSource.gallery);
    //
    // setState(() {
    //   if (pickedFile != null) {
    //     _image = File(pickedFile.path);
    //   } else {
    //     print('No Image Selected');
    //   }
    // });
  }
}
