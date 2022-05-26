## users

| Column              | Type    | Options                    |
|---------------------|---------|----------------------------|
| nickname            | string  | null: false                |
| email               | string  | null: false, unique: true  |
| encrypted_password  | string  | null: false                |
| last_name           | string  | null: false                |
| first_name          | string  | null: false                |
| last_name_kana      | string  | null: false                |
| first_name_kana     | string  | null: false                |
| birthday            | date    | null: false                |

has_many :items
has_many :purchases


## items

| Column            | Type        | Options                         |
|-------------------|-------------|---------------------------------|
| name              | string      | null: false                     |
| price             | integer     | null: false                     |
| description       | text        | null: false                     |
| category_id       | integer     | null: false                     |
| condition_id      | integer     | null: false                     |
| charge_id         | integer     | null: false                     |
| prefecture_id     | integer     | null: false                     |
| delivery_date_id  | integer     | null: false                     |
| user              | references  | null: false, foreign_key: true  |

belongs_to :user
has_one :order


## orders

| Column  | Type        | Options                         |
|---------|-------------|---------------------------------|
| user    | references  | null: false, foreign_key: true  |
| item    | references  | null: false, foreign_key: true  |

belongs_to :user
belongs_to :item
has_one :address


## addresses

| Column         | Type        | Options                         |
|----------------|-------------|---------------------------------|
| zip_code       | string      | null: false                     |
| prefecture_id  | integer     | null: false                     |
| city           | string      | null: false                     |
| address_line   | string      | null: false                     |
| building       | string      |                                 |
| tel            | string      | null: false                     |
| order          | references  | null: false, foreign_key: true  |

belongs_to :order