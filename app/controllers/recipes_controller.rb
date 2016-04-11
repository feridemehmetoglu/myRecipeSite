class RecipesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_recipe, only:[:show, :edit, :update, :destroy]
	def index
		@recipes = Recipe.all
	end

	def new
		@recipe = Recipe.new
	end
	def create

		@recipe = Recipe.new(recipe_params)
		respond_to do |format|
			if @recipe.save
				format.html {redirect_to @recipe, notice: 'Recipe was successfully created'}
				format.json { render :show, status: :created, location: @recipe}
			else
				format.html { render :new }
				format.json { render json: @team.errors, status: :unprocessable_entity}    	
			end
			
		end

		def show
			
		end

		def update
			respond_to do |format|
				if @recipe.update(recipe_params)
					format.html { redirect_to @recipe, notice: 'Recipe was succesfully updated'}
      	  # format.json { render :show status: :ok, location: @team }
      	else
      		format.html {render :edit}
      		format.json {render json: @recipe.errors, status: :unprocessable_entity}
      		
      	end
      end
  end

  def edit
  	
  end

  def destroy
  	@team.destroy
  	respond_to do |format|
  		format.html { redirect_to recipes_url, notice: 'Recipe was successfully deleted'}
  		format.json { head :no_content}
  	end
  end


  private

  def recipe_params
  	params.require(:recipe).permit(:user_id,:title,:ingredient,:description,:date,:read_count,:confirmation)
  end
  
  def set_recipe
  	@recipe = Recipe.find(params[:id])
  end

end
end
