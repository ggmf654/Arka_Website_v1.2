import 'visual_map.dart';
import 'package:flutter/material.dart';
import '../../../../constants/responsive_scope.dart';
import 'about_section_content.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final data = ResponsiveScope.of(context);
    final horizontalPadding = data.width *
        (data.isMobile ? 0.06 : data.isTablet ? 0.08 : 0.12);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding, vertical: 80),
      child: data.isMobile || data.isTablet
          ? Column(
        crossAxisAlignment:
        data.isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [
          AboutSectionContent(data:data, isCentered: data.isMobile),
          const SizedBox(height: 48),
          VisualMap(data: data,),
        ],
      )
          : Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: AboutSectionContent(data:data, isCentered: false)),
          const SizedBox(width: 64),
          Expanded(child: VisualMap(data: data,),),
        ],
      ),
    );
  }



}
