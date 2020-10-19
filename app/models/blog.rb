class Blog < ApplicationRecord
  belongs_to :user
  has_many :comments
  accepts_nested_attributes_for :comments

  scope :order_by_latest, -> { order(created_at: :desc) }
end
