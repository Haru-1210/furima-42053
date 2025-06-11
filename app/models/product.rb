class Product < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :prefecture
  
  validates :item_name, :description, :price, presence: true

  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_charge_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
end
