import 'package:flutter/material.dart';
import 'package:shopeeng/widgets/left_drawer.dart';
import 'package:shopeeng/widgets/shop_card.dart';
import 'package:shopeeng/screens/shoplist_form.dart';

class ItemsPage extends StatefulWidget {
  const ItemsPage({super.key});

  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item List'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      drawer: LeftDrawer(),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index].name),
            subtitle: Text(
                'Price: ${items[index].price}, Amount: ${items[index].amount}\nDescription: ${items[index].description}'),
            // Add an onTap handler if you want to do something when the user taps a product
            onTap: () {},
          );
        },
      ),
    );
  }
}
