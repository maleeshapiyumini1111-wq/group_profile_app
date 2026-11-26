import 'package:flutter/material.dart';

const _name = 'Maleesha Piyumini';
const _address = 'Matara, Sri Lanka';
const _email = 'maleesha@gmail.com';
const _photoPath = 'assets/images/profile.jpg';
const _education = [
  'G.C.E. O/L - 8A 1B',
  'G.C.E. A/L - BBC',
  'Diploma / Certificate - Institute of Technology, University of Moratuwa',
];
const _softSkills = ['Teamwork', 'Communication', 'Leadership', 'Time management'];
const _talents = ['Cricket', 'Music', 'Drawing'];
// ==============================================================

class Member1Screen extends StatefulWidget {
  const Member1Screen({super.key});
  @override
  State<Member1Screen> createState() => _Member1ScreenState();
}

class _Member1ScreenState extends State<Member1Screen> {
  bool _liked = false; // state management

  Widget _card(String title, Widget child) => Card(
        margin: const EdgeInsets.only(bottom: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF764BA2))),
            const SizedBox(height: 8),
            child,
          ]),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(_liked ? Icons.favorite : Icons.favorite_border, color: Colors.pinkAccent),
            onPressed: () => setState(() => _liked = !_liked),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF667EEA), Color(0xFF764BA2)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Center(
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                  child: ClipOval(
                    child: Image.asset(_photoPath,
                        width: 130,
                        height: 130,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => const SizedBox(
                            width: 130, height: 130, child: Icon(Icons.person, size: 70))),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              const Text(_name,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white)),
              const SizedBox(height: 16),
              _card('Contact', Column(children: const [
                ListTile(leading: Icon(Icons.home), title: Text(_address), dense: true),
                ListTile(leading: Icon(Icons.email), title: Text(_email), dense: true),
              ])),
              _card('Education', Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [for (final e in _education) Text('• $e')])),
              _card('Soft Skills', Wrap(spacing: 8,
                  children: [for (final s in _softSkills) Chip(label: Text(s))])),
              _card('Special Talents', Wrap(spacing: 8,
                  children: [for (final t in _talents) Chip(label: Text(t))])),
            ],
          ),
        ),
      ),
    );
  }
}
