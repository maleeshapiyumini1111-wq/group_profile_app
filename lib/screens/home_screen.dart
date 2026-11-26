// OWNER: Member 3
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'member1_screen.dart';
import 'member2_screen.dart';
import 'member3_screen.dart';
import 'member4_screen.dart';
import 'member5_screen.dart';
import 'member6_screen.dart';
import 'member7_screen.dart';
import 'member8_screen.dart';
import 'member9_screen.dart';

class _MemberItem {
  final String name; 
  final String design;
  final Widget Function() builder;
  const _MemberItem(this.name, this.design, this.builder);
}

final List<_MemberItem> _members = [
  _MemberItem('A.P.M.Piyumini\n23IT0514', 'Gradient Cards', () => const Member1Screen()),
  _MemberItem('K.G.H.Nisansala\n23IT0511', 'Tab Bar', () => const Member2Screen()),
  _MemberItem('S.G.N.K.Piyathilaka\n23IT0513', 'Cover Photo Stack', () => const Member3Screen()),
  _MemberItem('R.M.N.Nethsara\n23IT0510', 'Expansion Tiles', () => const Member4Screen()),
  _MemberItem('R.M.C.B.Rajapaksha\n23IT0517', 'Grid Cards', () => const Member5Screen()),
  _MemberItem('M.R.S.Nishadini\n23IT0512', 'Dark Neon', () => const Member6Screen()),
  _MemberItem('L.R.W.S.N.Rajasekara\n23IT0518', 'Timeline', () => const Member7Screen()),
  _MemberItem('S.A.S.S.Premachandra\n23IT0515', 'Curved Header', () => const Member8Screen()),
  _MemberItem('A.J.Raaef\n23IT0516', 'Minimal', () => const Member9Screen()),
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Our Group'),
        actions: [
          IconButton(
            tooltip: 'Logout',
            icon: const Icon(Icons.logout),
            
            onPressed: () => FirebaseAuth.instance.signOut(),
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.1,
        ),
        itemCount: _members.length,
        itemBuilder: (context, i) {
          final m = _members[i];
          return InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => m.builder())),
            child: Card(
              elevation: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(radius: 28, child: Text('${i + 1}')),
                  const SizedBox(height: 8),
                  Text(m.name, textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(m.design, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
