import 'package:deliveristo_test/components/imports/imports.dart';

class CustomDropdownFormField extends StatefulWidget {
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
    required this.onChanged,
    this.onTap,
  }) : super(key: key);

  @override
  _CustomDropdownFormFieldState createState() => _CustomDropdownFormFieldState();
}

class _CustomDropdownFormFieldState extends State<CustomDropdownFormField> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.0),
      child: SizedBox(
        height: 53,
        child: InkWell(
          onTap: widget.onTap,
          child: DropdownButtonFormField<String>(
            iconSize: 0,
            value: selectedValue,
            onChanged: (newValue) {
              setState(() {
                selectedValue = newValue;
                widget.onChanged?.call(newValue);
              });
            },
            onSaved: (value) {
              widget.controller?.text = value!;
            },
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15,
              color: Theme.of(context).dividerColor,
            ),
            decoration: InputDecoration(
              contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              hintText: widget.hintText,
              hintStyle: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: Theme.of(context).canvasColor,
              ),
              fillColor: widget.fillColor ?? Theme.of(context).dividerColor,
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
                  color: widget.borderColor ?? Theme.of(context).primaryColor,
                  width: 0.5,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(
                  color: widget.borderColor ?? Theme.of(context).canvasColor,
                  width: 0.5,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(
                  color: widget.borderColor ?? Theme.of(context).canvasColor,
                  width: 0.5,
                ),
              ),
              suffixIcon: const Icon(
                Icons.keyboard_arrow_down_outlined,
                color: Colors.black,
                size: 24,
              ),
            ),
            items: widget.items.map((item) {
              return DropdownMenuItem(
                value: item,
                child: CustomText(
                  title: item,
                  fontSize: 14,
                  color: Colors.black,
                  weight: FontWeight.w400,
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}