# README

## usersテーブル

| Column             | Type     | Options                  |
|--------------------|----------|--------------------------|
| nickname           | string   | null: false              |       
| email              | string   | null: false,unique: true |
| encrypted_password | string   | null: false              |
| last_name          | string   | null: false              | 
| first_name         | string   | null: false              |
| last_name_kana     | string   | null: false              |
| first_name_kana    | string   | null: false              |
| birthday           | date     | null: false              |

### association

has_many :items
has_many :orders


## itemsテーブル

| Column             | Type      | Options           |
|--------------------|-----------|-------------------|
| item_name          | string    | null: false       |
| text               | text      | null: false       |
| category_id        | integer   | null: false       |
| status_id          | integer   | null: false       |
| delivery_charge_id | integer   | null: false       |
| prefecture_id      | integer   | null: false       |
| delivery_day_id    | integer   | null: false       |
| price              | integer   | null: false       |
| user               | references| foreign_key: true |

:image ActiveStrageで実装

### association

belongs_to :user
has_one :order


## addressテーブル

| Column             | Type      | Options           |
|--------------------|-----------|-------------------|
| postal_code        | string    | null: false       |
| prefecture_id      | integer   | null: false       |
| city               | string    | null: false       |
| house_number       | string    | null: false       |
| building_name      | string    |                   |
| phone_number       | string    | null: false       |
| order              | references| foreign_key: true |


### association
belongs_to :order



## orders テーブル
| Column             | Type      | Options           |
|--------------------|-----------|-------------------|
| item               | references| foreign_key: true |
| user               | references| foreign_key: true |

### association
belongs_to :user
belongs_to :item
has_one :address


### credit_card
payjpで実装