class PublicController < ApplicationController
  def index
    @cars = Car.best_cars

    @top_appliances = []
    5.times do
      value = rand(APPLIANCES_CLASSES.size)
      @top_appliances << APPLIANCES_CLASSES[value].to_s.constantize.best if APPLIANCES_CLASSES[value].to_s
    end
    @top_appliances = @top_appliances.flatten.compact
  end

  def search
    @cars = Car.search(params[:q], :order => :rating,
                       :page => 1, :per_page => 20)

    unless @cars.empty?
      @search = Car.searchlogic
      render :template => "cars/index"
    else
      @appliances = ThinkingSphinx.search(params[:q], :classes => APPLIANCES_CLASSES, 
                                          :page => 1, :per_page => 20)
      render :template => "appliances/index"
    end
  end
  
  def about_us
    @meta_title       = "El equipo Abredatos que ha creado Desenchufa tu Casa"
    @meta_description = "Abredatos es un concurso que busca conciencar sobre la necesidad de que las administraciones liberen datos de forma estándar y accesible a todos los ciudadanos."
  end

end
