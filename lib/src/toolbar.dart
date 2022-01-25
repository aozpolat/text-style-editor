import 'package:flutter/material.dart';

import 'option_button.dart';
import 'toolbar_action.dart';

class Toolbar extends StatefulWidget {
  final EditorToolbarAction initialTool;
  final Function(EditorToolbarAction) onToolSelect;

  Toolbar({
    this.initialTool = EditorToolbarAction.editor,
    required this.onToolSelect,
  });

  @override
  _ToolbarState createState() => _ToolbarState();
}

class _ToolbarState extends State<Toolbar> {
  late EditorToolbarAction _selectedAction;
  @override
  void initState() {
    _selectedAction = widget.initialTool;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        OptionButton(
          isActive: _selectedAction == EditorToolbarAction.fontFamilyTool,
          child: Icon(Icons.title),
          onPressed: () {
            setState(
                () => _selectedAction = EditorToolbarAction.fontFamilyTool);
            widget.onToolSelect(EditorToolbarAction.fontFamilyTool);
          },
        ),
        OptionButton(
          isActive: _selectedAction == EditorToolbarAction.fontOptionTool,
          child: Icon(Icons.strikethrough_s),
          onPressed: () {
            setState(
                () => _selectedAction = EditorToolbarAction.fontOptionTool);
            widget.onToolSelect(EditorToolbarAction.fontOptionTool);
          },
        ),
        OptionButton(
          isActive: _selectedAction == EditorToolbarAction.fontSizeTool,
          child: Icon(Icons.format_size),
          onPressed: () {
            setState(() => _selectedAction = EditorToolbarAction.fontSizeTool);
            widget.onToolSelect(EditorToolbarAction.fontSizeTool);
          },
        ),
      ],
    );
  }
}
