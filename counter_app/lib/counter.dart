import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _number = 0;
  void _increase() {
    setState(() {
      _number++;
    });
  }

  void _decrease() {
    setState(() {
      _number--;
    });
  }

  void _reset() {
    setState(() {
      _number = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sayaç Uygulaması"),
        centerTitle: true,
        backgroundColor: Colors.purple[200],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _number.toString(),
              style: TextStyle(fontSize: 75, color: Colors.purple[700]),
            ),
            SizedBox(
              height: 60,
              width: 300,
              child: Divider(
                color: Colors.purple,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: _increase,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15)))),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 30,
                    )),
                SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                    onPressed: _decrease,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15)))),
                    child: Icon(
                      Icons.minimize,
                      color: Colors.white,
                      size: 30,
                    ))
              ],
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: _reset,
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)))),
                child: Text(
                  "Reset",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ))
          ],
        ),
      ),
    );
  }
}
