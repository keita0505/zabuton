# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
## users table
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|image|string|null: false|


### Association
- has_many :themes
- has_many :answers
- has_many :scores

## theme table
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|image|string|------|
|user|reference|null: false, foreign_key: true|

### Association
- has_many :answers
- belongs_to :user

## answer table
|Column|Type|Options|
|------|----|-------|
|text|string|null: false|
|user|reference|null: false, foreign_key: true|
|theme|reference|null: false, foreign_key: true|

### Association
- has_many :scores
- belongs_to :user
- belongs_to :theme

## score table
|Column|Type|Options|
|------|----|-------|
|user|reference|null: false, foreign_key: true|
|answer|reference|null: false, foreign_key: true|

### Association
= belongs_to :user
= belongs_to :answer
