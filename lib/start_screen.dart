import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Opacity(
            opacity: 0.6,
            child: Icon(Icons.shield, size: 200, color: Color(0xFFD4AF37)),
          ),
          const SizedBox(height: 40),
          Text(
            'Warcraft Kvíz',
            style: GoogleFonts.cinzel(
              color: const Color(0xFFD4AF37),
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Ako dobre poznáš Azeroth?',
            style: TextStyle(color: Color(0xFFF3E5C0), fontSize: 18),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color(0xFFD4AF37),
              side: const BorderSide(color: Color(0xFFD4AF37)),
            ),
            icon: const Icon(Icons.play_arrow),
            label: const Text('Začať kvíz'),
          ),
        ],
      ),
    );
  }
}
