# テーブル設計

## users テーブル

| Column             | Type     | Options     |
| ------------------ | -------- | ----------- |
| nickname           | string   | null: false |
| email              | string   | null: false, unique: true |
| encrypted_password | string   | null: false |
| surname            | string   | null: false |
| surname_kana       | string   | null: false |
| name               | string   | null: false |
| name_kana          | string   | null: false |
| date_of_birth      | datetime | null: false |

### Association

- has_many :items
- has_many :buers
<!-- - has_many :messages -->

##  itemsテーブル

| Column             | Type    | Options     |
| ------------------ | ------  | ----------- |
| item_name          | string  | null: false |
| item_description   | text    | null: false |
| category_id        | integer | null: false |
| item_status_id     | integer | null: false |
| delivery_charge_id | integer | null: false |
| prefecture_id      | integer | null: false |
| shipping_day_id    | integer | null: false |
| price              | integer | null: false |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :buyer
<!-- - has_many :messages -->

## buyers テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |投稿者
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column           | Type         | Options                        |
| ---------------- | ------------ | ------------------------------ |
| post_code        | integer      | null: false                    |
| prefecture_id    | integer      | null: false                    |
| municipalities   | string       | null: false                    |
| street_address   | string       | null: false                    |
| building_name    | string       |                                |
| telephone_number | integer      | null: false                    |
| buyer            | references   | null: false, foreign_key: true |


### Association

- has_one  :buyer
