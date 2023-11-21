import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopeeng/models/item.dart';
import 'package:shopeeng/screens/detail_item.dart';
import 'package:shopeeng/screens/login.dart';
import 'dart:convert';
import 'package:shopeeng/widgets/left_drawer.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({Key? key}) : super(key: key);

  @override
  ItemPageState createState() => ItemPageState();
}

class ItemPageState extends State<ItemPage> {
  Future<List<Item>> fetchItem() async {
    // var url = Uri.parse('http://127.0.0.1:8000/json/');
    var url = Uri.parse('https://faris-zhafir-tugas.pbp.cs.ui.ac.id/json/');
    var response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
      },
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object Item
    List<Item> list_Item = [];
    for (var d in data) {
      if (d != null) {
        // print(d.fields);
        Item item = Item.fromJson(d);
        if (item.fields.user == currentUser?.id) {
          list_Item.add(Item.fromJson(d));
        }
      }
    }
    return list_Item;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Item'),
          backgroundColor: Colors.orange,
        ),
        drawer: const LeftDrawer(),
        body: FutureBuilder(
            future: fetchItem(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return const Column(
                    children: [
                      Text(
                        "Tidak ada data item.",
                        style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) => InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailItemPage(item: snapshot.data![index]),
                          ),
                        );
                      },
                      child: Card(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${snapshot.data![index].fields.name}",
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                  "Jumlah : ${snapshot.data![index].fields.amount}"),
                              const SizedBox(height: 10),
                              Text(
                                  "Tentang : ${snapshot.data![index].fields.description}")
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }
              }
            }));
  }
}
