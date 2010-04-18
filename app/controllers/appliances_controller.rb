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
    @dishwashers = Dishwasher.search(params[:q], :page => 1, :per_page => 20)
    @dryers = Dryer.search(params[:q], :page => 1, :per_page => 20)
    @freezers = Freezer.search(params[:q], :page => 1, :per_page => 20)
    @fridges = Fridge.search(params[:q], :page => 1, :per_page => 20)
    @fridge_freezers = FridgeFreezer.search(params[:q], :page => 1, :per_page => 20)
    @ovens = Oven.search(params[:q], :page => 1, :per_page => 20)
    @washer_dryers = WasherDryer.search(params[:q], :page => 1, :per_page => 20)
    @washing_machines = WashingMachine.search(params[:q], :page => 1, :per_page => 20)
  end

end
