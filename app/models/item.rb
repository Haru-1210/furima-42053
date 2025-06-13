class Item < ApplicationRecord

  validates :item_name,          presence: true
  validates :description,        presence: true
  validates :category_id,        presence: true
  validates :condition_id,       presence: true
  validates :shipping_charge_id, presence: true
  validates :prefecture_id,      presence: true
  validates :shipping_day_id,    presence: true
  validates :price,              presence: true
  validates :image,              presence: true

  validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10_000_000 }

  has_one_attached :image
end
