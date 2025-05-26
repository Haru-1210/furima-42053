# テーブル設計

## users テーブル

| Column              | Type      | Options                   |
| ------------------- | --------- | ------------------------- |
| id                  | int       | null: false, unique: true |
| email               | string    | null: false, unique: true |
| name                | string    | null: false               |
| password            | string    | null: false               |

## products テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| id                  | int        | null: false, unique: true      |
| user_id             | references | null: false, foreign_key: true |
| name                | string     | null: false                    |
| price               | int        | null: false                    |

## orders テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| id                  | int        | null: false, unique: true      |
| user_id             | references | null: false, foreign_key: true |
| shipping_address_id | references | null: false, foreign_key: true |
| status              | string     | null: false                    |
| total_price         | int        | null: false                    |

## order_items テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| id                    | int        | null: false, unique: true      |
| product_id            | references | null: false, foreign_key: true |
| order_id              | references | null: false, foreign_key: true |
| quantity              | int        | null: false                    |
| price                 | int        | null: false                    |
| subtotal              | int        | null: false                    |

## shipping_addresses テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| id                    | int        | null: false, unique: true      |
| user_id               | references | null: false, foreign_key: true |
| zip_code              | string     | null: false                    |
| prefecture            | string     | null: false                    |
| city                  | string     | null: false                    |
| address_line1         | string     | null: false                    |
| address_line2         | string     | null: true                     |
| recipient_name        | string     | null: false                    |
| phone_number          | string     | null: true                     |