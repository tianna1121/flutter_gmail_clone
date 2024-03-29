import 'package:flutter/material.dart';
import 'package:flutter_gmail_clone/data/classes/email.dart';
import 'package:intl/intl.dart';

class EmailListTile extends StatelessWidget {
  final EmailItem item;
  final VoidCallback favoriteChanged;

  const EmailListTile({Key key, @required this.item, this.favoriteChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: CircleAvatar(
              radius: 25.0,
              child: Text(item?.avatar ?? ""),
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    item?.title ?? "",
                    style: Theme.of(context)
                        .textTheme
                        .display1
                        .copyWith(fontSize: 16.0),
                  ),
                  Text(
                    item?.description ?? "",
                    style: Theme.of(context)
                        .textTheme
                        .body1
                        .copyWith(fontSize: 16.0, color: Colors.grey),
                  )
                ],
              ),
            ),
          ),
          Column(
            children: <Widget>[
              Text(DateFormat.jm().format(item?.date ?? DateTime.now())),
              IconButton(
                icon: (item?.favorite ?? false)
                    ? Icon(
                        Icons.star,
                        color: Colors.amber,
                      )
                    : Icon(Icons.star_border),
                onPressed: favoriteChanged,
              )
            ],
          )
        ],
      ),
    );
  }
}
