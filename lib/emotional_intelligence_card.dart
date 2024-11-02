// emotional_intelligence_card.dart

import 'package:flutter/material.dart';

class EmotionalIntelligenceCard extends StatefulWidget {
  const EmotionalIntelligenceCard({Key? key}) : super(key: key);

  @override
  _EmotionalIntelligenceCardState createState() => _EmotionalIntelligenceCardState();
}

class _EmotionalIntelligenceCardState extends State<EmotionalIntelligenceCard> {
  String? expandedSection;

  void toggleSection(String section) {
    setState(() {
      expandedSection = expandedSection == section ? null : section;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.green[50]!,
              Colors.blue[50]!,
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 4,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(24),
                    color: Colors.white.withOpacity(0.5),
                    child: const Text(
                      'Emotional Intelligence Essentials',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  _buildExpandableSection(
                    'awareness',
                    'Self-Awareness',
                    Icons.psychology,
                    Colors.purple[400]!,
                    [
                      _buildSubsection('Understanding Emotions',
                          'Recognize and name your emotions to better understand them.'),
                      _buildSubsection('Impact on Others',
                          'Be aware of how your emotions influence your behavior and affect those around you.'),
                      _buildListSection('Key Reflection Questions:', [
                        'What am I feeling right now?',
                        'How does this emotion impact my thoughts and actions?',
                        'What might be causing or triggering this emotion?'
                      ]),
                    ],
                  ),

                  _buildExpandableSection(
                    'mindfulness',
                    'Mindfulness',
                    Icons.spa,
                    Colors.teal[400]!,
                    [
                      _buildSubsection('Definition',
                          'Being present and aware without judgment.'),
                      _buildSubsection('Basic Exercise', ''),
                      _buildListSection('', [
                        'Find a comfortable position, close your eyes, and take slow, deep breaths.',
                        'Observe your thoughts and emotions as they arise without trying to change them.',
                        'If your mind wanders, gently bring your focus back to your breath.'
                      ]),
                      _buildSubsection('Daily Practice',
                          'Set aside a few minutes each day for mindful breathing to increase emotional clarity.'),
                    ],
                  ),

                  _buildExpandableSection(
                    'journaling',
                    'Journaling',
                    Icons.book,
                    Colors.orange[400]!,
                    [
                      _buildSubsection('Approach Setting',
                          'Clarify your intention for each journaling session. Are you seeking insight, gratitude, or emotional processing?'),
                      _buildListSection('Journaling Prompts:', [
                        'What went well today?',
                        'What didn\'t go well, and how did it make me feel?',
                        'What emotions did I experience, and what triggered them?',
                        'What story am I telling myself, and how can I reframe it?',
                        'What is one thing I am grateful for today?'
                      ]),
                      _buildSubsection('Journaling Techniques', ''),
                      _buildTechnique('Structured Journaling',
                          'Use specific prompts to guide your reflection.'),
                      _buildTechnique('Free-Writing',
                          'Write continuously without editing to tap into your subconscious thoughts.'),
                      _buildTechnique('Gratitude Journaling',
                          'Focus on things you\'re thankful for to cultivate a positive mindset.'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildExpandableSection(
      String id,
      String title,
      IconData icon,
      Color iconColor,
      List<Widget> children,
      ) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey[200]!),
        ),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () => toggleSection(id),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(icon, color: iconColor),
                      const SizedBox(width: 12),
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[800],
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    expandedSection == id
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: Colors.grey[500],
                  ),
                ],
              ),
            ),
          ),
          if (expandedSection == id)
            Padding(
              padding: const EdgeInsets.only(
                left: 24,
                right: 24,
                bottom: 24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: children,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildSubsection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title.isNotEmpty) Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          if (title.isNotEmpty) const SizedBox(height: 8),
          if (content.isNotEmpty) Text(
            content,
            style: TextStyle(
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListSection(String title, List<String> items) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title.isNotEmpty) Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          ...items.map((item) => Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  width: 4,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey[600],
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    item,
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),
                ),
              ],
            ),
          )).toList(),
        ],
      ),
    );
  }

  Widget _buildTechnique(String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: TextStyle(
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }
}