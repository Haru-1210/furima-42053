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
| first_name_kane    | string    | null: false               |
| birthdate          | date      | null: false               |

## products テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_images        | references | null: false, foreign_key: true |
| items              | string     | null: false                    |
| description        | text       | null: false                    |
| category_id        | string     | null: false                    |
| condition_id       | string     | null: false                    |
| shipping_charge_id | string     | null: false                    |
| shipping_area_id   | string     | null: false                    |
| shipping_day_id    | string     | null: false                    |
| price              | int        | null: false                    |
| user               | references | null: false, foreign_key: true |


## orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| items   | references | null: false, foreign_key: true |

## shipping_addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| zip_code_id   | int        | null: false                    |
| prefecture_id | int        | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| phone_number  | string     | null: true                     |
| order         | references | null: false, foreign_key: true |