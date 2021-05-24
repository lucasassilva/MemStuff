import 'package:url_launcher/url_launcher.dart';

class PhoneServices{
   call(String number) => launch('tel:$number');
}