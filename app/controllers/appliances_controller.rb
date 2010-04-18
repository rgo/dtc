class AppliancesController < ApplicationController

  def index
    @dishwashers = Dishwasher.best
    @dryers = Dryer.best
    @freezers = Freezer.best
    @fridges = Fridge.best
    @fridge_freezers = FridgeFreezer.best
    @ovens = Oven.best
    @washer_dryers = WasherDryer.best
    @washing_machines = WashingMachine.best
  end

  def search
    @dishwashers = Dishwasher.brand_or_model_like(params[:q]).paginate(:page => 1, :per_page => 20)
    @dryers = Dryer.brand_or_model_like(params[:q]).paginate(:page => 1, :per_page => 20)
    @freezers = Freezer.brand_or_model_like(params[:q]).paginate(:page => 1, :per_page => 20)
    @fridges = Fridge.brand_or_model_like(params[:q]).paginate(:page => 1, :per_page => 20)
    @fridge_freezers = FridgeFreezer.brand_or_model_like(params[:q]).paginate(:page => 1, :per_page => 20)
    @ovens = Oven.brand_or_model_like(params[:q]).paginate(:page => 1, :per_page => 20)
    @washer_dryers = WasherDryer.brand_or_model_like(params[:q]).paginate(:page => 1, :per_page => 20)
    @washing_machines = WashingMachine.brand_or_model_like(params[:q]).paginate(:page => 1, :per_page => 20)
  end

end
