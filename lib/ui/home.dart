import 'package:flutter/material.dart';
import 'package:flutter_gmail_clone/data/classes/email.dart';
import 'package:flutter_gmail_clone/data/dummy_dart.dart';
import 'package:flutter_gmail_clone/ui/app/app_drawer.dart';
import 'package:flutter_gmail_clone/ui/common/email_tile.dart';
import 'package:responsive_scaffold/responsive_scaffold.dart';
import 'package:floating_search_bar/floating_search_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<EmailItem> _emails = [];

  @override
  void initState() {
    super.initState();
    _emails = emails;
  }

  final Size _tabletBreakpoint = Size(510.0, 510.0);

  @override
  Widget build(BuildContext context) {
    return ResponsiveListScaffold.builder(
      itemCount: _emails?.length ?? 0,
      itemBuilder: (context, index) {
        return EmailListTile(
          favoriteChanged(),
          _emails[index],
        );
      },
      detailBuilder: (context, index, tablet) {
        return DetailsScreen(
          appBar: AppBar(
            title: Text("Details"),
          ),
          body: Placeholder(),
        );
      },
      drawer: AppDrawer(),
      slivers: <Widget>[
        SliverFloatingBar(
          title: TextField(
            decoration: InputDecoration.collapsed(hintText: "Search Mail"),
          ),
          trailing: CircleAvatar(
            child: Text("RD"),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            padding: EdgeInsets.all(12.0),
            child: Text("All Inboxes"),
          ),
        )
      ],
    );
  }

  favoriteChanged() {}
}
