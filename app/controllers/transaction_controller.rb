class TransactionController < ApplicationController

    def index
        
    end

   def new
    @transaction_entity=TransactionEntity.new
    @category = Category.all
   end

    def create
        @transaction = TransactionEntity.new(name:transaction_params[:name] , amount: transaction_params[:amount] )
        @transaction.user_id = current_user.id

        respond_to do |format|
            format.html do
              if transaction_params[:category_ids].present?
                if @transaction.save
                    transaction_params[:category_ids].each do |category_id|
                        TransactionCategory.create( category_id: category_id, transaction_entities_id: @transaction.id)
                    end
                    redirect_to user_category_path(current_user.id , params[:category_id]) , notice: 'Transaction Add Successfuly'
                else
                    flash[:error] = @transaction.errors.full_messages
                     redirect_to new_user_category_transaction_path(current_user.id , params[:category_id]), status: :unprocessable_entity
                end
                
              else
                
                error_array = @transaction.errors.full_messages
                error_array << 'Please select at least one category'
                flash[:error] = error_array
                redirect_to new_user_category_transaction_path(current_user.id , params[:category_id]), status: :unprocessable_entity
              end
            end
        end
    end

    def transaction_params
        params.require(:transaction_entity).permit(:name , :amount , category_ids: [])
    end
end
