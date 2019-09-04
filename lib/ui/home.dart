import 'package:flutter/material.dart';
import 'package:flutter_gmail_clone/data/classes/email.dart';
import 'package:flutter_gmail_clone/data/dummy_dart.dart';
import 'package:flutter_gmail_clone/ui/app/app_drawer.dart';
import 'package:flutter_gmail_clone/ui/app/app_side_menu.dart';
import 'package:flutter_gmail_clone/ui/common/email_tile.dart';
import 'package:flutter_gmail_clone/ui/common/email_view.dart';
import 'package:responsive_scaffold/responsive_scaffold.dart';
import 'package:floating_search_bar/floating_search_bar.dart';
import 'package:responsive_scaffold/utils/breakpoint.dart';

import 'common/email_fab.dart';

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
    final bool _tablet = isTablet(context, breakpoint: _tabletBreakpoint);
    return ResponsiveScaffold.builder(
      itemCount: _emails?.length ?? 0,
      itemBuilder: (context, index) {
        return EmailListTile(
          favoriteChanged: () {
            setState(() {
              _emails[index].favorite = !_emails[index].favorite;
            });
          },
          item: _emails[index],
        );
      },
      tabletFlexListView: 4,
      tabletSideMenu: _tablet
          ? Flexible(
              flex: 1,
              child: AppSideMenu(),
            )
          : null,
      detailBuilder: (context, index, tablet) {
        return DetailsScreen(
            appBar: AppBar(
              elevation: 0.0,
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.archive),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.delete_outline),
                  onPressed: () {
                    setState(() {
                      _emails.removeAt(index);
                    });
                    if (!tablet)
                      Navigator.of(context, rootNavigator: true).pop();
                  },
                ),
                IconButton(
                  icon: Icon(Icons.mail_outline),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.more_horiz),
                  onPressed: () {},
                ),
              ],
            ),
            body: EmailView(
              favoriteChanged: () {
                setState(() {
                  _emails[index].favorite = !_emails[index].favorite;
                });
              },
              item: _emails[index],
            ));
      },
      floatingActionButton: EmailFab(
        onPressed: () {
          setState(() {
            _emails.add(EmailItem(
              avatar: "AD",
              title: "Save 10% with Geico",
              description:
                  "15 minutes could save you 15% or more on Car Insurance.",
              favorite: false,
              date: DateTime(2018, 11, 8, 17, 30),
            ));
          });
        },
      ),
      drawer: AppDrawer(),
      slivers: <Widget>[
        SliverFloatingBar(
          automaticallyImplyLeading: !_tablet,
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
}
