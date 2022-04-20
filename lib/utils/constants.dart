// ignore_for_file: constant_identifier_names

// カリキュラム一覧
const CurriculumColumnNames = ['カリキュラム名', 'ミッション数', '取組中', '対象スキル'];
const CurriculumColumnWidths = [3.5, 1.5, 1, 4];

// ミッション一覧
const MissionColumnNames = ['カリキュラム名', 'ミッション数', '設定数', '対象スキル'];
const MissionColumnWidths = [3, 1.5, 1.5, 3.5];

const MemberColumnNames = ['名前', '取組中', '最終更新'];
const MemberColumnWidths = [4, 4, 4];

class Constant {
  static const String accessToken = '_growth_tree_token';
  static const String client = '_growth_tree_client';
  static const String expiry = '_growth_tree_expiry';
  static const String uid = '_growth_tree_uid';
}
