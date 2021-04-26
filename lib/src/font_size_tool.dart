import 'package:flutter/material.dart';

class FontSizeTool extends StatelessWidget {
  final double fontSize;
  final double letterSpacing;
  final double letterHeight;
  final Function(
    double fontSize,
    double letterSpacing,
    double letterHeight,
  ) onFontSizeEdited;

  FontSizeTool({
    required this.onFontSizeEdited,
    this.fontSize = 0,
    this.letterSpacing = 0,
    this.letterHeight = 0,
  });

  @override
  Widget build(BuildContext context) {
    double _fontSize = fontSize;
    double _letterSpacing = letterSpacing;
    double _letterHeight = letterHeight;

    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          _ResizeSlider(
            value: _fontSize,
            icon: Icons.format_size,
            onChange: (value) {
              _fontSize = value;
              onFontSizeEdited(_fontSize, _letterSpacing, _letterHeight);
            },
          ),
          _ResizeSlider(
            value: _letterHeight,
            icon: Icons.format_line_spacing,
            onChange: (value) {
              _letterHeight = value;
              onFontSizeEdited(_fontSize, _letterSpacing, _letterHeight);
            },
          ),
          _ResizeSlider(
            value: _letterSpacing,
            icon: Icons.settings_ethernet,
            onChange: (value) {
              _letterSpacing = value;
              onFontSizeEdited(_fontSize, _letterSpacing, _letterHeight);
            },
          ),
        ],
      ),
    );
  }
}

class _ResizeSlider extends StatefulWidget {
  final double value;
  final IconData icon;
  final Function(double) onChange;

  _ResizeSlider({
    required this.value,
    required this.icon,
    required this.onChange,
  });

  @override
  _ResizeSliderState createState() => _ResizeSliderState();
}

class _ResizeSliderState extends State<_ResizeSlider> {
  late double _value;

  @override
  void initState() {
    _value = widget.value;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(widget.icon),
        Expanded(
          child: Slider(
            value: _value,
            onChanged: (value) {
              setState(() => _value = value);

              widget.onChange(value);
            },
            min: 0,
            max: 100,
          ),
        ),
        Text(_value.toInt().toString()),
      ],
    );
  }
}
