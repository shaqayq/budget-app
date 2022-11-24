class CategoryController < ApplicationController

    def index
        @category=Category.all

    end

    def new
        @category = Category.new
    end

    def show
        @category= Category.find(params[:id])
        @transaction_categories=@category.transaction_categories
        @transaction_entity= @category.transaction_entities.order('created_at DESC')
        @total_amount =  @category.transaction_entities.sum(:amount)
    end

    def create
        @category = Category.new(category_params)
        @category.user_id = params[:user_id]
        respond_to do |format|
            format.html do
                if @category.save
                redirect_to user_category_index_path(current_user.id) , notice: 'Category Add Successfuly'
                else
                render :new  , notice: 'Category can`t Add!'
                end
               end
            end
    end

    def category_params
        params.require(:category).permit(:name , :icon)
    end
end
