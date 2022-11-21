class TransactionCategory < ApplicationRecord
    belongs_to :transactions , foreign_key: 'transaction_id'
    belongs_to :categories , foreign_key: 'category_id'
end
