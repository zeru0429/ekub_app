import 'package:flutter/material.dart';

class SingleRowWidgetInProfile extends StatefulWidget {
  const SingleRowWidgetInProfile({
    super.key,
    required this.iconColor,
    required this.iconBg,
    required this.title,
    required this.iconData,
    this.onTap,
  });
  final Color iconColor;
  final Color iconBg;
  final String title;
  final IconData iconData;
  final VoidCallback? onTap;

  @override
  State<SingleRowWidgetInProfile> createState() =>
      _SingleRowWidgetInProfileState();
}

class _SingleRowWidgetInProfileState extends State<SingleRowWidgetInProfile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: Colors.grey.shade200,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: widget.iconBg,
                  borderRadius: BorderRadius.circular(10)),
              child: Icon(
                widget.iconData,
                size: 30,
                color: widget.iconColor,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                widget.title,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
