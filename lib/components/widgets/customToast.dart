

import 'package:deliveristo_test/components/imports/imports.dart';

class CustomToast extends StatelessWidget {
  final String message;

  const CustomToast({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.topCenter,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16.0),
        width: double.maxFinite,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: CustomText(title: message,
            align: TextAlign.center,
            decoration: TextDecoration.none,
            color: Colors.white,
            fontSize: 16.0,
          )
        ),
      ),
    );
  }
}


class ToastService {
  static void showToast(BuildContext context, String message) {
    final overlay = Overlay.of(context);
    OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (BuildContext context) {
        return Positioned(
          top: MediaQuery.of(context).size.height * 0.055,
          width: MediaQuery.of(context).size.width,
          child: CustomToast(message: message),
        );
      },
    );

    overlay.insert(overlayEntry);

    Future.delayed(const Duration(seconds: 2), () {
      overlayEntry.remove();
    });
  }
}