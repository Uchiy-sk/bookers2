class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room

  # 140字数制限
  validetes :message, presence: true, length: {maximum: 140}
end
