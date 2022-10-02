import 'package:flutter/material.dart';
import 'package:finsor/theme/colors.dart';

class SmallSquareContainer extends StatefulWidget {
  final String label;
  final VoidCallback onPressed;
  final bool extraSmall;
  final Icon? icon;
  final Color? color;
  Widget? child;
  SmallSquareContainer(
      {required this.label,
      required this.onPressed,
      required this.extraSmall,
      this.icon,
      this.color,
      this.child});

  @override
  State<SmallSquareContainer> createState() => _SmallSquareContainerState();
}

class _SmallSquareContainerState extends State<SmallSquareContainer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
          width: 150,
          height: widget.extraSmall ? 60 : 150,
          decoration: BoxDecoration(
              color: widget.color == null ? backgroundColor : widget.color,
              borderRadius: widget.extraSmall
                  ? BorderRadius.circular(30)
                  : BorderRadius.circular(40)),
          child: widget.child == null
              ? Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.label,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      widget.icon == null
                          ? Icon(Icons.add_circle)
                          : widget.icon!,
                    ],
                  ),
                )
              : widget.child),
    );
  }
}
