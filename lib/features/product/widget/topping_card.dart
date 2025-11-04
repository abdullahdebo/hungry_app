import 'package:flutter/material.dart';

class ToppingCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final VoidCallback onAdd;

  const ToppingCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 115,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(16),
            ),
            child: Image.asset(
              imageUrl,
              height: 80,
              width: double.infinity,
              fit: BoxFit.contain,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              color: Color(0xFF2E2A2A),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(16),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: onAdd,
                  child: CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.red,
                    child: Icon(
                      Icons.add,
                      size: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
