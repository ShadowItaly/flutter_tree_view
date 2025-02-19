import 'package:flutter/material.dart';

import 'lines_painter.dart';
import 'tree_node.dart';
import 'tree_node_scope.dart';
import 'tree_view_theme.dart';

/// Widget responsible for indenting nodes and drawing lines (if enabled).
class LinesWidget extends StatelessWidget {
  /// Creates a [LinesWidget].
  const LinesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final treeNodeScope = TreeNodeScope.of(context);

    late final child = SizedBox(
      width: treeNodeScope.indentation,
      height: 2,
    );
    

    switch (treeNodeScope.theme.lineStyle) {
      case LineStyle.scoped:
        
        return Container(decoration: BoxDecoration(border: Border(left: BorderSide(color: Colors.black,width: 2))), child: CustomPaint(
          painter: LinesPainter(
            linesToBeDrawn: treeNodeScope.node.scopedLines,
            theme: treeNodeScope.theme,
          ),
          child: child,
        ));

      case LineStyle.connected:
        return CustomPaint(
          painter: LinesPainter(
            linesToBeDrawn: treeNodeScope.node.connectedLines,
            theme: treeNodeScope.theme,
          ),
          child: child,
        );

      case LineStyle.disabled:
      default:
        return child;
    }
  }
}
