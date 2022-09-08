# README

# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| name               | string | null: false, unique: true |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| birthday           | date   | null: false               |
| user_memo          | text   |                           |
| admin_memo         | text   |                           |
| admin              | boolean|                           |



### Association

- has_many :reservations
- has_many :user_prefers
- has_many :prefers, through :user_prefers

## prefers テーブル

| Column             | Type        | Options                        |
| ------------------ | ----------- | ------------------------------ |
| wday               | string      | null: false                    | 
| time               | integer     | null: false                    | 


### Association
 
- has_many :users, through :user_prefers
- has_many :user_prefers

## user_prefers テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| prefer_id | integer    | null: false                    |

### Association

- belongs_to :user
- belongs_to :prefer

## reservations テーブル


| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| date            | date       | null: false                    | 
| remark          | text       |                                | 
| user            | references | null: false, foreign_key: true |
| prefer_id       | integer    | null: false                    |
| start_time      | date       |                                |

### Association

- belongs_to :user