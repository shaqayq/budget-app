class Category < ApplicationRecord

    belongs_to :user ,  foreign_key: 'user_id' , class_name: 'User'

    has_many :transaction_categories , dependent: :delete_all
    has_many :transaction_entities , through:  :transaction_categories

    validates :name  , presence: true, length: { maximum: 30 }
    validates  :icon , presence: true
end
