ChatSpace
==

ChatSpace(チャットスペース)は、サービス開発の練習のために作られたチャット用webアプリケーションです。

## Ruby version
  Ruby 2.3.1

## Database design

# users
## association
has_many :messages  
has_many :groups, through: :groups_users

## table
* name :string
* email :string, null: false, unique: true
* password :string, null: false


# groups
## Association
has_many :users, through: :groups_users  
has_many :messages

# table
* name :string


# groups_users
## Association
belongs_to :group  
belongs_to :user

## table
* user_id :integer, null: false
* group_id :integer, null: false


# messages
## Association
belongs_to :user  
belongs_to :group

## table
* body :text
* image :string
* user_id :integer, null: false
* group_id :integer, null: false
