// Copyright 2022 Eray Erdin
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';

class Metabadge extends StatelessWidget {
  final Widget? header;
  final Widget body;
  final MetabadgeDecoration decoration;

  const Metabadge({
    Key? key,
    this.header,
    this.decoration = const MetabadgeDecoration(
      bodyColor: Colors.green,
      headerColor: Colors.black54,
    ),
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (header != null)
          Container(
            padding: const EdgeInsets.all(5),
            color: decoration.headerColor,
            child: header,
          ),
        Container(
          padding: const EdgeInsets.all(5),
          color: decoration.bodyColor,
          child: body,
        ),
      ],
    );
  }
}

class MetabadgeDecoration {
  final Color? bodyColor;
  final Color? headerColor;

  const MetabadgeDecoration({
    this.bodyColor = Colors.green,
    this.headerColor = Colors.black54,
  });
}
