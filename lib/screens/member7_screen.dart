import 'package:flutter/material.dart';

const _name = 'Nishadi Rajasekara';
const _address = 'Gampaha, Sri Lanka';
const _email = 'nishu@gmail.com';
const _photoPath = 'assets/images/nishu.jpeg';
const _education = [
  'G.C.E. O/L - 7A 2B',
  'G.C.E. A/L - CCS',
  'Diploma / Certificate - Institute of Technology University of Moratuwa',
];
const _softSkills = ['Communication', 'Leadership', 'Time management'];
const _talents = ['Dancing', 'Netball', 'Drawing'];
// ==============================================================

class Member7Screen extends StatelessWidget {
  const Member7Screen({super.key});

  static const _accent = Color(0xFF5C6BC0);

  Widget _timeline() => Column(children: [
        for (var i = 0; i < _education.length; i++)
          IntrinsicHeight(
            child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              SizedBox(
                width: 30,
                child: Column(children: [
                  Container(width: 16, height: 16, decoration: const BoxDecoration(color: _accent, shape: BoxShape.circle)),
                  if (i != _education.length - 1) Expanded(child: Container(width: 3, color: _accent.withOpacity(0.4))),
                ]),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(_education[i], style: const TextStyle(fontSize: 16)),
                ),
              ),
            ]),
          ),
      ]);

  Widget _head(String t) => Padding(
        padding: const EdgeInsets.only(top: 12, bottom: 12),
        child: Text(t, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: _accent)),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5FA),
      appBar: AppBar(title: const Text('My Journey'), backgroundColor: _accent, foregroundColor: Colors.white),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Row(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.asset(_photoPath,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) =>
                      Container(width: 80, height: 80, color: Colors.indigo.shade100, child: const Icon(Icons.person, size: 40))),
            ),
            const SizedBox(width: 16),
            const Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(_name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text(_address),
                Text(_email),
              ]),
            ),
          ]),
          _head('Education Timeline'),
          _timeline(),
          _head('Soft Skills'),
          Wrap(spacing: 8, runSpacing: 8, children: [
            for (final s in _softSkills) Chip(label: Text(s), backgroundColor: Colors.indigo.shade100),
          ]),
          _head('Special Talents'),
          Wrap(spacing: 8, runSpacing: 8, children: [
            for (final t in _talents) Chip(label: Text(t), backgroundColor: Colors.amber.shade200),
          ]),
        ],
      ),
    );
  }
}
