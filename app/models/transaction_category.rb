class TransactionCategory < ApplicationRecord
    belongs_to :transaction_entity , foreign_key: 'transaction_entities_id'
    belongs_to :category , foreign_key: 'category_id'
end
