# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

- Ruby version

- System dependencies

- Configuration

- Database creation

# furima_27441 DB 設計

## users テーブル

| Column           | Type    | Options                  |
| ---------------- | ------- | ------------------------ |
| id               | integer | prime_key:true           |
| nickname         | string  | null:false, unique: true |
| email            | string  | null:false               |
| password         | string  | null:false               |
| first_name       | string  | null:false               |
| family_name      | string  | null:false               |
| first_name_kana  | string  | null:false               |
| family_name_kana | string  | null:false               |
| birthday         | integer | null:false               |

### Association

- has_many :Exhibited_goodses
- has_many :Purchases

## Exihited_goods テーブル

| Column            | Type       | Options                     |
| ----------------- | ---------- | --------------------------- |
| id                | integer    | prime_key: true             |
| image             | string     | null:false                  |
| goods_name        | string     | null: false                 |
| goods_explanation | text       | null: false                 |
| goods_price       | integer    | null:false                  |
| is_purchased      | tinyint    | default:0                   |
| category_id       | integer    | null:false                  |
| payment_id        | integer    | null:false                  |
| prefecture_id     | integer    | null:false                  |
| until_delivery_id | integer    | null:false                  |
| delivery          | references | null:false,foreign_key:true |
| user              | references | null:false,foreign_key:true |

### Association

- belongs_to:user

## Parchases テーブル

| Column          | Type       | Options         |
| --------------- | ---------- | --------------- |
| id              | integer    | prime_key: true |
| credit_number   | int        | null:false      |
| expiration_date | date       | null:false      |
| security_code   | int        | null:false      |
| user            | references | null:false      |
| address         | references | null:false      |

### Association

- belongs_to:user
- has_one: address

## Addresses テーブル

| Column               | Type    | Options         |
| -------------------- | ------- | --------------- |
| id                   | integer | prime_key: true |
| postal_code          | int     | null:false      |
| prefecture_id        | integer | null:false      |
| address_city         | String  | null:false      |
| address_house_number | int     | null:false      |
| phone_number         | int     | null:false      |

### Association

- belongs_to:purchase

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
