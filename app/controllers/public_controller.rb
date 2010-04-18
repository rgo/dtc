class PublicController < ApplicationController
  def index
    @cars = Car.best_cars
    
  end
  
  def about_us
    @meta_title       = "El equipo Abredatos que ha creado Desenchufa tu Casa"
    @meta_description = "Abredatos es un concurso que busca conciencar sobre la necesidad de que las administraciones liberen datos de forma estándar y accesible a todos los ciudadanos."
  end

end
