import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const InstaCleanerApp());
}

class InstaCleanerApp extends StatelessWidget {
  const InstaCleanerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Insta Cleaner',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const InstaWebView(),
    );
  }
}

class InstaWebView extends StatefulWidget {
  const InstaWebView({super.key});

  @override
  State<InstaWebView> createState() => _InstaWebViewState();
}

class _InstaWebViewState extends State<InstaWebView> {
  late final WebViewController _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (String url) async {
            setState(() {
              _isLoading = false;
            });
            _injectCSSHider();
          },
        ),
      )
      ..loadRequest(Uri.parse('https://www.instagram.com/direct/inbox/')); // change this to your profile
  }

  void _injectCSSHider() {
    _controller.runJavaScript('''
      const style = document.createElement('style');
      style.innerHTML = \`
        a[href*="/reels"], 
        a[href*="/explore"], 
        svg[aria-label="Reels"], 
        svg[aria-label="Explore"] {
          display: none !important;
        }
      \`;
      document.head.appendChild(style);
    ''');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      
      appBar: AppBar(
        title: const Text('🇨🇿 Adam Urban IG'),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          if (_isLoading)
            const Center(
              child: CircularProgressIndicator(color: Colors.deepPurpleAccent),
            ),
          
        ],
      ),
    );
  }
}
