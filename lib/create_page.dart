import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key key}) : super(key: key);

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
      actions: <Widget>[IconButton(icon: Icon(Icons.send), onPressed: () {})],
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
