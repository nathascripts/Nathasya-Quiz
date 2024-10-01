import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class BankSampahInfoPage extends StatefulWidget {
  @override
  _BankSampahInfoPageState createState() => _BankSampahInfoPageState();
}

class _BankSampahInfoPageState extends State<BankSampahInfoPage> {
  String _content = "";

  @override
  void initState() {
    super.initState();
    _loadContent();
  }

  Future<void> _loadContent() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String filePath = '${appDocDir.path}/assets/Paragraf.txt';

    try {
      String content = await File(filePath).readAsString();
      setState(() {
        _content = content;
      });
    } catch (e) {
      print("Error reading file: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bank Sampah Keliling"),
        backgroundColor: const Color.fromARGB(255, 255, 181, 205),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset('assets/header.png'),
            ),
            SizedBox(height: 16),
            Text(
              "Apa itu Bank Sampah keliling?",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  _content.isNotEmpty ? _content : "Loading...",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Back to Home"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 181, 205),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
