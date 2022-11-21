class TransactionEntity < ApplicationRecord
    belongs_to :user , foreign_key: 'user_id' , class_name: 'User'

    has_many :categories , through: :transaction_categories
    has_many :transaction_categories , dependent: :delete_all

    validates :name , :amount , presence: true
end
