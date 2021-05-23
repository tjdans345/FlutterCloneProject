import 'package:flutter/material.dart';

class DetailPostPage extends StatelessWidget {
  //데이터 타입이 어떤 타입이 될지 모를때 dynamic
  final dynamic document;

  const DetailPostPage(this.document);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('둘러보기'),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          //children이 여러개 속성
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(document['userPhotoUrl']),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          document['email'],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(document['displayName'])
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Hero(
                tag: document['photoUrl'],
                child: Image.network(document['photoUrl'])),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(document['contents']),
            )
          ],
        ),
      ),
    );
  }
}
