import 'package:flutter/material.dart';
import 'data/questions.dart';

class HelpContent extends StatefulWidget {
  const HelpContent({super.key});

  @override
  State<HelpContent> createState() => _HelpContentState();
}

class _HelpContentState extends State<HelpContent> {
  Map<int, bool> expandedStates = {}; // Stores the visibility state of answers

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    double titleFontSize = width < 400 ? 17 : 20;
    double answerFontSize = width < 400 ? 15 : 18;

    return SingleChildScrollView(
      child: Column(
        children: [
          Card(
            color: Colors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: _buildFAQList(titleFontSize, answerFontSize),
          ),
        ],
      ),
    );
  }

  /// Builds the FAQ list dynamically
  Widget _buildFAQList(double titleFontSize, double answerFontSize) {
    return Column(
      children: questions.asMap().entries.map((entry) {
        int index = entry.key;
        var qa = entry.value;
        bool isExpanded = expandedStates[index] ?? false;

        return Card(
          margin: const EdgeInsets.all(16),
          color: const Color(0xffF8F9FE),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      expandedStates[index] = !isExpanded;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: SizedBox(
                      width: double.infinity, // Ensures it takes full width
                      child: Text(
                        qa.text,
                        style: TextStyle(
                          color: const Color.fromRGBO(21, 183, 186, 1),
                          fontSize: titleFontSize,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                ),
                if (isExpanded) // Show answer only when tapped
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: SizedBox(
                      width: double.infinity, // Ensures it takes full width
                      child: Text(
                        qa.answers,
                        style: TextStyle(
                          color: const Color(0xff71727A),
                          fontSize: answerFontSize,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
