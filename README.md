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
| date_of_birth      | date     | null: false |

### Association

- has_many :items
- has_many :buyers


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


## buyers テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column           | Type         | Options                        |
| ---------------- | ------------ | ------------------------------ |
| post_code        | string       | null: false                    |
| prefecture_id    | integer      | null: false                    |
| municipality     | string       | null: false                    |
| street_address   | string       | null: false                    |
| building_name    | string       |                                |
| telephone_number | string       | null: false                    |
| buyer            | references   | null: false, foreign_key: true |


### Association

- belongs_to:buyer
