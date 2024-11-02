// cue_card_menu.dart

import 'package:flutter/material.dart';
import 'emotional_regulation_card.dart';
import 'emotional_intelligence_card.dart';

class CueCardMenu extends StatelessWidget {
  const CueCardMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue[50]!,
              Colors.purple[50]!,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Emotional Intelligence\nCue Cards',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                Expanded(
                  child: ListView(
                    children: [
                      _buildCardButton(
                        context,
                        'Lesson 1: Emotional Intelligence Essentials',
                        Icons.school,
                        Colors.blue,
                            () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EmotionalIntelligenceCard(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildCardButton(
                        context,
                        'Lesson 2: Emotional Regulation Guide',
                        Icons.favorite,
                        Colors.purple,
                            () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EmotionalRegulationCard(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCardButton(
      BuildContext context,
      String title,
      IconData icon,
      Color color,
      VoidCallback onPressed,
      ) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Icon(icon, color: color, size: 32),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey[400],
              ),
            ],
          ),
        ),
      ),
    );
  }
}