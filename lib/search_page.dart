import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: _test,
        child: Icon(Icons.create),
      ),
    );
  }

  void _test() {
    _count++;
    print(_count);
  }

  Widget _buildBody() {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1.0,
            mainAxisSpacing: 1.0,
            crossAxisSpacing: 1.0),
        itemCount: 5,
        itemBuilder: (context, index) {
          return _buildListItem(context, index);
        });
  }

  Widget _buildListItem(BuildContext context, int index) {
    return Image.network(
      'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTAyMjNfMjE5%2FMDAxNjE0MDg3NDU0OTU4.v9Dr8rvhSJ7EAm8jNROn8UqP-Q2Uo2fa4exYeHRfnysg.dsSJs0iO1AFL8X-l8s2-ze1F8tQSpafTGv86F4012kYg.'
      'PNG.bogoo89%2F05fb2a261b37360672bd362be59c932d6cd8426418cba4ced5403ecb0d128cf5542210bde4f3.'
      'png&type=sc960_832',
      fit: BoxFit.cover,
    );
  }
}
