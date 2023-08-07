import 'package:get/get.dart';
import 'package:webviewx/webviewx.dart';

class RenderHtmlController extends GetxController {
  late WebViewXController webviewController;
  bool lock = false;

  void initController(controller) {
    webviewController = controller;

    // if (!lock) {
    //   lock = true;
    //   // _setHtmlFromAssets();
    //   _setUrl();
    // }
  }

  void _setUrl() {
    webviewController.loadContent(
      'https://flutter.dev',
      SourceType.url,
    );
  }

  void _setHtmlFromAssets() {
    webviewController.loadContent(
      'assets/videos/index.html',
      SourceType.html,
      fromAssets: true,
    );
  }

  @override
  void onClose() {
    webviewController.dispose();
    super.onClose();
  }

  String setPointerEvents = '''
  function setPointerEvents() {
    document.getElementById("video").style.pointerEvents = 'none';
  }
    ''';

  final String initContent = '''
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <style>
        html,
        body {
            height: 100%;
            margin: 0;
            padding: 0;
        }

        #video {
            object-fit: fill;
        }
    </style>
</head>

<body>
    <video controls loop id="video" width="585.2" height="351.12" onplay="setPointerEvents()">
        <!-- <video controls autoplay loop id="video" width="100%"> -->
        <source src="/assets/assets/videos/introduction-smartbin.mp4" type="video/mp4">
        <!-- <source src="introduction-smartbin.mp4" type="video/mp4"> -->
    </video>
</body>

<script>
    function setPointerEvents() {
        document.getElementById("video").style.pointerEvents = 'none';
    }
</script>

</html>
      ''';
}
