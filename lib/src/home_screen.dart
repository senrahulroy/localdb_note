import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:localdb_note/src/create_note_screen.dart';
import 'package:localdb_note/src/empty_screen.dart';
import 'package:localdb_note/src/model/note.dart';
import 'package:localdb_note/src/provider/create_note_controller.dart';
import 'package:localdb_note/src/provider/home_controller.dart';
import 'package:localdb_note/src/services/local_db.dart';
import 'package:localdb_note/utils/res/app_strings.dart';
import 'package:localdb_note/utils/res/widgets/notes_grid.dart';
import 'package:localdb_note/utils/res/widgets/notes_list.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  CreateNoteController? createNoteController;

  @override
  Widget build(BuildContext context) {
    final homeWatch = ref.watch(homeProvider);

    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                Text(AppString.strAppName,
                    style: GoogleFonts.poppins(
                      fontSize: 24.sp,
                    )),
                const Spacer(),
                InkWell(
                  onTap: () {
                    homeWatch.listViewToggle();
                  },
                  child: homeWatch.isListView
                      ? const Icon(Icons.splitscreen_outlined)
                      : const Icon(Icons.grid_view),

                  // child: AnimatedSwitcher(
                  //   duration: const Duration(milliseconds: 300),
                  //   child: homeWatch.isListView
                  //       ? const Icon(Icons.splitscreen_outlined)
                  //       : const Icon(Icons.grid_view),
                  // ),
                ),
              ],
            ),
          ),
          body: StreamBuilder<List<Note>>(
              stream: LocalDBServices().getAllNotes(),
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return const EmptyScreen();
                }
                final notes = snapshot.data!;
                return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    child: homeWatch.isListView
                        ? NotesList(notes: notes)
                        : NotesGrid(notes: notes));
                // if (homeWatch.isListView) {
                //   return NotesList(notes: notes);
                // }
                // return NotesGrid(notes: notes);

                ////
              }), //const EmptyScreen(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const AddNote(),
              ));
            },
            child: const Icon(Icons.note_add_outlined),
          ),
        ),
      ),
    );
  }
}
