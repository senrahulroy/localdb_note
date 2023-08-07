import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../utils/res/app_assets.dart';
import '../utils/res/app_strings.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(AppAssets.emptyJson),
        Gap(10.h),
        Text(AppString.strEmptyStart,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 18,
            )),
      ],
    ));
  }
}
