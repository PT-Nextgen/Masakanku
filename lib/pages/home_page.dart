import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:masakanku/widgets/about_app_card.dart';

class HomePage extends StatefulWidget {
  final String url;
  const HomePage({super.key, required this.url});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey webViewKey = GlobalKey();

  String url = '';
  String title = '';
  double progress = 0;
  bool? isSecure;
  InAppWebViewController? webViewController;

  @override
  void initState() {
    super.initState();
    url = widget.url;
  }

  bool showLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        spaceBetweenChildren: 12,
        children: [
          SpeedDialChild(
            child: const Icon(Icons.refresh),
            shape: const CircleBorder(),
            label: 'Refresh',
            onTap: () {
              webViewController?.reload();
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.help_outline),
            shape: const CircleBorder(),
            label: 'Tentang',
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const AboutAppCard();
                  });
            },
          ),
          SpeedDialChild(
              child: const Icon(Icons.logout),
              shape: const CircleBorder(),
              label: 'Keluar',
              onTap: () {
                exit(0);
              }),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            InAppWebView(
              key: webViewKey,
              initialUrlRequest: URLRequest(
                url: WebUri(widget.url),
              ),
              onWebViewCreated: (controller) async {
                webViewController = controller;
                if (!kIsWeb &&
                    defaultTargetPlatform == TargetPlatform.android) {
                  // await controller.android.startSafeBrowsing();
                  await controller.startSafeBrowsing();
                }
              },
              onLoadStart: (controller, url) {
                if (url != null) {
                  setState(() {
                    this.url = url.toString();
                  });
                }
              },
              onTitleChanged: (controller, title) {
                if (title != null) {
                  setState(() {
                    this.title = title;
                  });
                }
              },
              onProgressChanged: (controller, progress) {
                if (progress >= 100) {
                  setState(() {
                    showLoading = false;
                  });
                }
              },
            ),
            if (showLoading)
              const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              )
          ],
        ),
      ),
    );
  }

  void handleClick(int item) async {
    switch (item) {
      case 0:
        await InAppBrowser.openWithSystemBrowser(url: WebUri(url));
        break;
      case 1:
        await InAppWebViewController.clearAllCache();
        if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
          await webViewController?.clearHistory();
        }
        setState(() {});
        break;
    }
  }

  // ignore: unused_element
  static bool urlIsSecure(Uri url) {
    return (url.scheme == "https") || isLocalizedContent(url);
  }

  static bool isLocalizedContent(Uri url) {
    return (url.scheme == "file" ||
        url.scheme == "chrome" ||
        url.scheme == "data" ||
        url.scheme == "javascript" ||
        url.scheme == "about");
  }

  showSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.red,
        content: Text('Fungsi belum dibuat'),
      ),
    );
  }
}
