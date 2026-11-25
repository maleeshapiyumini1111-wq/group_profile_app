import 'package:flutter/material.dart';


const _name = 'Nadun Nethsara';
const _address = 'Hambanthota, Sri Lanka';
const _email = 'nadun@gmail.com';
const _photoPath = 'assets/images/nadun.jpeg';
const _education = [
  'G.C.E. O/L - 8A 1B',
  'G.C.E. A/L - CCS',
  'Diploma / Certificate - Institute of Technology University of Moratuwa',
];
const _softSkills = ['Teamwork', 'Time management'];
const _talents = ['Cricket', 'Drama', 'Drawing'];
// ==============================================================

class Member4Screen extends StatefulWidget {
  const Member4Screen({super.key});
  @override
  State<Member4Screen> createState() => _Member4ScreenState();
}

class _Member4ScreenState extends State<Member4Screen> {
  int _likes = 0; // state management

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF3E0),
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
        onPressed: () => setState(() => _likes++),
        icon: const Icon(Icons.thumb_up),
        label: Text('$_likes'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Center(
            child: ClipOval(
              child: Image.asset(_photoPath,
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                      width: 120, height: 120, color: Colors.orange.shade200, child: const Icon(Icons.person, size: 60))),
            ),
          ),
          const SizedBox(height: 12),
          const Text(_name,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.brown)),
          const SizedBox(height: 16),
          const Card(
            child: ExpansionTile(
              leading: Icon(Icons.contact_mail, color: Colors.deepOrange),
              title: Text('Contact'),
              initiallyExpanded: true,
              children: [
                ListTile(leading: Icon(Icons.home), title: Text(_address)),
                ListTile(leading: Icon(Icons.email), title: Text(_email)),
              ],
            ),
          ),
          Card(
            child: ExpansionTile(
              leading: const Icon(Icons.school, color: Colors.deepOrange),
              title: const Text('Academic Qualifications'),
              children: [for (final e in _education) ListTile(title: Text(e))],
            ),
          ),
          Card(
            child: ExpansionTile(
              leading: const Icon(Icons.psychology, color: Colors.deepOrange),
              title: const Text('Soft Skills'),
              children: [for (final s in _softSkills) ListTile(title: Text(s))],
            ),
          ),
          Card(
            child: ExpansionTile(
              leading: const Icon(Icons.star, color: Colors.deepOrange),
              title: const Text('Special Talents'),
              children: [for (final t in _talents) ListTile(title: Text(t))],
            ),
          ),
        ],
      ),
    );
  }
}
