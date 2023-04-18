import 'package:flutter/material.dart';
import '../colors/colors.dart';

class NewTaskButtonWidget extends StatelessWidget {
  const NewTaskButtonWidget({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          side: BorderSide(
            width: 1,
            color: AppColors.purple5,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Row(
          children: [
            Icon(
              Icons.add,
              color: AppColors.purple5,
            ),
            const SizedBox(width: 5),
            const Text(
              'New',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
