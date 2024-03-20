# テーブル設計

## users テーブル

| Column             | Type     | Options     |
| ------------------ | -------- | ----------- |
| nickname           | string   | null: false |
| email              | string   | null: false, unique: true |
| encrypted_password | string   | null: false |
| name               | string   | null: false |
| name_kana          | string   | null: false |
| date_of_birth      | datetime | null: false |

### Association

- has_many :items
- has_one :buers
<!-- - has_many :messages -->

##  itemsテーブル

| Column             | Type    | Options     |
| ------------------ | ------  | ----------- |
| item               | string  | null: false |
| item_name          | string  | null: false |
| item_description   | text    | null: false |
| category           | string  | null: false |
| item_status        | string  | null: false |
| delivery_charge    | string  | null: false |
| prefectures        | string  | null: false |
| shipping_days      | string  | null: false |
| price              | integer | null: false |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_one :buyers
<!-- - has_many :messages -->

## buyers テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |投稿者
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items
- has_one :addresses

## addresses テーブル

| Column           | Type         | Options                        |
| ---------------- | ------------ | ------------------------------ |
| post_code        | integer      | null: false                    |
| prefectures      | string       | null: false                    |
| municipalities   | string       | null: false                    |
| street_address   | string       | null: false                    |
| building_name    | string       | null: false                    |
| telephone_number | integer      | null: false                    |


### Association

- belongs_to :buyers
