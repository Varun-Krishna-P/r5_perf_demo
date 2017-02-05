class Post < ApplicationRecord
  belongs_to :category
  belongs_to :user
  validates :name, presence: true, uniqueness: true
  validates :category, presence: true
  validates :text, presence: true
end
