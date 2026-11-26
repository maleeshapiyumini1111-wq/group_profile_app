import 'package:flutter/material.dart';


const _name = 'Sithmi Nishadini';
const _address = 'Polonnaruwa, Sri Lanka';
const _email = 'sithminishadini10@gmail.com';
const _photoPath = 'assets/images/sithmi.jpeg';
const _education = [
  'G.C.E. O/L - 8A 1B',
  'G.C.E. A/L - CCS',
  'Diploma / Certificate - Institute of Technology University of Moratuwa',
];
const _softSkills = ['Problem Solving', 'Communication', 'Leadership', 'Creativity'];
const _talents = ['Dancing', 'Music', 'Volley Ball'];


class Member6Screen extends StatefulWidget {
  const Member6Screen({super.key});
  @override
  State<Member6Screen> createState() => _Member6ScreenState();
}

class _Member6ScreenState extends State<Member6Screen> {
  bool _pink = false; // state management: neon colour toggle
  Color get _neon => _pink ? const Color(0xFFFF2E93) : const Color(0xFF00E5FF);

  Widget _box(String title, List<String> items) => Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF14142B),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: _neon, width: 1.5),
          boxShadow: [BoxShadow(color: _neon.withOpacity(0.5), blurRadius: 12)],
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('> $title', style: TextStyle(color: _neon, fontFamily: 'monospace', fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          for (final i in items)
            Text('  $i', style: const TextStyle(color: Colors.white, fontFamily: 'monospace')),
        ]),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A18),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0A18),
        foregroundColor: _neon,
        title: const Text('PROFILE.EXE', style: TextStyle(fontFamily: 'monospace')),
        actions: [IconButton(icon: const Icon(Icons.palette), onPressed: () => setState(() => _pink = !_pink))],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: _neon, width: 3),
                boxShadow: [BoxShadow(color: _neon, blurRadius: 20)],
              ),
              child: ClipOval(
                child: Image.asset(_photoPath,
                    width: 130,
                    height: 130,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => const SizedBox(
                        width: 130, height: 130, child: Icon(Icons.person, size: 70, color: Colors.white54))),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(_name,
              textAlign: TextAlign.center,
              style: TextStyle(color: _neon, fontSize: 24, fontFamily: 'monospace', fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          _box('CONTACT', [_address, _email]),
          _box('EDUCATION', _education),
          _box('SOFT_SKILLS', _softSkills),
          _box('TALENTS', _talents),
        ],
      ),
    );
  }
}
