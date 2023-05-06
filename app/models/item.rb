class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :condition
    belongs_to :shipping_cost
    belongs_to :prefecture
    belongs_to :shipping_day

  validates :image, presence: true
  validates :name, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_cost_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_day_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price, presence: true, format: { with: /\A[3-9]\d{2}|\d{4,7}\z/ }
  validates :user, presence: true

end
