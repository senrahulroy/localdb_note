import 'package:auto_animated_list/auto_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:localdb_note/src/model/note.dart';
import 'package:localdb_note/utils/res/widgets/notes_list_item.dart';

class NotesList extends StatelessWidget {
  const NotesList({super.key, required this.notes});
  final List<Note> notes;

  @override
  Widget build(BuildContext context) {
    return AutoAnimatedList<Note>(
      items: notes,
      itemBuilder: (context, note, index, anim) {
        return SizeFadeTransition(
          animation: anim,
          child: NoteListItem(
            note: notes[index],
          ),
        );
      },
    );
  }
}


//  ListView.builder(
//       itemCount: notes.length,
//       itemBuilder: (context, index) {
      
//       },
//     );