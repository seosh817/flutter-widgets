import 'package:flutter/material.dart';
import 'package:flutter_widgets/colors.dart';
import 'package:flutter_widgets/text_style.dart';

class CustomCardLegacy extends StatefulWidget {
  const CustomCardLegacy({required this.title, this.scoreText = '', this.scoreColor, this.onInfoClick, this.rightWidget, this.child});

  final String title;
  final String scoreText;
  final Color? scoreColor;
  final VoidCallback? onInfoClick;
  final Widget? rightWidget;
  final Widget? child;

  @override
  _CustomCardLegacyState createState() => _CustomCardLegacyState();
}

class _CustomCardLegacyState extends State<CustomCardLegacy> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.15),
              offset: const Offset(0, 0),
              blurRadius: 8,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 16.0,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: kNotoSansBold14.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(width: 2.0,),
                  Visibility(
                    visible: widget.onInfoClick != null,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      icon: Image.asset("images/ic_info_s.png"),
                      onPressed: widget.onInfoClick,
                    ),
                  ),
                  const Spacer(),
                  widget.rightWidget != null ? widget.rightWidget! : Container(),
                ],
              ),
              const SizedBox(
                height: 16.0,
              ),
              widget.child != null ? widget.child! : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
