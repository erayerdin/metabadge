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

const _defaultRadius = 0.0;
const _defaultPadding = 5.0;
const _defaultBodyColor = Colors.green;
const _defaultHeaderColor = Colors.black54;

/// A widget to create a [Shields](https://shields.io/)-like badge.
///
/// # Constructor
///
/// | Name | Type | Required | Default | Description |
/// |--:|:-:|:-:|:-:|:-:|
/// | **body**| `Widget` | ✅ | - | - |
/// | **header** | `Widget` | ❌ | `null` | - |
/// | **decoration** | `MetabadgeDecoration` | ❌ | refer to `MetabadgeDecoration` documentation | Customize how the badge looks. |
class Metabadge extends StatelessWidget {
  final Widget? header;
  final Widget body;
  final MetabadgeDecoration decoration;

  const Metabadge({
    Key? key,
    this.header,
    this.decoration = const MetabadgeDecoration(
      bodyColor: _defaultBodyColor,
      headerColor: _defaultHeaderColor,
      radius: _defaultRadius,
      padding: _defaultPadding,
    ),
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (header != null)
          Container(
            padding: EdgeInsets.all(decoration.padding ?? _defaultPadding),
            decoration: BoxDecoration(
              color: decoration.headerColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(decoration.radius ?? _defaultRadius),
                bottomLeft:
                    Radius.circular(decoration.radius ?? _defaultRadius),
              ),
            ),
            child: header,
          ),
        Container(
          padding: EdgeInsets.all(decoration.padding ?? _defaultPadding),
          decoration: BoxDecoration(
            color: decoration.bodyColor,
            borderRadius: header == null
                ? BorderRadius.all(
                    Radius.circular(decoration.radius ?? _defaultRadius),
                  )
                : BorderRadius.only(
                    topRight:
                        Radius.circular(decoration.radius ?? _defaultRadius),
                    bottomRight:
                        Radius.circular(decoration.radius ?? _defaultRadius),
                  ),
          ),
          child: body,
        ),
      ],
    );
  }
}

/// The decoration to customize `Metabadge`.
///
/// # Constructor
///
/// | Name | Type | Required | Default | Description |
/// |--:|:-:|:-:|:-:|:-:|
/// | **bodyColor** | `Color` | ❌ | `Colors.green` | The background color of body. |
/// | **headerColor** | `Color` | ❌ | `Colors.black54` | The background color of header. |
/// | **radius** | `double` | ❌ | `0.0` | How round the badge looks. |
/// | **padding** | `double` | ❌ | `5.0` | The spacing around the header and body. |
class MetabadgeDecoration {
  final Color? bodyColor;
  final Color? headerColor;
  final double? radius;
  final double? padding;

  const MetabadgeDecoration({
    this.bodyColor = _defaultBodyColor,
    this.headerColor = _defaultHeaderColor,
    this.radius = _defaultRadius,
    this.padding = _defaultPadding,
  });
}
