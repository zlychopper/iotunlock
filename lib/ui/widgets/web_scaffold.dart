import 'package:fluintl/fluintl.dart';
import 'package:flutter/material.dart';
import 'package:iot_unlock/res/strings.dart';
import 'package:iot_unlock/res/styles.dart';
import 'package:iot_unlock/utils/NavigatorUtil.dart';
import 'package:share/share.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebScaffold extends StatefulWidget {
  final String title;
  final String url;

  const WebScaffold({Key key, this.title, this.url}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return WebScaffoldState();
  }
}

class WebScaffoldState extends State<WebScaffold> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          widget.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        centerTitle: true,
        actions: <Widget>[
          new PopupMenuButton(
              padding: const EdgeInsets.all(0),
              onSelected: _onPopSelected,
              itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
                    new PopupMenuItem(
                        value: "browser",
                        child: ListTile(
                          contentPadding: EdgeInsets.all(0),
                          dense: false,
                          title: new Container(
                            alignment: Alignment.center,
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.open_in_browser),
                                Gaps.hGap10,
                                Text(
                                  IntlUtil.getString(
                                      context, Ids.open_in_browser),
                                  style: TextStyles.listContent,
                                )
                              ],
                            ),
                          ),
                        )),
                    new PopupMenuItem(
                        value: 'share',
                        child: ListTile(
                          contentPadding: EdgeInsets.all(0),
                          dense: false,
                          title: new Container(
                            alignment: Alignment.center,
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.share),
                                Gaps.hGap10,
                                Text(
                                  IntlUtil.getString(context, Ids.titleShare),
                                  style: TextStyles.listContent,
                                )
                              ],
                            ),
                          ),
                        ))
                  ])
        ],
      ),
      body: new WebView(
        initialUrl: widget.url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }

  void _onPopSelected(String value) {
    String _title = widget.title;
    switch (value) {
      case "browser":
        NavigatorUtil.launchInBrowser(widget.url, title: _title);
        break;
      case "collection":
        break;
      case "share":
        String _url = widget.url;
        Share.share('$_title : $_url');
        break;
      default:
        break;
    }
  }
}
