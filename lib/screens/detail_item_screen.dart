import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailItemScreen extends StatefulWidget {
  const DetailItemScreen({super.key});

  @override
  State<DetailItemScreen> createState() => _DetailItemScreenState();
}

class _DetailItemScreenState extends State<DetailItemScreen> {
  String _selectedSize = 'M'; // Default selected size
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Set status bar style to match Figma's dark icons
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false, // Manage bottom padding manually for the Home Indicator
        child: Column(
          children: [
            // Top Bar: Back, Title, Favorite
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.pop(); // Navigate back using go_router
                    },
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new, // Interpreted from "Arrow - Left 2"
                        color: Color(0xFF2A2A2A), // From Figma style "184:26"
                        size: 20,
                      ),
                    ),
                  ),
                  Text(
                    'Detail',
                    style: GoogleFonts.sora(
                      color: const Color(0xFF242424), // From Figma style "179:47"
                      fontSize: 16,
                      fontWeight: FontWeight.w600, // SemiBold
                      height: 1.2, // Line height 19.2px / 16px
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isFavorite = !_isFavorite; // Toggle favorite state
                      });
                    },
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        _isFavorite ? Icons.favorite : Icons.favorite_border, // Interpreted from "Heart"
                        color: const Color(0xFF2A2A2A), // From Figma style "184:26"
                        size: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product Image
                    SizedBox(
                      width: screenWidth - 48, // 327px for 375px screen = screenWidth - 2*24px padding
                      height: screenHeight * 0.25, // 202px for 812px screen, ~25%
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          'assets/images/I184_204_417_715.png', // Correct asset path
                          fit: BoxFit.cover, // Figma's "STRETCH" generally means cover or fill
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Product Details (Name, Type, Rating & Superiority Icons)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Caffe Mocha',
                                style: GoogleFonts.sora(
                                  color: const Color(0xFF242424),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600, // SemiBold
                                  height: 1.5, // Line height 30px / 20px
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Ice/Hot',
                                style: GoogleFonts.sora(
                                  color: const Color(0xFFA2A2A2), // From Figma style "179:20"
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400, // Regular
                                  height: 1.2, // Line height 14.4px / 12px
                                ),
                              ),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  const Icon(Icons.star, color: Color(0xFFFBBD2D), size: 20),
                                  const SizedBox(width: 4),
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: '4.8',
                                          style: GoogleFonts.sora(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600, // SemiBold
                                            color: const Color(0xFF2A2A2A), // From Figma style "184:26"
                                          ),
                                        ),
                                        TextSpan(
                                          text: ' (230)',
                                          style: GoogleFonts.sora(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400, // Regular
                                            color: const Color(0xFFA2A2A2), // From Figma style "179:20"
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            _buildSuperiorityIcon('assets/images/I184_198_418_950.png'),
                            const SizedBox(width: 12), // Item spacing 12px
                            _buildSuperiorityIcon('assets/images/I184_200_418_971.png'),
                            const SizedBox(width: 12), // Item spacing 12px
                            _buildSuperiorityIcon('assets/images/I184_202_418_967.png'),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16), // Item spacing 16px
                    Divider(color: const Color(0xFFE3E3E3), thickness: 1), // From Figma style "184:24" for stroke
                    const SizedBox(height: 16), // Item spacing 16px

                    // Description Section
                    Text(
                      'Description',
                      style: GoogleFonts.sora(
                        color: const Color(0xFF242424),
                        fontSize: 16,
                        fontWeight: FontWeight.w600, // SemiBold
                        height: 1.5, // Line height 24px / 16px
                      ),
                    ),
                    const SizedBox(height: 8), // Item spacing 8px
                    RichText(
                      text: TextSpan(
                        style: GoogleFonts.sora(
                          color: const Color(0xFFA2A2A2),
                          fontSize: 14,
                          fontWeight: FontWeight.w300, // Light (character style override 13)
                          height: 1.5, // Line height 21px / 14px
                        ),
                        children: [
                          const TextSpan(
                            text:
                                'A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the fo..',
                          ),
                          TextSpan(
                            text: ' Read More',
                            style: GoogleFonts.sora(
                              color: const Color(0xFFC67C4E), // From Figma style "179:19" (character style override 15)
                              fontSize: 14,
                              fontWeight: FontWeight.w600, // SemiBold
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Size Selection Section
                    Text(
                      'Size',
                      style: GoogleFonts.sora(
                        color: const Color(0xFF242424),
                        fontSize: 16,
                        fontWeight: FontWeight.w600, // SemiBold
                        height: 1.5, // Line height 24px / 16px
                      ),
                    ),
                    const SizedBox(height: 16), // Item spacing 16px
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildSizeOption('S'),
                        _buildSizeOption('M'),
                        _buildSizeOption('L'),
                      ],
                    ),
                    const SizedBox(height: 20), // Padding before the fixed bottom bar starts
                  ],
                ),
              ),
            ),

            // Bottom Floating Button Bar (Price and Buy Now)
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                left: 24,
                right: 24,
                top: 16,
                bottom: MediaQuery.of(context).padding.bottom + 16, // Adjust for Home Indicator
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    spreadRadius: 0,
                    blurRadius: 10,
                    offset: const Offset(0, -4), // Shadow on top edge
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min, // Keep column compact
                    children: [
                      Text(
                        'Price',
                        style: GoogleFonts.sora(
                          color: const Color(0xFF909090), // From Figma style "184:23"
                          fontSize: 14,
                          fontWeight: FontWeight.w400, // Regular
                          height: 1.2, // Line height 16.8px / 14px
                        ),
                      ),
                      const SizedBox(height: 4), // Item spacing 4px
                      Text(
                        '\$ 4.53',
                        style: GoogleFonts.sora(
                          color: const Color(0xFFC67C4E), // From Figma style "179:19"
                          fontSize: 18,
                          fontWeight: FontWeight.w600, // SemiBold
                          height: 1.5, // Line height 27px / 18px
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: screenWidth * 0.58, // 217px for 375px screen = 217/375 ~ 0.5786
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        // Infer navigation to a checkout screen
                        context.go('/checkout'); // Navigate using go_router
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFC67C4E), // From Figma style "179:19"
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: EdgeInsets.zero, // Remove default padding for precise control
                        elevation: 0, // No shadow
                      ),
                      child: Text(
                        'Buy Now',
                        style: GoogleFonts.sora(
                          color: Colors.white, // From Figma style "179:4"
                          fontSize: 16,
                          fontWeight: FontWeight.w600, // SemiBold
                          height: 1.5, // Line height 24px / 16px
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget for superiority icons
  Widget _buildSuperiorityIcon(String imagePath) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: const Color(0xFFEDEEF0).withOpacity(0.35), // From Figma background fill 184:197
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(10), // Matches Figma inner padding 10px
      child: Center(
        child: Image.asset(
          imagePath,
          width: 24, // 44px (container) - 2 * 10px (padding) = 24px
          height: 24,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  // Helper widget for size options
  Widget _buildSizeOption(String size) {
    bool isSelected = _selectedSize == size;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedSize = size;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.256, // 96px for 375px screen = 96/375 ~ 0.256
        height: 41,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFF7F3EE) : Colors.white, // Selected from 184:25, unselected from 179:4
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? const Color(0xFFC67C4E) : const Color(0xFFE3E3E3), // Selected from 179:19, unselected from 184:24
            width: 1,
          ),
        ),
        child: Center(
          child: Text(
            size,
            style: GoogleFonts.sora(
              color: isSelected ? const Color(0xFFC67C4E) : const Color(0xFF242424), // Selected from 179:19, unselected from 179:47
              fontSize: 14,
              fontWeight: FontWeight.w400, // Regular
              height: 1.5, // Line height 21px / 14px
            ),
          ),
        ),
      ),
    );
  }
}