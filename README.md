# テーブル設計

  ## users テーブル

  | Column              | Type    | Options                   |
  | ------------------- | ------- | ------------------------- |
  | nickname            | string  | null: false               |
  | email               | string  | null: false, unique: true |
  | encrypted_password  | string  | null: false               |
  | last_name           | string  | null: false               |
  | first_name          | string  | null: false               |
  | ruby_last_name      | string  | null: false               |
  | ruby_first_name     | string  | null: false               |
  | birth_year          | integer | null: false               |
  | birth_month         | integer | null: false               |
  | birth_day           | integer | null: false               |

  ### Association

  - has_many :items
  - has_many :orders

  ## items テーブル

  | Column        | Type       | Options                        |
  | ------------- | ---------- | ------------------------------ |
  | name          | string     | null: false                    |
  | description   | text       | null: false                    |
  | category      | string     | null: false                    |
  | condition     | string     | null: false                    |
  | shipping_cost | integer    | null: false                    |
  | ship_from     | string     | null: false                    |
  | shipping_day  | string     | null: false                    |
  | price         | integer    | null: false                    |
  | user          | references | null: false, foreign_key: true |

  ### Association

  - belongs_to :user
  - has_one :order

  ## orders テーブル

  | Column | Type       | Options                        |
  | ------ | ---------- | ------------------------------ |
  | user   | references | null: false, foreign_key: true |
  | item   | references | null: false, foreign_key: true |

  ### Association

  - belongs_to :user
  - belongs_to :item
  - has_one :shipping

  ## shippings テーブル

  | Column       | Type       | Options                        |
  | ------------ | ---------- | ------------------------------ |
  | postcode     | integer    | null: false                    |
  | prefecture   | string     | null: false                    |
  | city         | string     | null: false                    |
  | address      | integer    | null: false                    |
  | building     | string     |                                |
  | phone_number | integer    | null: false                    |
  | order        | references | null: false, foreign_key: true |

  ### Association

  - belongs_to :order
