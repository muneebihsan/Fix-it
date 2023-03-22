
import 'package:flutter/foundation.dart';

import 'package:fixit/Networking/networking.dart';
class AppData extends ChangeNotifier {
   String userLocation = 'Home';
updatePickupLocation  (userLocation) async
{
  notifyListeners();

}

}