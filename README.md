# テーブル設計

## users テーブル

| Column             | Type      | Options                   |
| ------------------ | --------- | ------------------------- |
| nickname           | string    | null: false               |
| email              | string    | null: false, unique: true |
| encrypted_password | string    | null: false               |
| last_name          | string    | null: false               |
| first_name         | string    | null: false               |
| last_name_kana     | string    | null: false               |
| first_name_kana    | string    | null: false               |
| birthdate          | date      | null: false               |

### Association
- has_many :products
- has_many :orders

## products テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_name          | string     | null: false                    |
| description        | text       | null: false                    |
| category_id        | int        | null: false                    |
| condition_id       | int        | null: false                    |
| shipping_charge_id | int        | null: false                    |
| prefecture_id      | int        | null: false                    |
| shipping_day_id    | int        | null: false                    |
| price              | int        | null: false                    |
| user               | references | null: false, foreign_key: true |
| created_at         | datetime   | null: false                    |
| updated_at         | datetime   | null: false                    |

### Association
- belongs_to :user
- has_one :order

## orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :product
- has_one :shipping_address

## shipping_addresses テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| zip_code       | string     | null: false                    |
| prefecture_id  | int        | null: false                    |
| city           | string     | null: false                    |
| street_address | string     | null: false                    |
| building_name  | string     |                                |
| phone_number   | string     | null: false                    |
| order          | references | null: false, foreign_key: true |

### Association
- belongs_to :order