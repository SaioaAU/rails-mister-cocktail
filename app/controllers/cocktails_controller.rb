class CocktailsController < ApplicationController

  def  index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.save
    redirect_to new_cocktail_dose_path(@cocktail)
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end
