class CategoryController < ApplicationController

    def index
        @category=Category.all
    end

    def new
        @category = Category.new
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
        params.require(:category).permit(:name , :icone)
    end
end
