import 'package:flutter/material.dart';

class EmptyNotesView extends StatelessWidget {
  const EmptyNotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
    Image.asset(
      'assets/images/notes.webp',
      height: 104,
      width: 104,
    ),
            
            const SizedBox(height: 25),
            const Text(
              'Nothing Here Yet',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            const Text(
              'Tap The Plus Button to Write Your First Note.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12,),
            ),
          ],
        ),
      ),
    );
  }
}