import 'dart:async';
import 'package:flutter/material.dart';

enum AsyncState { initial, loading, error, data }

class CustomStreamBuilder<T> extends StatefulWidget {
  final Stream<T> Function() streamProvider;
  final Widget Function(BuildContext, T) dataBuilder;
  final Widget Function(BuildContext) loadingBuilder;
  final Widget Function(BuildContext, Object?) errorBuilder;

  CustomStreamBuilder({
    required this.streamProvider,
    required this.dataBuilder,
    required this.loadingBuilder,
    required this.errorBuilder,
  });

  @override
  _CustomStreamBuilderState<T> createState() => _CustomStreamBuilderState<T>();
}

class _CustomStreamBuilderState<T> extends State<CustomStreamBuilder<T>> {
  late T _data;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
      stream: widget.streamProvider(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return widget.loadingBuilder(context);
        } else if (snapshot.hasError) {
          return widget.errorBuilder(context, snapshot.error);
        } else if (snapshot.hasData) {
          _data = snapshot.data!;
          return widget.dataBuilder(context, _data);
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
