import 'package:flutter/material.dart';


const _name = 'Chamodya Rajapaksha';
const _address = 'Matale, Sri Lanka';
const _email = 'chamodya@gmail.com';
const _photoPath = 'assets/images/chamodya.jpeg';
const _education = [
  'G.C.E. O/L - 8A 1B',
  'G.C.E. A/L - CCS',
  'Diploma / Certificate - Institute of Technology University of Moratuwa',
];
const _softSkills = ['Confidence', 'Communication', 'Adapatability'];
const _talents = ['Netball', 'Dancing'];
// ==============================================================

class Member5Screen extends StatelessWidget {
  const Member5Screen({super.key});

  Widget _grid(List<String> items, Color color, IconData icon) => GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 1.6,
        children: [
          for (final i in items)
            Container(
              decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(16)),
              child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Icon(icon, color: Colors.white),
                const SizedBox(height: 4),
                Text(i, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ]),
            ),
        ],
      );

  Widget _head(String t) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Text(t, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green.shade800)),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(title: const Text(_name), backgroundColor: Colors.green.shade700, foregroundColor: Colors.white),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(_photoPath,
                  width: 110,
                  height: 130,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                      width: 110, height: 130, color: Colors.green.shade200, child: const Icon(Icons.person, size: 60))),
            ),
            const SizedBox(width: 16),
            const Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(_name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 6),
                Text(_address),
                Text(_email),
              ]),
            ),
          ]),
          _head('Academic Qualifications'),
          _grid(_education, Colors.green.shade600, Icons.school),
          _head('Soft Skills'),
          _grid(_softSkills, Colors.teal, Icons.psychology),
          _head('Special Talents'),
          _grid(_talents, Colors.lightGreen.shade700, Icons.star),
        ],
      ),
    );
  }
}
