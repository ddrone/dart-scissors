// Copyright 2015 Google Inc. All Rights Reserved.
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
library scissors.test.svg_optimization.transformer_test;

import 'package:barback/barback.dart'
    show BarbackMode, BarbackSettings, Transformer;
import 'package:code_transformers/tests.dart'
    show StringFormatter, applyTransformers;
import 'package:test/test.dart' show test;
import 'package:scissors/src/svg_optimization/transformer.dart';

makePhases(Map config) => [[
    new SvgOptimizationTransformer.asPlugin(
        new BarbackSettings(config, BarbackMode.RELEASE))
]];

void main() {
  phases(ImageInliningMode mode) =>
      makePhases({});

  var iconSvg = r'''
    <?xml version="1.0" encoding="utf-8"?>
    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
      <rect x="0" y="0" height="10" width="10" style="stroke:#00ff00; fill: #ff0000"/>
    </svg>
  ''';

  // TODO(ochafik): test png optimizations
}

_testPhases(String testName, List<List<Transformer>> phases,
    Map<String, String> inputs, Map<String, String> results,
    [List<String> messages,
    StringFormatter formatter = StringFormatter.noTrailingWhitespace]) {
  test(
      testName,
      () async => applyTransformers(phases,
          inputs: inputs,
          results: results,
          messages: messages,
          formatter: formatter));
}
