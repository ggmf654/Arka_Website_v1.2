// ignore_for_file: prefer_const_declarations, prefer_const_constructors, deprecated_member_use, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 900;

    return Scaffold(
      backgroundColor: AppTheme.backgroundDark,
      appBar: AppBar(
        backgroundColor: AppTheme.cardDark,
        elevation: 0,
        title: const Text(
          'ARKA Dashboard',
          style: TextStyle(
            color: AppTheme.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: const [
          CircleAvatar(
            backgroundColor: AppTheme.primaryGreen,
            child: Text(
              'A',
              style: TextStyle(
                color: AppTheme.backgroundDark,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(width: 16),
        ],
      ),
      body: Row(
        children: [
          if (!isMobile) const _DashboardSidebar(),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Overview',
                    style: TextStyle(
                      color: AppTheme.textPrimary,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'High-level metrics about your projects and activity.',
                    style: TextStyle(
                      color: AppTheme.textSecondary,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 24),
                  _buildStatsGrid(isMobile),
                  const SizedBox(height: 24),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(child: _ActivityCard()),
                        const SizedBox(width: 24),
                        if (!isMobile)
                          const Expanded(
                            child: _ProjectsCard(),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsGrid(bool isMobile) {
    final stats = const [
      _StatTile(
        label: 'Active Projects',
        value: '6',
        trend: '+2 this month',
      ),
      _StatTile(
        label: 'Delivered',
        value: '24',
        trend: '+5 this quarter',
      ),
      _StatTile(
        label: 'Avg. Satisfaction',
        value: '98%',
        trend: 'Very positive',
      ),
      _StatTile(
        label: 'Open Tickets',
        value: '3',
        trend: '2 high priority',
      ),
    ];

    if (isMobile) {
      return Column(
        children: stats
            .map((s) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: s,
                ))
            .toList(),
      );
    }

    return GridView.count(
      crossAxisCount: 4,
      shrinkWrap: true,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 4 / 2,
      physics: const NeverScrollableScrollPhysics(),
      children: stats,
    );
  }
}

class _DashboardSidebar extends StatelessWidget {
  const _DashboardSidebar();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      height: double.infinity,
      decoration: BoxDecoration(
        color: AppTheme.cardDark,
        border: Border(
          right: BorderSide(color: AppTheme.borderColor),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Menu',
            style: TextStyle(
              color: AppTheme.textMuted,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 16),
          _SidebarItem(icon: Icons.dashboard, label: 'Overview', active: true),
          _SidebarItem(icon: Icons.device_hub, label: 'Pipelines'),
          _SidebarItem(icon: Icons.people_alt_outlined, label: 'Clients'),
          _SidebarItem(icon: Icons.settings_outlined, label: 'Settings'),
        ],
      ),
    );
  }
}

class _SidebarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool active;

  const _SidebarItem({
    required this.icon,
    required this.label,
    this.active = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      child: ListTile(
        dense: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        tileColor: active ? AppTheme.primaryGreen.withOpacity(0.12) : null,
        leading: Icon(
          icon,
          size: 20,
          color: active ? AppTheme.primaryGreen : AppTheme.textSecondary,
        ),
        title: Text(
          label,
          style: TextStyle(
            color: active ? AppTheme.primaryGreen : AppTheme.textSecondary,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
        onTap: () {},
      ),
    );
  }
}

class _StatTile extends StatelessWidget {
  final String label;
  final String value;
  final String trend;

  const _StatTile({
    required this.label,
    required this.value,
    required this.trend,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppTheme.cardDark,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppTheme.borderColor),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(
                color: AppTheme.textSecondary,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                color: AppTheme.textPrimary,
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              trend,
              style: const TextStyle(
                color: AppTheme.primaryGreen,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ActivityCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.cardDark,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Recent Activity',
            style: TextStyle(
              color: AppTheme.textPrimary,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView(
              children: const [
                _ActivityItem(
                  title: 'New project created',
                  subtitle: 'HealthTrack Pro – mobile & web app',
                  time: '2 hours ago',
                ),
                _ActivityItem(
                  title: 'Milestone completed',
                  subtitle: 'EduLearn Platform – UX design phase',
                  time: 'Yesterday',
                ),
                _ActivityItem(
                  title: 'Client feedback received',
                  subtitle: 'RetailFlow ERP – performance improvements',
                  time: '2 days ago',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ProjectsCard extends StatelessWidget {
  const _ProjectsCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.cardDark,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Projects Pipeline',
            style: TextStyle(
              color: AppTheme.textPrimary,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                _PipelineRow(label: 'Discovery', value: 2),
                SizedBox(height: 12),
                _PipelineRow(label: 'In Progress', value: 3),
                SizedBox(height: 12),
                _PipelineRow(label: 'Review', value: 1),
                SizedBox(height: 12),
                _PipelineRow(label: 'Launched', value: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ActivityItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String time;

  const _ActivityItem({
    required this.title,
    required this.subtitle,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 8,
            height: 8,
            margin: const EdgeInsets.only(top: 6, right: 8),
            decoration: const BoxDecoration(
              color: AppTheme.primaryGreen,
              shape: BoxShape.circle,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppTheme.textPrimary,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: AppTheme.textSecondary,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  time,
                  style: const TextStyle(
                    color: AppTheme.textMuted,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PipelineRow extends StatelessWidget {
  final String label;
  final int value;

  const _PipelineRow({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(
                color: AppTheme.textSecondary,
                fontSize: 13,
              ),
            ),
            Text(
              '$value',
              style: const TextStyle(
                color: AppTheme.textPrimary,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        LinearProgressIndicator(
          value: (value / 10).clamp(0.0, 1.0),
          backgroundColor: AppTheme.cardDark,
          color: AppTheme.primaryGreen,
          minHeight: 6,
        ),
      ],
    );
  }
}


