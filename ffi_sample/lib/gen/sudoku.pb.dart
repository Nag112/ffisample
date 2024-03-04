//
//  Generated code. Do not modify.
//  source: sudoku.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class SudokuPuzzle extends $pb.GeneratedMessage {
  factory SudokuPuzzle({
    $core.int? id,
    $core.String? puzzle,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (puzzle != null) {
      $result.puzzle = puzzle;
    }
    return $result;
  }
  SudokuPuzzle._() : super();
  factory SudokuPuzzle.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SudokuPuzzle.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SudokuPuzzle', package: const $pb.PackageName(_omitMessageNames ? '' : 'sudoku'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'puzzle')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SudokuPuzzle clone() => SudokuPuzzle()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SudokuPuzzle copyWith(void Function(SudokuPuzzle) updates) => super.copyWith((message) => updates(message as SudokuPuzzle)) as SudokuPuzzle;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SudokuPuzzle create() => SudokuPuzzle._();
  SudokuPuzzle createEmptyInstance() => create();
  static $pb.PbList<SudokuPuzzle> createRepeated() => $pb.PbList<SudokuPuzzle>();
  @$core.pragma('dart2js:noInline')
  static SudokuPuzzle getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SudokuPuzzle>(create);
  static SudokuPuzzle? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get puzzle => $_getSZ(1);
  @$pb.TagNumber(2)
  set puzzle($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPuzzle() => $_has(1);
  @$pb.TagNumber(2)
  void clearPuzzle() => clearField(2);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
