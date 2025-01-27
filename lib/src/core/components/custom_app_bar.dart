import 'package:ai_lawyer/src/core/core.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool showTrailingButton;
  final bool showArrowBackButton;
  final TextStyle? textStyle;
  final Function()? onTapTrailing;
  final Color? backgroundColor;
  final Color? lidingButtomColor;

  const CustomAppBar({
    super.key,
    this.title,
    this.showTrailingButton = false,
    this.showArrowBackButton = false,
    this.textStyle,
    this.onTapTrailing,
    this.backgroundColor,
    this.lidingButtomColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? Color(0xff141718),
      surfaceTintColor: Color(0xff141718),
      leading: showArrowBackButton
          ? Padding(
              padding: EdgeInsets.all(0.sp),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: ArrowBackButtom(
                  buttomColor: lidingButtomColor,
                ),
              ),
            )
          : SizedBox(width: 11.5.w),
      centerTitle: true,
      title: Center(
        child: Text(
          title ?? '',
          style: textStyle ??
              TextStyle(
                fontSize: 17.sp,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
        ),
      ),
      actions: [
        showTrailingButton
            ? GestureDetector(
                onTap: onTapTrailing,
                child: Icon(
                  Icons.more_horiz,
                  size: 30.sp,
                  color: Colors.white,
                ),
              )
            : SizedBox(width: 11.5.w),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
