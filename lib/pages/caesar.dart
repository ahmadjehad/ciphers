import 'package:flutter/material.dart';

class Caesar extends StatefulWidget {
  static const String route = 'caesar';
  @override
  _CaesarState createState() => _CaesarState();
}

class _CaesarState extends State<Caesar> {
  TextEditingController _wordController = TextEditingController();
  TextEditingController _keyController = TextEditingController();
  String _result = "";

  @override
  void dispose() {
    _wordController.dispose();
    _keyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Caesar Cipher'),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Input your Plaintext / Ciphertext',
                  ),
                  controller: _wordController,
                  keyboardType: TextInputType.text,
                ),
                Container(
                  height: 22.0,
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Input your key'),
                  controller: _keyController,
                  keyboardType: TextInputType.number,
                ),
                Container(
                  height: 22.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ElevatedButton(
                      child: Text("Encrypt"),
                      onPressed: () {
                        this._process(true);
                      },
                    ),
                    ElevatedButton(
                      child: Text("Decrypt"),
                      onPressed: () {
                        this._process(false);
                      },
                    ),
                    ElevatedButton(
                      child: Text("Reset"),
                      onPressed: _reset,
                    ),
                  ],
                ),
                Container(
                  height: 64.0,
                ),
                Text(
                  'Output :',
                  style: TextStyle(fontSize: 24.0),
                  textAlign: TextAlign.center,
                ),
                Container(
                  height: 32.0,
                ),
                SelectableText(
                  _result,
                  style: TextStyle(fontSize: 32.0),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Made with Flutter and 💙 by Ahmad Jehad',
            ),
          )
        ],
      ),
    );
  }

  void _process(bool _isEncrypt) {
    String _text = _wordController.text;
    late int _key;
    String _temp = "";

    try {
      _key = int.parse(_keyController.text);
    } catch (e) {
      _showAlert("Invalid Key");
    }

    for (int i = 0; i < _text.length; i++) {
      int ch = _text.codeUnitAt(i);
      int offset;
      String h;
      if (ch >= 'a'.codeUnitAt(0) && ch <= 'z'.codeUnitAt(0)) {
        offset = 97;
      } else if (ch >= 'A'.codeUnitAt(0) && ch <= 'Z'.codeUnitAt(0)) {
        offset = 65;
      } else if (ch == ' '.codeUnitAt(0)) {
        _temp += " ";
        continue;
      } else {
        _showAlert("Invalid Text");
        _temp = "";
        break;
      }

      int c;
      if (_isEncrypt) {
        c = (ch + _key - offset) % 26;
      } else {
        c = (ch - _key - offset) % 26;
      }
      h = String.fromCharCode(c + offset);
      _temp += h;
    }

    setState(() {
      _result = _temp;
    });
  }

  void _reset() {
    _wordController.clear();
    _keyController.clear();
    setState(() {
      _result = "";
    });
  }

  Future<void> _showAlert(String _alert) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Something is Wrong'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text(_alert),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
