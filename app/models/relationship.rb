class Relationship < ApplicationRecord
  # follower, followedテーブルが存在しないため class_name で関連付けを行う
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
end
