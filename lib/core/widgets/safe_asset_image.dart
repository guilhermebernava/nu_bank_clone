import 'package:flutter/material.dart';
import 'package:nu_bank_clone/themes/colors/app_colors.dart';

class SafeAssetImage extends StatelessWidget {
  final Size size;
  final String imagePath;

  const SafeAssetImage({
    Key? key,
    required this.size,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      width: size.width,
      height: size.height,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) => SizedBox(
        height: size.height,
        width: size.width,
        child: const Icon(
          Icons.image_not_supported_rounded,
          color: AppColors.grey,
          size: 75,
        ),
      ),
    );
  }
}
