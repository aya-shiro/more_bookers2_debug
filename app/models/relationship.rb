class Relationship < ApplicationRecord
  # usersテーブルを参照するよう指定する
  # フォローするuserテーブルと、フォローされるuserテーブル？
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
end
