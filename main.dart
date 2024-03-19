import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Circle Navigation App',
      home: HomePage(),
      routes: {
        '/diary': (context) => DetailPage(title: '日記'),
        '/myMood': (context) => DetailPage(title: '我的情緒'),
        '/games': (context) => DetailPage(title: '遊戲'),
        '/emotionAngel': (context) => DetailPage(title: '情緒小天使'),
        '/expertArticles': (context) => DetailPage(title: '專家文章'),
        '/myAccount': (context) => DetailPage(title: '我的帳號'),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首頁'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: <Widget>[
            _buildCircleButton(context, '日記', '/diary'),
            _buildCircleButton(context, '我的情緒', '/myMood'),
            _buildCircleButton(context, '遊戲', '/games'),
            _buildCircleButton(context, '情緒小天使', '/emotionAngel'),
            _buildCircleButton(context, '專家文章', '/expertArticles'),
            _buildCircleButton(context, '我的帳號', '/myAccount'),
          ],
        ),
      ),
    );
  }

  Widget _buildCircleButton(BuildContext context, String label, String route) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(route);
      },
      child: CircleAvatar(
        radius: 50.0,
        backgroundColor: Colors.blue,
        child: Text(
          label,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String title;

  DetailPage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: Text('歡迎來到 $title 頁面', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
