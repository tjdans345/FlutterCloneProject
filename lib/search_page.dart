import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clon/create_page.dart';
import 'package:instagram_clon/detail_post_page.dart';

class SearchPage extends StatefulWidget {
  final FirebaseUser user;

  const SearchPage(this.user);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CreatePage(widget.user)));
        },
        child: Icon(Icons.create),
      ),
    );
  }

  Widget _buildBody() {
    return StreamBuilder(
      stream: Firestore.instance.collection('post').snapshots(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }

        var items =
            snapshot.data.documents ?? []; // ??< null일 때 []로 초기화 하겠다라는 의미
        return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
                mainAxisSpacing: 1.0,
                crossAxisSpacing: 1.0),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return _buildListItem(context, items[index]);
            });
      },
    );
  }

  Widget _buildListItem(BuildContext context, document) {
    //Type 생략가능
    return Hero(
      tag: document['photoUrl'],
      child: Material(
        child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailPostPage(document);
            }));
          },
          child: Image.network(
            document['photoUrl'],
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
