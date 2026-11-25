import 'package:flutter/material.dart';

const _name = 'Nuwanthi Piyathilaka';
const _address = 'Kandy, Sri Lanka';
const _email = 'nuwanthi@gmail.com';
const _photoPath = 'assets/images/nuwanthi.jpeg';
const _education = [
  'G.C.E. O/L - 7A 2B',
  'G.C.E. A/L - 3A',
  'Diploma / Certificate - Institute of Technology University of Moratuwa',
];
const _softSkills = ['Confidence', 'Communication', 'Time management'];
const _talents = ['Music', 'Drawing','Dancing'];
// ==============================================================

class Member3Screen extends StatelessWidget {
  const Member3Screen({super.key});

  Widget _title(String t) => Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 8),
        child: Text(t.toUpperCase(),
            style: const TextStyle(color: Colors.amberAccent, letterSpacing: 2, fontWeight: FontWeight.bold)),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0, foregroundColor: Colors.white),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(_photoPath,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(color: Colors.blueGrey)),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withOpacity(0.5), Colors.black.withOpacity(0.92)],
                  stops: const [0.2, 0.5, 0.8],
                ),
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 340, 20, 24),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text(_name, style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w800)),
                const SizedBox(height: 4),
                const Text('$_address  |  $_email', style: TextStyle(color: Colors.white70)),
                _title('Education'),
                for (final e in _education) Text('▸ $e', style: const TextStyle(color: Colors.white)),
                _title('Soft skills'),
                Wrap(spacing: 8, children: [
                  for (final s in _softSkills)
                    Chip(label: Text(s), backgroundColor: Colors.white24, labelStyle: const TextStyle(color: Colors.black)),
                ]),
                _title('Talents'),
                Wrap(spacing: 8, children: [
                  for (final t in _talents)
                    Chip(label: Text(t), backgroundColor: Colors.amber, labelStyle: const TextStyle(color: Colors.black)),
                ]),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
