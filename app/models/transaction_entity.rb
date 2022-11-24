class TransactionEntity < ApplicationRecord
    belongs_to :user , foreign_key: 'user_id' , class_name: 'User'

    has_many :transaction_categories , dependent: :delete_all
    has_many :categories , through: :transaction_categories
    
    validates :name , :amount , presence: true
end
