

import 'package:deliveristo_test/components/imports/imports.dart';

class CustomDropdownFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final Color? fillColor;
  final Color? borderColor;
  final List<String> items;
  final EdgeInsetsGeometry? cPadding;
  final Function(String?)? onChanged;
  final Function()? onTap;

  const CustomDropdownFormField({
    Key? key,
    this.controller,
    required this.hintText,
    this.cPadding,
    this.fillColor,
    this.borderColor,
    required this.items,
    required this.onChanged, this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 7.0),
        child: SizedBox(
          height: 53,
          child: InkWell(
            onTap:onTap ,
            child: DropdownButtonFormField(
              iconSize: 0,
              onChanged: onChanged,
              onSaved: (value) {
                controller?.text = value!;
              },
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: Theme.of(context).dividerColor,
              ),
              decoration: InputDecoration(
                contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                hintText: hintText,
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Theme.of(context).canvasColor,
                ),
                fillColor: fillColor ?? Theme.of(context).dividerColor,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 0.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(
                    color: borderColor ?? Theme.of(context).primaryColor,
                    width: 0.5,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(
                    color: borderColor ?? Theme.of(context).canvasColor,
                    width: 0.5,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(
                    color: borderColor ?? Theme.of(context).canvasColor,
                    width: 0.5,
                  ),
                ),
                suffixIcon: const Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: Colors.black,
                  size: 24,
                ),
              ),
              items: items.map((items) {
                return DropdownMenuItem(
                  value: items,
                  child: CustomText(
                      title: items,
                      fontSize: 14,
                      color: Colors.black,
                      weight: FontWeight.w400),
                );
              }).toList(),
            ),
          ),
        ));
  }
}