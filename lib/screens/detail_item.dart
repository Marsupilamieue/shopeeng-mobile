import 'package:flutter/material.dart';
import 'package:shopeeng/models/item.dart';

class DetailItemPage extends StatelessWidget {
  final Item item;

  DetailItemPage({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.fields.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              item.fields.name,
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 10),
            Text("Harga : ${item.fields.price}"),
            const SizedBox(height: 10),
            Text("Jumlah : ${item.fields.amount}"),
            const SizedBox(height: 10),
            Text("Tentang : ${item.fields.description}"),
          ],
        ),
      ),
    );
  }
}
