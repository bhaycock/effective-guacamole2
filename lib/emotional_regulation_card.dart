import 'package:flutter/material.dart';

class EmotionalRegulationCard extends StatefulWidget {
  const EmotionalRegulationCard({Key? key}) : super(key: key);

  @override
  _EmotionalRegulationCardState createState() => _EmotionalRegulationCardState();
}

class _EmotionalRegulationCardState extends State<EmotionalRegulationCard> {
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
              Colors.blue[50]!,
              Colors.purple[50]!,
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
                  // Mantra Section - Now at the top with adjusted styling
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 32,
                      horizontal: 24,
                    ),
                    color: Colors.white.withOpacity(0.5),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.favorite, color: Colors.red[400], size: 28),
                            const SizedBox(width: 12),
                            Text(
                              'My Mantra',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey[700],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          '"I am secure; emotions distort, but don\'t define."',
                          style: TextStyle(
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                            color: Colors.purple[700],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),

                  // Reflection Steps
                  _buildExpandableSection(
                    'reflection',
                    'Reflection Steps',
                    Icons.psychology,
                    Colors.blue[500]!,
                    [
                      _buildStep('1', 'Name Your Emotion:', 'What am I feeling and why?'),
                      _buildStep('2', 'Identify the Story:', 'What narrative am I telling myself?'),
                      _buildStep('3', 'Question the Narrative:', 'Is this story true, or could there be another explanation?'),
                    ],
                  ),

                  // Reframing Steps
                  _buildExpandableSection(
                    'reframing',
                    'Reframing Steps',
                    Icons.lightbulb,
                    Colors.yellow[700]!,
                    [
                      _buildStep('1', 'Consider Alternatives:', 'What other reasons might explain this person\'s behaviour?'),
                      _buildStep('2', 'Focus on Learning:', 'What can I learn from this experience?'),
                      _buildStep('3', 'Ground Yourself:', 'Take a deep breath and repeat your phrase.'),
                    ],
                  ),

                  // Journal Section
                  _buildExpandableSection(
                    'journal',
                    'Journal Reflection',
                    Icons.book,
                    Colors.green[600]!,
                    [
                      Container(
                        margin: const EdgeInsets.only(top: 8),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border(
                            left: BorderSide(
                              color: Colors.green[500]!,
                              width: 4,
                            ),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '"How will I journal this later?"',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.grey[600],
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'Consider capturing:',
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                            const SizedBox(height: 8),
                            ...['The initial emotion and trigger',
                              'How you applied these steps',
                              'What you learned about yourself',
                              'How you might handle similar situations in the future'
                            ].map((text) => Padding(
                              padding: const EdgeInsets.only(left: 16, bottom: 4),
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
                                      text,
                                      style: TextStyle(color: Colors.grey[600]),
                                    ),
                                  ),
                                ],
                              ),
                            )).toList(),
                          ],
                        ),
                      ),
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
                      const SizedBox(width: 8),
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[700],
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
              child: Column(children: children),
            ),
        ],
      ),
    );
  }

  Widget _buildStep(String number, String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            number,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.purple[600],
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: TextStyle(color: Colors.grey[600]),
                children: [
                  TextSpan(
                    text: '$title ',
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  TextSpan(text: description),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}