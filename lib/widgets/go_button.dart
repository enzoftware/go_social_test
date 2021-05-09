import 'package:flutter/material.dart';

class GoButton extends StatelessWidget {
  const GoButton({
    Key key,
    @required this.onTap,
    @required this.isLoading,
    this.buttonText = '',
  }) : super(key: key);

  final VoidCallback onTap;
  final bool isLoading;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onTap,
      child: Container(
        width: double.infinity,
        height: 50,
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(backgroundColor: Colors.white),
              )
            : Center(
                child: Text(
                  buttonText,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
