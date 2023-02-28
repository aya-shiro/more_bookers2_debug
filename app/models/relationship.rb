class Relationship < ApplicationRecord
  # usersテーブルを参照するよう指定する。多対多のアソ定義は2つ要る
  # belongs_to :userだと見分けがつかない → class_name: "User"で記述する
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
end
