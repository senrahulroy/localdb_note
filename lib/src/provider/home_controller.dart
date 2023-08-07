import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Is Home screen Provider
final homeProvider = ChangeNotifierProvider((ref) {
  return HomeScreenController();
});

/// Home Screen Controller
class HomeScreenController extends ChangeNotifier {
  /// boolen cheker
  bool _isListView = true;

  /// get methode for listView
  bool get isListView => _isListView;

  /// its list view & grid view toggle
  listViewToggle() {
    _isListView = !_isListView;
    notifyListeners();
  }
}
