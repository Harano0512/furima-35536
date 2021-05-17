# README

## usersテーブル

| Column          | Type     | Options               |
|-----------------|----------|-----------------------|
| nickname        | string   | NOT NULL,unique: true |       
| email           | string   | NOT NULL,unique: true |
| password        | string   | NOT NULL              |
| last_name       | string   | NOT NULL              | 
| first_name      | string   | NOT NULL              |
| last_name_kana  | string   | NOT NULL              |
| first_name_kana | string   | NOT NULL              |
| birth_year_id   | integer  | NOT NULL              |
| birth_month_id  | integer  | NOT NULL              |
| birth_date_id   | integer  | NOT NULL              |

### association

has_many :items


## itemsテーブル

| Column             | Type      | Options               |
|--------------------|-----------|-----------------------|
| name               | string    | NOT NULL              |
| text               | text      | NOT NULL              |
| category_id        | integer   | NOT NULL              |
| status_id          | integer   | NOT NULL              |
| delivery_charge_id | integer   | NOT NULL              |
| prefecture_id      | integer   | NOT NULL              |
| delivery_days_id   | integer   | NOT NULL              |
| price              | integer   | NOT NULL              |
| image              | ActiveStrageで実装                 |
| user_id            | references| NOT NULL              |

### association

belongs_to :user
has_one :purchase


## ordersテーブル

| Column             | Type      | Options               |
|--------------------|-----------|-----------------------|
| postal_code        | string    | NOT NULL              |
| prefecture_id      | integer   | NOT NULL              |
| city               | string    | NOT NULL              |
| house_number       | string    | NOT NULL              |
| building_name      | string    | NOT NULL              |
| phone_number       | string    | NOT NULL              |
| credit_card        | payjp.jsで実装                     |
| items_id           | references| NOT NULL              |
