import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:isar/isar.dart';
import 'package:localdb_note/src/model/note.dart';
import 'package:localdb_note/src/provider/create_note_controller.dart';
import 'package:localdb_note/src/services/local_db.dart';
import 'package:localdb_note/utils/res/app_assets.dart';
import 'package:localdb_note/utils/res/app_strings.dart';
import 'package:localdb_note/utils/res/widgets/notes_common.dart';
import 'package:lottie/lottie.dart';

class AddNote extends ConsumerStatefulWidget {
  const AddNote({
    super.key,
    this.note,
  });

  final Note? note;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddNoteState();
}

class _AddNoteState extends ConsumerState<AddNote> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  final localDb = LocalDBServices();

  @override
  void initState() {
    super.initState();

    if (widget.note != null) {
      titleController.text = widget.note!.title;
      descriptionController.text = widget.note!.description;
    }
  }

  @override
  void dispose() {
    super.dispose();
    final title = titleController.text;
    final desc = descriptionController.text;
    // final tempId = widget.note!.

    if (widget.note != null) {
      if (title.isEmpty && desc.isEmpty) {
        localDb.deleteNote(id: widget.note!.id);
      } else if (widget.note!.title != title ||
          widget.note!.description != desc) {
        final newNote = widget.note!.copyWith(
          title: title,
          description: desc,
        );
        localDb.saveNote(note: newNote);
      }
    } else {
      final newNote = Note(
          id: Isar.autoIncrement,
          title: title,
          description: desc,
          lastMod: DateTime.now());
      localDb.saveNote(note: newNote);
    }

    //   if (widget.note != null) {
    //     if (title.isEmpty && title.isEmpty) {
    //       localDb.deleteNote(id: tempId);
    //     }

    //     final newNote = widget.note!.copyWith(title: title, description: desc);
    //     localDb.saveNote(note: newNote);
    //     return;
    //   }

    //   if (title.isEmpty && title.isEmpty) {
    //     return;
    //   }
    //   final newNote = Note(
    //       id: Isar.autoIncrement,
    //       title: title,
    //       description: desc,
    //       lastMod: DateTime.now());
    //   localDb.saveNote(note: newNote);
  }

  @override
  Widget build(BuildContext context) {
    final createWatch = ref.watch(createNoteProvider);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text(AppString.strAddNote),
            const Spacer(),
            widget.note != null
                ? IconButton(
                    onPressed: () {
                      /// Setup delete
                      ///
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(
                              "Let's Confirm Delete ",
                              style: GoogleFonts.poppins(fontSize: 15),
                            ),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Lottie.asset(
                                  AppAssets.deleteJson,
                                ),
                                Text(
                                  "Permanently Delete",
                                  style: GoogleFonts.poppins(fontSize: 15),
                                ),
                              ],
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    final tempId = widget.note!.id;
                                    final tempTitle = widget.note!.title;

                                    localDb.deleteNote(id: tempId);
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                "Delete successed $tempTitle")));

                                    Navigator.pop(context);
                                  },
                                  child: const Text('Confirm')),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Cancel')),
                            ],
                          );
                        },
                      );
                    },
                    icon: const Icon(Icons.delete),
                  )
                : const Spacer(),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        child: Column(
          children: [
            Gap(25.sp),
            CustomTextField(
              controller: titleController,
              focusNode: createWatch.titleFocusNode,
              icon: const Icon(Icons.title),
              hint: 'Enter title',
              label: 'Title',
            ),
            Gap(25.sp),
            CustomTextField(
              controller: descriptionController,
              focusNode: createWatch.descriptionFocusNode,
              icon: const Icon(Icons.note_add_outlined),
              hint: 'Enter description',
              label: 'Note',
            ),
          ],
        ),
      ),
    );
  }
}
