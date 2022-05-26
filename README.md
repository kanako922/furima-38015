## users

| Column              | Type    | Options                    |
|---------------------|---------|----------------------------|
| nickname            | string  | null: false, unique: true  |
| email               | string  | null: false, unique: true  |
| encrypted_password  | string  | null: false                |
| last_name           | string  | null: false                |
| first_name          | string  | null: false                |
| birthday            | date    | null: false                |

has_many :items
has_many :purchases


## items

| Column    | Type       | Options                         |
|-----------|------------|---------------------------------|
| name      | string     | null: false                     |
| price     | integer    | null: false                     |
| category  | string     | null: false                     |
| user_id   | reference  | null: false, foreign_key: true  |

belongs_to :user
has_one :order


## orders

| Column    | Type       | Options                         |
|-----------|------------|---------------------------------|
| user_id   | reference  | null: false, foreign_key: true  |
| item_id   | reference  | null: false, foreign_key: true  |

belongs_to :user
belongs_to :item
has_one :address


## addresses

| Column        | Type    | Options                    |
|---------------|---------|----------------------------|
| zip_code      | string  | null: false                |
| prefecture    | string  | null: false                |
| city          | string  | null: false                |
| address_line  | string  | null: false                |
| building      | string  |                            |
| tel           | string  | null: false, unique: true  |

belongs_to :order