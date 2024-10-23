import 'package:flutter/material.dart';

/// A widget representing a draggable and sortable dock.
class DraggableDock extends StatefulWidget {
  final List<Image> icons;

  /// Creates a [DraggableDock] with a list of icons.
  const DraggableDock({Key? key, required this.icons}) : super(key: key);

  @override
  _DraggableDockState createState() => _DraggableDockState();
}

class _DraggableDockState extends State<DraggableDock> {
  late List<Image> _icons;
  int _draggingIndex = -1;

  @override
  void initState() {
    super.initState();
    _icons = List.from(widget.icons);
  }

  /// Handles when a draggable is accepted and reorders the icons.
  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      final icon = _icons.removeAt(oldIndex);
      _icons.insert(newIndex, icon);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(_icons.length, (index) {
            return _buildDraggableIcon(index);
          }),
        ),
      ),
    );
  }

  /// Builds a draggable icon and the logic for slot animation.
  Widget _buildDraggableIcon(int index) {
    return DragTarget<int>(
      onAccept: (oldIndex) {
        _onReorder(oldIndex, index);
      },
      builder: (context, candidateData, rejectedData) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
          //Increasing/Decreasing of the dock space margin when in drag state
          margin: EdgeInsets.symmetric(horizontal: _draggingIndex == index ? 10 : 4),
          child: Draggable<int>(
            data: index,
            onDragStarted: () => setState(() => _draggingIndex = index),
            onDragEnd: (_) => setState(() => _draggingIndex = -1),
            feedback: _buildIcon(_icons[index], isDragging: true),
            childWhenDragging: const SizedBox.shrink(),
            child: _buildIcon(_icons[index]),
          ),
        );
      },
    );
  }

  /// Builds an individual icon with optional dragging feedback.
  /// isDragging ? 35 : 30
  Widget _buildIcon(Image icon, {bool isDragging = false}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: isDragging ? 70 : 50,
      height: isDragging ? 70 : 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white38,
        boxShadow: isDragging
            ? [BoxShadow(color: Colors.black26, blurRadius: 10, spreadRadius: 5)]
            : [],
      ),
      child: Container(child: icon,height: isDragging ? 35 : 30,),
    );
  }
}
