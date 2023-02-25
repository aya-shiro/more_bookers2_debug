class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :book

　# いいねできるユーザーを1人に定める、二重セーフティーでより強固に
  validates_uniqueness_of :book_id, scope: :user_id

end
