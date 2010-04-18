class AppliancesController < ApplicationController

  def index

  end

  def search
    @appliances = ThinkingSphinx.search(params[:q], :classes => APPLIANCES_CLASSES,
                                        :page => 1, :per_page => 20)

    @appliances_by_class = @appliances.group_by(&:class)

    render :template => "appliances/index"
  end

  def show
    
  end
end
