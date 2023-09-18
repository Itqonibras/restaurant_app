import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpandableDescription extends StatefulWidget {
  final String text;

  const ExpandableDescription({super.key, required this.text});

  @override
  State<ExpandableDescription> createState() => _ExpandableDescriptionState();
}

class _ExpandableDescriptionState extends State<ExpandableDescription> {
  late String firstHalf;
  bool condition = true;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > 150) {
      firstHalf = "${widget.text.substring(0, 150)}...";
    } else {
      firstHalf = widget.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.text.length < 150) {
      return Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            color: const Color(0xFFFFFFFF),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                child: Text(
                  widget.text,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ),
          ),
        ),
      );
    } else {
      return Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            color: const Color(0xFFFFFFFF),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                child: Column(
                  children: [
                    Text(
                      condition ? firstHalf : widget.text,
                      textAlign: TextAlign.justify,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          condition = !condition;
                        });
                      },
                      child: Text(
                        condition ? "Show more" : "Show less",
                        style: GoogleFonts.openSans(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.4,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
  }
}
