import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geulnarae/src/controllers/dictionary_controller.dart';

class CategoryButton extends StatefulWidget {
  final VoidCallback? onTap;
  final String? searchString;

  const CategoryButton({
    this.onTap,
    this.searchString,
    super.key
  });

  @override
  State<CategoryButton> createState() => _CategoryButtonState();
}

class _CategoryButtonState extends State<CategoryButton> {
  final DictionaryController dictionaryController = Get.put(DictionaryController());

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        dictionaryController.searchTextController.text = widget.searchString!;
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Text(
              "${widget.searchString}",
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
            const SizedBox(width: 8),

            // onTap 정의를 위해(GestureDetector)
            GestureDetector(
              onTap: widget.onTap,
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
