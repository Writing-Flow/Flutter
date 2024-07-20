import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String? searchString;

  const CategoryButton({
    this.onTap,
    this.searchString,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Text(
              "$searchString",
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
            const SizedBox(width: 8),

            // onTap 정의를 위해(GestureDetector)
            GestureDetector(
              onTap: () {

              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Icon(
                  Icons.close, // IconData를 고정
                  size: 16,
                  color: Colors.grey[600],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
