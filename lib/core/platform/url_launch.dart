import 'package:url_launcher/url_launcher.dart';

class UrlLaunch{
  UrlLaunch();

  void openURL(String url) async {
    await canLaunchUrl(Uri.parse(url)) ? await launchUrl(Uri.parse(url)) : throw 'Could not launch $url';
  }
}