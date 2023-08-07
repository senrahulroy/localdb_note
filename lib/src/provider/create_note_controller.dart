import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Crate Provider

final createNoteProvider = ChangeNotifierProvider((ref) {
  return CreateNoteController();
});

/// Create note Controller
class CreateNoteController extends ChangeNotifier {
  // /// TextEdit Controller
  // final titleController = TextEditingController();
  // final descriptionController = TextEditingController();

  /// Focus Node
  FocusNode titleFocusNode = FocusNode();
  FocusNode descriptionFocusNode = FocusNode();
}
