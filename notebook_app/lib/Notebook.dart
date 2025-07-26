import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Notebook extends StatefulWidget {
  const Notebook({super.key});

  @override
  State<Notebook> createState() => _NotebookState();
}

class _NotebookState extends State<Notebook> {
  final List<String> _notlar = [];
  final TextEditingController _controller = TextEditingController();

  Future<void> _notKayit() async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString("notlar", jsonEncode(_notlar));
  }

  void _notEkle() {
    final String metin = _controller.text;
    if (metin.isNotEmpty) {
      setState(() {
        _notlar.add(metin);
        _controller.clear();
      });
      _notKayit();
    }
  }

  void _notSil(int index) {
    setState(() {
      _notlar.removeAt(index);
    });
    _notKayit();
  }

  Future<void> _notYukle() async {
    final pref = await SharedPreferences.getInstance();
    final String? notListesi = pref.getString("notlar");
    if (notListesi != null) {
      setState(() {
        _notlar.addAll(List<String>.from(jsonDecode(notListesi)));
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _notYukle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Not Defteri",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 4,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: _notlar.length,
                    itemBuilder: (context, index) {
                      final not = _notlar[index];
                      return Card(
                        color: Colors.white,
                        margin: EdgeInsets.all(4),
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: ListTile(
                          title: Text(not),
                          trailing: IconButton(
                              onPressed: () => _notSil(index),
                              icon: Icon(Icons.delete_outline)),
                        ),
                      );
                    })),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                    child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                      hintText: "Not ekleyiniz",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.green)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              BorderSide(width: 1.5, color: Colors.green)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              BorderSide(width: 2, color: Colors.green))),
                  onSubmitted: (value) => _notEkle(),
                )),
                SizedBox(
                  width: 10,
                ),
                FloatingActionButton(
                  onPressed: () => _notEkle(),
                  backgroundColor: Colors.green,
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 30,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
