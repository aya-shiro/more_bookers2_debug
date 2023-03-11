class Book < ApplicationRecord

  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy

  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}
  # 評価を1－5までに制限するバリデーション↓
  # validates :star, numericality: {less_than_or_equal_to: 5, greater_than_or_equal_to: 1}, presence: true

  # いいねできるユーザーを1人に定める
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  # 検索機能
  def self.looks(search, word)
    if search == "perfect_match"
      @book = Book.where("title LIKE?","#{word}")
    elsif search == "forward_match"
      @book = Book.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      @book = Book.where("title LIKE?","%#{word}")
    elsif search == "partial_match"
      @book = Book.where("title LIKE?","%#{word}%")
    else
      @book = Book.all
    end
  end

  # 応用課題9dのため記述
  acts_as_taggable_on :categories


end
