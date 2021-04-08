# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname    | string | null: false   |
| email | string | null: false   |
| password     | string | null: false   |


## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name  | string | null: false   |
| description  | text | null: false   |
| details  | text | null: false   |
| price  | string | null: false   |
| user  | references |           |

## purchase record テーブル

| Column | Type   | Options     |
| ------ | ---------- | ------- |
| user  | references   |        |
| item  | references   |        |

## destination テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| postal code  | string | null: false   |
| prefectures  | string | null: false   |
| municipality  | string | null: false   |
| address  | string | null: false   |
| building name  | string | null: false   |
| phone number  | string | null: false   |