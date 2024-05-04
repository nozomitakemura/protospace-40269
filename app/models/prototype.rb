class Prototype < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user
  #belongs_to :user, dependent: :destroy
  has_one_attached :image, dependent: :destroy

  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :concept, presence: true
  validates :image, presence: true




end
