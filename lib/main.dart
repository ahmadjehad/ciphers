import 'package:ciphers/pages/caesar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Ciphers());
}

class Ciphers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ciphers',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: LandingPage.route,
      routes: {
        LandingPage.route: (context) => LandingPage(),
        Caesar.route: (context) => Caesar(),
      },
    );
  }
}

class LandingPage extends StatefulWidget {
  static const String route = 'landing';

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Cipher Type'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: _width * 0.05, vertical: _height * 0.08),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, Caesar.route),
                child: Text(
                  'Caesar',
                  style: TextStyle(fontSize: _width * 0.04),
                )),
            SizedBox(
              height: _height * 0.02,
            ),
            ElevatedButton(
                onPressed: null,
                child: Text(
                  'More Ciphers Later',
                  style: TextStyle(fontSize: _width * 0.04),
                )),
          ],
        ),
      ),
    );
  }
}
