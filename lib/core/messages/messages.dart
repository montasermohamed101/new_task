import 'package:cleancode/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

import '../stateless/custom_button.dart';
import '../stateless/gaps.dart';
import '../stateless/label.dart';
import '../theme/text_theme.dart';

void showErrorMessage(BuildContext context, String message) {
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      content: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Label(text: message, style: AppTextTheme.displayLarge),
          ),
          const SizedBox(width: 10),
          const Icon(
            Icons.error,
            color: Colors.red,
          ),
        ],
      ),
      backgroundColor: Colors.white,
      behavior: SnackBarBehavior.floating,
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 20,
      ),
      margin: const EdgeInsets.only(
        bottom: 25,
        right: 20,
        left: 20,
      ),
    ),
  );
}

showSuccessMessage(
  BuildContext context,
  String message, {
  Color color = Colors.green,
  IconData icon = Icons.check_circle,
}) {
  WidgetsBinding.instance.addPostFrameCallback(
    (_) => ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        content: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Label(
                text: message,
                style: AppTextTheme.displayLarge,
              ),
            ),
            const SizedBox(width: 10),
            Icon(
              icon,
              color: color,
            ),
          ],
        ),
        backgroundColor: Colors.white,
        behavior: SnackBarBehavior.floating,
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 20,
        ),
        margin: const EdgeInsets.only(
          bottom: 25,
          right: 20,
          left: 20,
        ),
      ),
    ),
  );
}

void showSuccessDialog(BuildContext context, String text) => showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        content: Text(
          text,
          style: AppTextTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
        contentPadding: const EdgeInsets.only(
          right: 20,
          left: 20,
          top: 20,
          bottom: 40,
        ),
      ),
    );

void showLoadingDialog(BuildContext context,
        {String? message,
        bool canPop = false,
        bool barrierDismissible = false}) =>
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (_) => PopScope(
        canPop: canPop,
        child: AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator.adaptive(),
              AppGaps.gap28Vertical,
              Text(
                message ?? 'تحميل البيانات...',
                style: AppTextTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          contentPadding: const EdgeInsets.only(
            right: 20,
            left: 20,
            top: 20,
            bottom: 40,
          ),
        ),
      ),
    );

void showConfirmDialog(
  BuildContext context,
  String text,
  VoidCallback? onConfirm, {
  String? confirmText,
  String? cancelText,
  VoidCallback? onCancel,
  TextStyle? cancelTextStyle,
  TextStyle? confirmTextStyle,
}) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      content: Text(
        text,
        style: AppTextTheme.titleLarge,
        textAlign: TextAlign.center,
      ),
      contentPadding: const EdgeInsets.only(
        right: 20,
        left: 20,
        top: 20,
        bottom: 40,
      ),
      actions: [
        Row(
          children: [
            Expanded(
              child: CustomButton(
                text: cancelText ?? 'تراجع',
                style: context.theme.elevatedButtonTheme.style!.copyWith(
                  backgroundColor: MaterialStateProperty.all(
                      context.theme.colorScheme.error),
                ),
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop();
                  onCancel?.call();
                },
              ),
            ),
            AppGaps.gap8Horizontal,
            Expanded(
              child: CustomButton(
                text: confirmText ?? 'مسح',
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop();
                  onConfirm?.call();
                },
              ),
            ),
          ],
        )
      ],
    ),
  );
}
