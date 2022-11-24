class Category < ApplicationRecord

    belongs_to :user ,  foreign_key: 'user_id' , class_name: 'User'

    has_many :transactions , through:  :transaction_categories
    has_many :transaction_categories , dependent: :delete_all

    validates :name , :icone , presence: true
end
