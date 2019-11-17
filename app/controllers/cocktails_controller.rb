class CocktailsController < ApplicationController

  def index         # GET /restaurants
    @cocktails = Cocktail.all
  end

  def show          # GET /restaurants/:id
    @cocktail = Cocktail.find(params[:id])
  end

  def new           # GET /restaurants/new
    @cocktail = Cocktail.find(params[new_cocktail])
  end

  def create        # POST /restaurants
    @cocktail = Cocktail.new(name: params[:name], address: params[:address])
    @cocktail.save
  end

  def edit          # GET /restaurants/:id/edit
    @cocktail = Cocktail.find(params[:id])
  end

  def update        # PATCH /restaurants/:id
    if @cocktail.update(cocktail_params)
      redirect_to cocktail_path(@cocktail)
    else
      render :edit
  end

  # def update
  #   if @restaurant.update(restaurant_params)
  #     redirect_to restaurant_path(@restaurant)
  #   else
  #     render :edit
  #   end

  def destroy       # DELETE /restaurants/:id
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy
    redirect_to cocktail_path(@cocktail)
  end


# def destroy
#     @list = List.find(params[:id])
#     @list.destroy
#     redirect_to lists_path
#   end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end


  # def update
  #   person = current_account.people.find(params[:id])
  #   person.update!(person_params)
  #   redirect_to person
  # end
