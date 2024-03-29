class RecipesController < ApplicationController
    before_action :find_recipe, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user, except: [:index, :show]

    def index
        @recipe = Recipe.all.order("created_at DESC")
    end
    def show
    end
    def new
        @recipe = current_user.recipes.build
        #:allow_destroy => true
    end
    def create
        @recipe = current_user.recipes.build(recipe_params)
        if @recipe.save
            redirect_to @recipe, notice: "Successfully Created New Recipe"
        else
            render 'new'
        end
    end
    def edit
    end
    def update
        if @recipe.update(recipe_params)
            redirect_to @recipe
        else
            render 'edit'
        end
    end
    def destroy
        @recipe.destroy
        redirect_to root_path, notice: "Successfulyl Deleted Reccipe"
    end
    private

    def recipe_params
        params.require(:recipe).permit(:title, :description, ingredients_attributes: [:id, :name, :_destroy], directions_attributes: [:id, :step, :_destroy])
    end

    def find_recipe
        @recipe = Recipe.find(params[:id])
    end
end
