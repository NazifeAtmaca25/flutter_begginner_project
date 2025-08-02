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
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              margin: EdgeInsets.symmetric(horizontal: 8),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Text(
                          "Yeni Ürün Ekle",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.purple),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        buildRow("Ürün Adı:", "Örn: Süt",
                            "Lütfen adınızı girin", _nameController),
                        SizedBox(
                          height: 10,
                        ),
                        buildRow("Miktar   :", "2 kilo",
                            "Lütfen müktarı giriniz", _quantityController),
                        SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          height: 40,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                addShopping();
                              }
                            },
                            label: const Text(
                              "Ekle",
                              style: TextStyle(fontSize: 18),
                            ),
                            icon: Icon(
                              Icons.add_shopping_cart,
                              color: Colors.white,
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.purple,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12))),
                          ),
                        )
                      ],
                    )),
              ),
            ),
            Divider(
              height: 30,
              color: Colors.purple,
            ),
            Expanded(
                child: _list.isEmpty
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_shopping_cart_outlined,
                            size: 80,
                            color: Colors.purple,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Alışveriş listeniz boş",
                            style:
                                TextStyle(fontSize: 22, color: Colors.purple),
                          )
                        ],
                      )
                    : ListView.builder(
                        itemCount: _list.length,
                        itemBuilder: (context, index) {
                          return Dismissible(
                            key: Key(_list[index].name + index.toString()),
                            direction: DismissDirection.endToStart,
                            background: Container(
                              color: Colors.red,
                              alignment: Alignment.centerRight,
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                            ),
                            onDismissed: (direction) {
                              removeShopping(index);
                            },
                            child: ListTile(
                              leading: Checkbox(
                                  value: _list[index].isCheck,
                                  onChanged: (bool? newValue) {
                                    isTake(index);
                                  }),
                              title: Text(
                                _list[index].name,
                                style: TextStyle(
                                    decoration: _list[index].isCheck
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none),
                              ),
                              subtitle: Text(_list[index].quantity),
                            ),
                          );
                        }))
          ],
        ),
      ),
    );
  }

  Row buildRow(String label1, String label2, String label3,
      TextEditingController controller) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Text(
            label1,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
                hintText: label2,
                filled: true,
                fillColor: Colors.purple[50],
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.purple)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.purple, width: 2))),
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
