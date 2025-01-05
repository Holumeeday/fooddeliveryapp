import 'package:asap/utils/constant.dart';
import 'package:flutter/material.dart';

class FoodOptions extends StatefulWidget {
  final double miniPrice;
  final double fullPrice;
  final Function(String selectedOption, int quantity) onOptionSelected;

  const FoodOptions({
    super.key,
    required this.miniPrice,
    required this.fullPrice,
    required this.onOptionSelected,
  });

  @override
  _FoodOptionsState createState() => _FoodOptionsState();
}

class _FoodOptionsState extends State<FoodOptions> {
  String selectedOption = 'Mini';
  int quantity = 1;

  void _updateParent() {
    widget.onOptionSelected(selectedOption, quantity);
  }

  @override
  Widget build(BuildContext context) {
    // double price =
    //     selectedOption == 'Mini' ? widget.miniPrice : widget.fullPrice;
        double price =
        selectedOption == 'Mini' ? widget.miniPrice : widget.miniPrice + 800;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Selection Button (Mini/Full)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: primaryColor.withOpacity(0.1),
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedOption = 'Mini';
                      });
                      _updateParent();
                    },
                    child: Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: selectedOption == 'Mini'
                            ? primaryColor
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        'Mini',
                        style: TextStyle(
                          color: selectedOption == 'Mini'
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedOption = 'Full';
                      });
                      _updateParent();
                    },
                    child: Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: selectedOption == 'Full'
                            ? primaryColor
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        'Full',
                        style: TextStyle(
                          color: selectedOption == 'Full'
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        
           const SizedBox(width:10),
        
            // Quantity Counter
            Row(
              children: [
                // Decrease Button
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (quantity > 0) quantity--;
                    });
                    _updateParent();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.remove,
                      size: 16,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
        
                // Quantity Display
                Text(
                  '$quantity',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 8),
        
                // Increase Button
                GestureDetector(
                  onTap: () {
                    setState(() {
                      quantity++;
                    });
                    _updateParent();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.add,
                      size: 16,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 10),
            
          ],
        ),

       const SizedBox(height: 10),

        Text(
          'Price: #${price * quantity}',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
