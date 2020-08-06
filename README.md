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

- has_many:dealings
- has_many: exhibited_items

## Exhibited_items テーブル

| Column            | Type       | Options          |
| ----------------- | ---------- | ---------------- |
| id                | integer    | prime_key: true  |
| image             | string     | null:false       |
| name              | string     | null: false      |
| explanation       | text       | null: false      |
| price             | integer    | null:false       |
| category_id       | integer    | null:false       |
| status_id         | integer    | null:false       |
| payment_id        | integer    | null:false       |
| prefecture_id     | integer    | null:false       |
| until_delivery_id | integer    | null:false       |
| user              | references | foreign_key:true |

### Association

- belongs_to:user
- has_one:dealing
- has_one:shipping_address

## Purchases テーブル

| Column         | Type       | Options          |
| -------------- | ---------- | ---------------- |
| id             | integer    | prime_key: true  |
| postal_code    | integer    | null:false       |
| prefecture_id  | integer    | null:false       |
| city           | string     | null:false       |
| house_number   | string     | null:false       |
| building       | string     |                  |
| phone_number   | string     | null:false       |
| exhibited_item | references | foreign_key:true |

### Association

- belongs_to:exhibited_item

## Dealings テーブル

| Column            | Type       | Options                      |
| ----------------- | ---------- | ---------------------------- |
| id                | integer    | prime_key: true              |
| user_id           | references | null:false ,foreign_key:true |
| exhibited_item_id | references | null:false ,foreign_key:true |

### Association

- belongs_to:user
- belongs_to:exhibited_item

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
