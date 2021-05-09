import 'package:flutter/material.dart';

BoxDecoration activityItemDecoration(String image) => BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(
          Colors.black.withOpacity(0.2),
          BlendMode.dstATop,
        ),
        image: NetworkImage(image),
      ),
    );
