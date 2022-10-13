class FoodsController < ApplicationController
  before_action :authenticate_user!

  def index
    @foods = Food.all
  end

  # GET /foods/new
  def new
    @food = Food.new
  end

  def create
    @food = current_user.foods.new(food_params)
    respond_to do |format|
      format.html do
        if @food.save
          flash[:success] = 'Food saved successfully'
          redirect_to foods_path(@food)
        else
          flash.now[:error] = 'Error: Food could not be saved'
          redirect_to new_food_path
        end
      end
    end
  end

  def destroy
    @food = current_user.foods.find(params[:id])
    @food.destroy
    redirect_to foods_url notice: 'food was successfully destroyed.'
  end

  private

  # Only allow a list of trusted parameters through.
  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
