import 'package:flutter/material.dart';
import 'package:list_training/animated_list/custom_textfield.dart';

import 'package:list_training/animated_list/shopping_item.dart';
import 'package:list_training/animated_list/shopping_item_widget.dart';
import 'data.dart';

class MainPage extends StatefulWidget {
  final String? title;

  const MainPage({
    @required this.title,
  });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final key = GlobalKey<AnimatedListState>();
  final items = List.from(Data.shoppingList);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.deepPurple,
        appBar: AppBar(
          title: Text(widget.title!),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                key: key,
                itemCount: Data.shoppingList.length,
                itemBuilder: (
                  context,
                  index,
                ) =>
                    buildItem(Data.shoppingList[index], index),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    child: const Text(
                      'Insert item',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () async {
                      await showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => MyDialog());
                      print("EEEE");
                      print(Data.shoppingList.length);
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  Widget buildItem(item, index) => ShoppingItemWidget(
        item: item,
        delete: () {
          Data.shoppingList.removeAt(index);
          setState(() {});
        },
        edit: () async {
          await showDialog<String>(
              context: context,
              builder: (BuildContext context) => MyDialog(
                    index: index,
                    isUpdate: true,
                  ));
          print("EEEE");
          print(Data.shoppingList.length);
          setState(() {});
        },
      );
}

class MyDialog extends StatefulWidget {
  bool? isUpdate;
  int? index;

  MyDialog({Key? key, this.isUpdate = false, this.index}) : super(key: key);

  @override
  State<MyDialog> createState() => _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  TextEditingController? itemName = TextEditingController();
  TextEditingController? itemUrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Insert Item"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextField(
            hint: 'Enter Name',
            controller: itemName!,
          ),
          const SizedBox(
            height: 5,
          ),
          CustomTextField(
            hint: 'Enter URL',
            controller: itemUrl,
          )
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            print(itemName!.text.toString());
            print(itemUrl!.text.toString());
            if (widget.isUpdate == true) {
              Data.shoppingList[widget.index!] = ShoppingItem(
                  title: itemName!.text.toString(),
                  url: itemUrl!.text.toString());
            } else {
              Data.shoppingList.add(ShoppingItem(
                  title: itemName!.text.toString(),
                  url: itemUrl!.text.toString()));
            }
            print(Data.shoppingList.length);
            Navigator.pop(context);
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
