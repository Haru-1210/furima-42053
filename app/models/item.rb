class Item < ApplicationRecord
  has_one_attached :image
  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :shipping_day

  validates :item_name,          presence: true
  validates :description,        presence: true
  validates :category_id,        presence: true, numericality: { other_than: 1 }
  validates :condition_id,       presence: true, numericality: { other_than: 1 }
  validates :shipping_charge_id, presence: true, numericality: { other_than: 1 }
  validates :prefecture_id,      presence: true, numericality: { other_than: 1 }
  validates :shipping_day_id,    presence: true, numericality: { other_than: 1 }
  validates :image,              presence: true

  validates :price, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 300,
    less_than_or_equal_to: 9_999_999
  }

end
