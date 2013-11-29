class Review < ActiveRecord::Base
  belongs_to :establishment
  validates :rating, :comment, presence: true
end
