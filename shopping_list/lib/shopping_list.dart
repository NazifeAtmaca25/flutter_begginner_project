import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_list/shopping_items.dart';

class ShoppingList extends StatefulWidget {
  const ShoppingList({super.key});

  @override
  State<ShoppingList> createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  final List<ShoppingItems> _list = [];

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _nameController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  Future<void> _shoppingRegister() async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString(
        "shopping", jsonEncode(_list.map((item) => item.toJson()).toList()));
  }

  void addShopping() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _list.add(ShoppingItems(
            name: _nameController.text, quantity: _quantityController.text));
        _nameController.clear();
        _quantityController.clear();
      });
      _shoppingRegister();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Lütfen tüm alanları doldurunuz.")));
    }
  }

  void removeShopping(int index) {
    setState(() {
      _list.removeAt(index);
    });
    _shoppingRegister();
  }

  void isTake(int index) {
    setState(() {
      _list[index].isCheck = !_list[index].isCheck;
    });
    _shoppingRegister();
  }

  Future<void> _uploadShopping() async {
    final pref = await SharedPreferences.getInstance();
    final String? shoppingList = pref.getString("shopping");
    if (shoppingList != null) {
      setState(() {
        _list.addAll(List<ShoppingItems>.from(jsonDecode(shoppingList)
            .map((item) => ShoppingItems.fromJson(item))));
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _uploadShopping();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Alışveriş Listesi",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 4,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    buildRow("Ürün adı", "Örn: Süt", "Lütfen adınızı girin",
                        _nameController),
                    SizedBox(
                      height: 10,
                    ),
                    buildRow("Miktar", "2 kilo", "Lütfen müktarı giriniz",
                        _quantityController),
                    SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              addShopping();
                            }
                          },
                          child: Text("Ekle")),
                    )
                  ],
                )),
            Divider(
              height: 30,
            ),
            Expanded(
                child: _list.isEmpty
                    ? Center(
                        child: Text("Alişveriş Listeniz Boş"),
                      )
                    : ListView.builder(
                        itemCount: _list.length,
                        itemBuilder: (context, index) {
                          return Card();
                        }))
          ],
        ),
      ),
    );
  }

  Row buildRow(String label1, String label2, String label3,
      TextEditingController controller) {
    return Row(
      children: [
        Text(label1),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: TextFormField(
            controller: controller,
            decoration:
                InputDecoration(hintText: label2, border: OutlineInputBorder()),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return label3;
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
