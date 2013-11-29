class Establishment < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  validates :name, presence: true
end
