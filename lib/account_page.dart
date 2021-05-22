import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  //리턴 타입
  Widget _buildAppBar() {
    return AppBar(
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.exit_to_app),
          onPressed: () {
            FirebaseAuth.instance.signOut();
            _googleSignIn.signOut();
          },
        )
      ],
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  SizedBox(
                    width: 80.0,
                    height: 80.0,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTAxMDFfMTc4%2FMDAxNjA5NTAzMTc0MjY0.bAhBWm7nDc8l2yPgDCa2LYX3n0HBo2HLzg8FYbP0dTAg.'
                          'nPNiQKBgJNdYHfQlsIVbmBV_s_Le8MWkd3izx_MMNS8g.JPEG.atm500%2F1609252568086.jpg&type=sc960_832'),
                    ),
                  ),
                  Container(
                      width: 80.0,
                      height: 80.0,
                      alignment: Alignment.bottomRight,
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          SizedBox(
                            width: 28.0,
                            height: 28.0,
                            child: FloatingActionButton(
                              backgroundColor: Colors.white,
                              onPressed: () {},
                            ),
                          ),
                          SizedBox(
                            width: 25.0,
                            height: 25.0,
                            child: FloatingActionButton(
                              onPressed: null,
                              backgroundColor: Colors.blue,
                              child: Icon(Icons.add),
                            ),
                          ),
                        ],
                      ))
                ],
              ),
              Padding(padding: EdgeInsets.all(8.0)),
              Text(
                '이름',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              )
            ],
          ),
          Text(
            '0 \n 게시물',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18.0),
          ),
          Text(
            '0 \n 팔로워',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18.0),
          ),
          Text(
            '0 \n 팔로잉',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18.0),
          )
        ],
      ),
    );
  }
}
