# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname    | string | null: false   |
| email | string | null: false, unique: true   |
| encrypted_password     | string | null: false   |
| last name | string | null: false   |
| first name | string | null: false   |
| last name kana | string | null: false   |
| first name kana | string | null: false   |
| birthday | date | null: false   |

### Association
- has_many :item

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name  | string | null: false   |
| description  | text | null: false   |
| details  | text | null: false   |
| price  | integer | null: false   |
| product condition  | string | null: false   |
| shipping charges   | string | null: false   |
| shipping area   | string | null: false   |
| days to ship    | string | null: false   |
| category        | string | null: false   |
| user  | references | null: false, foreign_key: true  |

### Association
- belongs_to :user
- has_one :purchase record


## purchase record テーブル

| Column | Type   | Options     |
| ------ | ---------- | ------- |
| user  | references   | null: false, foreign_key: true      |
| item  | references   | null: false, foreign_key: true       |

### Association
- belongs_to :item
- has_one :destination


## destination テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| postal code  | string | null: false   |
| prefectures  | string | null: false   |
| municipality  | string | null: false   |
| address  | string | null: false   |
| building name  | string |    |
| phone number  | string | null: false   |
| user  | references   | null: false, foreign_key: true      |
| item  | references   | null: false, foreign_key: true       |

### Association
- belongs_to :purchase record