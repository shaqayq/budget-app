class TransactionEntity < ApplicationRecord
    belongs_to :user , foreign_key: 'user_id' , class_name: 'User'

    has_many :transaction_categories , dependent: :delete_all
    has_many :categories , through: :transaction_categories

    validates :name, presence: true, length: { maximum: 30 }
    validates :amount, presence: true, numericality: { greater_than: 0 }
   validates :category_ids ,  acceptance: { message: 'must select at least one ' }
 
end
