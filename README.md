# Takahashi_Rails_kensyu

## users tabel

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false|

### Association
- has_many :posts
- has_many :comments
- has_many :likes
- has_many :like_posts, through: :likes, source: :post

## posts tabel

|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|caption|text||
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_many :comments
- has_many :likes
- has_many :like_posts, through: :likes, source: :user

## comments tabel

|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|user_id|references|null: false, foreign_key: true|
|post_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :post

## likes tabel

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|post_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :post
