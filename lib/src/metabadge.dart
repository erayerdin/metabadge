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

import 'package:flutter/widgets.dart';

class Metabadge extends StatelessWidget {
  final Widget? header;
  final Widget body;

  const Metabadge({
    Key? key,
    this.header,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (header != null)
          Container(
            padding: const EdgeInsets.all(5),
            color: const Color.fromRGBO(66, 66, 66, 1),
            child: header,
          ),
        Container(
          padding: const EdgeInsets.all(5),
          color: const Color.fromRGBO(76, 175, 80, 1),
          child: body,
        ),
      ],
    );
  }
}
