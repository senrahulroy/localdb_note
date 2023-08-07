import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localdb_note/src/model/note.dart';
import 'package:auto_animated/auto_animated.dart';
import 'package:localdb_note/utils/res/widgets/notes_grid_item.dart';

class NotesGrid extends StatelessWidget {
  const NotesGrid({super.key, required this.notes});

  final List<Note> notes;
  @override
  Widget build(BuildContext context) {
    return LiveGrid.options(
        itemBuilder: (context, index, animation) {
          return NoteGridItem(note: notes[index]);
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 16.sp, mainAxisSpacing: 16.sp),
        itemCount: notes.length,
        options: const LiveOptions());
  }
}
