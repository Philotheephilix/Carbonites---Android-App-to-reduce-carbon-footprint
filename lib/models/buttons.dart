import 'package:flutter/material.dart';

class IconAndTextButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Widget page;
  final List<Color> buttonGradient;

  const IconAndTextButton({
    required this.icon,
    required this.text,
    required this.page,
    required this.buttonGradient,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: buttonGradient,
          ),
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 5,
              offset: const Offset(3, 3),
            ),
          ]),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white70,
          shadowColor: Colors.transparent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: Colors.black,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: const TextStyle(
                color: Colors.black,
                fontFamily: 'Capriola',
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomPopupButton extends StatelessWidget {
  const CustomPopupButton({
    super.key,
    required this.dimensions,
    required this.content,
    required this.label,
    required this.labelSize,
    required this.gradient,
  });

  final List<double> dimensions;
  final Widget content;
  final String label;
  final double labelSize;
  final List<Color> gradient;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: dimensions[0],
      height: dimensions[1],
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradient,
        ),
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 5,
            offset: const Offset(3, 3),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () {
          _showPopupBox(context);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          shadowColor: Colors.transparent,
        ),
        child: Text(
          label,
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Capriola',
            fontSize: labelSize,
          ),
        ),
      ),
    );
  }

  void _showPopupBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          title: Text(
            label,
            style: const TextStyle(
              fontFamily: 'Capriola',
              fontSize: 20,
            ),
          ),
          content: content,
        );
      },
    );
  }
}

class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
    required this.dimensions,
    required this.label,
    required this.labelSize,
    required this.gradient,
  });

  final List<double> dimensions;
  final String label;
  final double labelSize;
  final List<Color> gradient;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool buttonState = false;

  bool getButtonState() {
    return buttonState;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.dimensions[0],
      height: widget.dimensions[1],
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: widget.gradient,
        ),
        borderRadius: BorderRadius.circular(widget.dimensions[1] * 0.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 5,
            offset: const Offset(3, 3),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            buttonState = !buttonState;
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          shadowColor: Colors.transparent,
        ),
        child: Text(
          widget.label,
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Capriola',
            fontSize: widget.labelSize,
          ),
        ),
      ),
    );
  }
}
