class AverageCache < ActiveRecord::Base
  belongs_to :rater, :class_name => "Book"
  belongs_to :rateable, :polymorphic => true
end
