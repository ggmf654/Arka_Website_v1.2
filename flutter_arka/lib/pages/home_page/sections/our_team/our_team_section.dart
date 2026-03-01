import 'package:flutter/material.dart';
import '../../../../constants/responsive_scope.dart';
import '../../../../theme/app_theme.dart';
import '../../widgets/navigation_dots.dart';
import 'team_header.dart';
import 'team_member_card.dart';

class OurTeamSection extends StatefulWidget {
  const OurTeamSection({super.key});

  @override
  State<OurTeamSection> createState() => _OurTeamSectionState();
}

class _OurTeamSectionState extends State<OurTeamSection> {
  int _currentIndex = 0;

  final List<Map<String, String>> _teamMembers = [
    {
      "name": "Ammar Safi",
      "role": "Founder & Lead Developer",
      "image": "assets/team/member1.jpg",
    },
    {
      "name": "Sarah Johnson",
      "role": "UI/UX Designer",
      "image": "assets/team/member2.jpg",
    },
    {
      "name": "David Brown",
      "role": "Backend Engineer",
      "image": "assets/team/member3.jpg",
    },
    {
      "name": "Michael Lee",
      "role": "Project Manager",
      "image": "assets/team/member4.jpg",
    },
    {
      "name": "Emma Wilson",
      "role": "Marketing Specialist",
      "image": "assets/team/member5.jpg",
    },
    {
      "name": "Daniel Smith",
      "role": "Mobile Developer",
      "image": "assets/team/member6.jpg",
    },
  ];

  void _changeIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveScope.of(context);
    final isMobile = responsive.isMobile;

    final horizontalPadding = isMobile ? 24.0 : 80.0;

    final int itemsPerPage = isMobile ? 1 : 3;

    final int totalPages = (_teamMembers.length / itemsPerPage).ceil();
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: 100,
      ),
      color: AppTheme.cardDark,
      child: Column(
        children: [
          const TeamHeader(),
          const SizedBox(height: 80),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: Row(
              key: ValueKey(_currentIndex),
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(itemsPerPage, (i) {
                final itemIndex = _currentIndex * itemsPerPage + i;

                if (itemIndex >= _teamMembers.length) {
                  return const SizedBox();
                }
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TeamMemberCard(
                      member: _teamMembers[itemIndex],
                    ),
                  ),
                );
              }),
            ),
          ),
          const SizedBox(height: 40),
          NavigationDots(
            currentIndex: _currentIndex,
            items: List.generate(totalPages, (index) => index),
            onChanged: _changeIndex,
          ),
        ],
      ),
    );
  }
}
