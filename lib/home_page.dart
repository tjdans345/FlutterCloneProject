import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final FirebaseUser user;

  const HomePage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Chanstagram',
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      )),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                Text(
                  'Chanstagram에 온것을 환영합니다~',
                  style: TextStyle(fontSize: 24.0),
                ),
                Padding(padding: EdgeInsets.all(8.0)),
                Text('사진과 동영상을 보려면 팔로우 하세요'),
                Padding(padding: EdgeInsets.all(16.0)),
                SizedBox(
                  width: 260.0,
                  child: Card(
                      elevation: 4.0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Padding(padding: EdgeInsets.all(5.0)),
                            SizedBox(
                              width: 80.0,
                              height: 80.0,
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(user.photoUrl),
                              ),
                            ),
                            Padding(padding: EdgeInsets.all(8.0)),
                            Text(
                              user.email,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Padding(padding: EdgeInsets.all(16.0)),
                            Text(user.displayName),
                            Padding(padding: EdgeInsets.all(16.0)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  width: 70,
                                  height: 70,
                                  child: Image.network(
                                      'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.'
                                      'net%2FMjAyMTAyMTlfMjMx%2FMDAxNjEzNzAyMjY5MjYx.'
                                      'Gu04B9Nz6vCAuOOTKIp8YYMArEcwsqsuiLOpJowjEacg.DtGKGOhomJZoCGNU86W4UdGvvmGnYhktp-iAV9EO5f8g.JPEG.1915618%2Fimage_624296963.'
                                      'jpg&type=sc960_832',
                                      fit: BoxFit.cover),
                                ),
                                Padding(padding: EdgeInsets.all(5.0)),
                                SizedBox(
                                  width: 70,
                                  height: 70,
                                  child: Image.network(
                                      'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.'
                                      'net%2FMjAyMTAyMTlfMjMx%2FMDAxNjEzNzAyMjY5MjYx.'
                                      'Gu04B9Nz6vCAuOOTKIp8YYMArEcwsqsuiLOpJowjEacg.DtGKGOhomJZoCGNU86W4UdGvvmGnYhktp-iAV9EO5f8g.JPEG.1915618%2Fimage_624296963.'
                                      'jpg&type=sc960_832',
                                      fit: BoxFit.cover),
                                ),
                                Padding(padding: EdgeInsets.all(5.0)),
                                SizedBox(
                                  width: 70,
                                  height: 70,
                                  child: Image.network(
                                      'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.'
                                      'net%2FMjAyMTAyMTlfMjMx%2FMDAxNjEzNzAyMjY5MjYx.'
                                      'Gu04B9Nz6vCAuOOTKIp8YYMArEcwsqsuiLOpJowjEacg.DtGKGOhomJZoCGNU86W4UdGvvmGnYhktp-iAV9EO5f8g.JPEG.1915618%2Fimage_624296963.'
                                      'jpg&type=sc960_832',
                                      fit: BoxFit.cover),
                                ),
                              ],
                            ),
                            Padding(padding: EdgeInsets.all(5.0)),
                            Text('Facebook 친구'),
                            Padding(padding: EdgeInsets.all(5.0)),
                            RaisedButton(
                              child: Text('팔로우'),
                              color: Colors.blueAccent,
                              textColor: Colors.white,
                              onPressed: () {},
                            ),
                            Padding(padding: EdgeInsets.all(5.0)),
                          ],
                        ),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
