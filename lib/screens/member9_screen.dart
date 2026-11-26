import 'package:flutter/material.dart';

const _name = 'A.J.Raaef';
const _address = 'Ampara, Sri Lanka';
const _email = 'raaef@gmail.com';
const _photoPath = 'assets/images/raaef.jpeg';
const _education = [
  'G.C.E. O/L - 7A 2B',
  'G.C.E. A/L - CCC',
  'Diploma / Certificate - Institute of Technology University of Moratuwa',
];
const _softSkills = ['Creativity','Leadership', 'Time management'];
const _talents = ['Cricket','Drawing'];
// ==============================================================

class Member9Screen extends StatelessWidget {
  const Member9Screen({super.key});

  Widget _label(String t) => Padding(
        padding: const EdgeInsets.only(top: 36, bottom: 10),
        child: Text(t.toUpperCase(),
            style: const TextStyle(fontSize: 12, letterSpacing: 3, color: Colors.black45)),
      );

  Widget _line(String t) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Text(t, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w300)),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white, elevation: 0, foregroundColor: Colors.black),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
        children: [
          const Text(_name,
              style: TextStyle(fontSize: 44, fontWeight: FontWeight.w200, height: 1.1, letterSpacing: -1)),
          const SizedBox(height: 24),
          ColorFiltered(
            colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.saturation),
            child: Image.asset(_photoPath,
                height: 260,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) =>
                    Container(height: 260, color: Colors.black12, child: const Icon(Icons.person, size: 80))),
          ),
          _label('Contact'),
          _line(_address),
          _line(_email),
          const Divider(height: 40),
          _label('Education'),
          for (final e in _education) _line(e),
          const Divider(height: 40),
          _label('Soft skills'),
          for (final s in _softSkills) _line(s),
          const Divider(height: 40),
          _label('Talents'),
          for (final t in _talents) _line(t),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
