class TransactionController < ApplicationController

    def index
        
    end

   def new
    @transaction_entity=TransactionEntity.new
   end

    def create
        @transaction = TransactionEntity.new(transaction_params)
        @transaction.user_id = current_user.id
        respond_to do |format|
            format.html do
                if @transaction.save
                    TransactionCategory.create( category_id: params[:category_id], transaction_entities_id: @transaction.id)
                redirect_to user_category_index_path(current_user.id) , notice: 'Transaction Add Successfuly'
                else
                render :new  , notice: 'Transaction can`t Add!'
                end
               end
            end


    end

    def transaction_params
        params.require(:transaction_entity).permit(:name , :amount)
    end
end
