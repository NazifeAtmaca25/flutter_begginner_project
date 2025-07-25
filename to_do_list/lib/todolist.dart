import 'package:flutter/material.dart';

import 'Task.dart';

class Todolist extends StatefulWidget {
  const Todolist({super.key});

  @override
  State<Todolist> createState() => _TodolistState();
}

class _TodolistState extends State<Todolist> {
  final List<Task> _list = [];
  final TextEditingController _taskController = TextEditingController();

  void addTask() {
    final newTask = _taskController.text;
    if (newTask.isNotEmpty) {
      setState(() {
        _list.add(Task(newTask));
        _taskController.clear();
      });
    }
  }

  void remove(int index) {
    setState(() {
      _list.removeAt(index);
    });
  }

  void doneOrNot(int index) {
    setState(() {
      _list[index].isDone = !_list[index].isDone;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Yapılacaklar Listesi",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF87CEFF),
        foregroundColor: Colors.white,
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              itemCount: _list.length,
              itemBuilder: (context, index) {
                final task = _list[index];
                return Card(
                  margin: EdgeInsets.all(4),
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    leading: Checkbox(
                        value: task.isDone,
                        onChanged: (value) {
                          doneOrNot(index);
                        }),
                    title: Text(
                      task.tittle,
                      style: TextStyle(
                          decoration: task.isDone
                              ? TextDecoration.lineThrough
                              : TextDecoration.none),
                    ),
                    trailing: IconButton(
                        onPressed: () => remove(index),
                        icon: Icon(
                          Icons.delete,
                          color: Colors.blue[700],
                        )),
                  ),
                );
              },
            )),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                    child: TextField(
                  controller: _taskController,
                  decoration: InputDecoration(
                      hintText: 'Yeni bir görev ekle',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.blue[300]!)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              BorderSide(color: Colors.blue[300]!, width: 1.5)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              BorderSide(color: Colors.blue[300]!, width: 2))),
                  onSubmitted: (value) => addTask(),
                )),
                SizedBox(
                  width: 10,
                ),
                FloatingActionButton(
                    onPressed: () => addTask(),
                    backgroundColor: Colors.blue,
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 30,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
