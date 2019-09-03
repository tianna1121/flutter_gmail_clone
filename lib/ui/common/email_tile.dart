import 'package:flutter/material.dart';
import 'package:flutter_gmail_clone/data/classes/email.dart';

class EmailListTile extends StatelessWidget {
  final EmailItem item;
  final VoidCallback favoriteChanged;

  EmailListTile(
    this.favoriteChanged,
    @required this.item,
  );

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item?.title ?? ""),
    );
  }
}
