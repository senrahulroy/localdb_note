import 'package:isar/isar.dart';
import 'package:localdb_note/src/model/note.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider/path_provider.dart';

class LocalDBServices {
  late Future<Isar> db;
  LocalDBServices() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    final dir = await getApplicationDocumentsDirectory();
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open([NoteSchema],
          inspector: true, directory: dir.path);
    }
    return Future.value(Isar.getInstance());
  }

  Future<void> saveNote({required Note note}) async {
    final isar = await db;
    isar.writeTxnSync(() => isar.notes.putSync(note));
  }

  Stream<List<Note>> getAllNotes() async* {
    final isar = await db;
    yield* isar.notes.where().watch(fireImmediately: true);
  }

  void deleteNote({required int id}) async {
    final isar = await db;
    isar.writeTxnSync(() => isar.notes.deleteSync(id));
  }
}
