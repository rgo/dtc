class SitemapsController < ApplicationController
  
  session :off
  layout nil
  
  caches_page :index
  
  def index
    @cars               = Car.all(:order => 'id asc')
    @air_cons           = AirConditioning.all(:order => "id asc")
    @dishwashers        = Dishwasher.all(:order => "id asc")
    @dryers             = Dryer.all(:order => "id asc")
    @freezers           = Freezer.all(:order => "id asc")
    @fridges            = Fridge.all(:order => "id asc")
    @fridges_freezers   = FridgeFreezer.all(:order => "id asc")
    @ovens              = Oven.all(:order => "id asc")
    @washer_dryers      = WasherDryer.all(:order => "id asc")
    @washing_machines   = WashingMachine.all(:order => "id asc")
    @worktop_gas        = WorktopGa.all(:order => "id asc")
    @worktop_inductions = WorktopInduction.all(:order => "id asc")

    respond_to do |format|
      format.html { 
        headers['Content-type'] ='application/xml'
        render :template=>'sitemaps/index.xml.builder', :type => :builder, :layout => false
      }
      format.xml      
    end
  end
end
