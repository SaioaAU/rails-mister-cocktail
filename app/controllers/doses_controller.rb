class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
    @ingredients = Ingredient.all.map { |ingredient| ingredient.name }
  end

  def create
    @dose = Dose.new(dose_params)
    @ingredient = Ingredient.where(name: params[:dose][:ingredient])    # we need `restaurant_id` to associate dose with corresponding restaurant
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    @dose.ingredient_id = @ingredient.first.id
    @dose.save
    redirect_to cocktail_path(@cocktail)
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktails_path(@cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:description)
  end
end
