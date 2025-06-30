class User < ApplicationRecord
  has_many :orders
  belongs_to :user
  belongs_to :item

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,        presence: true
  validates :password,        format: { with: /\A(?=.*[a-z])(?=.*\d)[a-z\d]+\z/i, message: 'は英数字の混合である必要があります' }
  validates :last_name,       presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :first_name,      presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :last_name_kana,  presence: true, format: { with: /\A[ァ-ヶー]+\z/ }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー]+\z/ }
  validates :birthdate,       presence: true

end
