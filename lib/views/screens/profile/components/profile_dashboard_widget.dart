import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lexam/constants/constant.dart';
import 'package:lexam/controllers/get_controllers.dart';
import 'package:lexam/controllers/profile_screen_controller.dart';
import 'package:lexam/views/screens/resource/components/note_widget.dart';

import 'chart_widget.dart';
import 'scoreboard_widget.dart';
import 'upcoming_exam_widget.dart';

class ProfileDashboardWidget extends StatelessWidget {
  ProfileDashboardWidget({Key? key}) : super(key: key);

  final ProfileScreenController controller =
      GetControllers.instance.getProfileScreenController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        SizedBox(height: 16.h),
        ScoreboardWidget(),
        SizedBox(height: 24.h),
        UpComingExamWidget(),
        SizedBox(height: 24.h),
        NoteWidget()
        // ChartWidget(),
      ],
    );
  }
}
