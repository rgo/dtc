class PublicController < ApplicationController
  def index
    @cars = Car.best_cars
    
  end

end
