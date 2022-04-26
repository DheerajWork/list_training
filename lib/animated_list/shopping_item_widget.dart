import 'package:flutter/material.dart';
import 'package:list_training/animated_list/shopping_item.dart';

class ShoppingItemWidget extends StatelessWidget {
  final ShoppingItem? item;
  final Animation? animation;
  final VoidCallback? delete;
  final VoidCallback? edit;

  // ignore: use_key_in_widget_constructors
  const ShoppingItemWidget({
    this.item,
    this.animation,
    this.delete, this.edit,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(15),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: Colors.white),
          child: ListTile(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            leading: CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(item!.url!),
            ),
            title: Row(
              children: [
                Text(item!.title!),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.green),
                  onPressed: edit,
                ),
              ],
            ),
            trailing: IconButton(
              icon: const Icon(Icons.cancel, color: Colors.red),
              onPressed: delete,
            ),
          ),
        ),
      );
}
