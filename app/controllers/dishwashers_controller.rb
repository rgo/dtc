class DishwashersController < ApplicationController
  # GET /dishwashers
  # GET /dishwashers.xml
  def index
    @search = Dishwasher.search(params[:search])
    @dishwashers = @search.paginate(:page => params[:page])
    
    @meta_title       = t('dishwashers.index.title') 
    @meta_description = t('dishwashers.index.description')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @dishwashers }
    end
  end

  # GET /dishwashers/1
  # GET /dishwashers/1.xml
  def show
    @dishwasher = Dishwasher.find(params[:id])
    
    @meta_title       = "#{@dishwasher.product} #{@dishwasher.brand} #{@dishwasher.model}" 
    @meta_description = "#{@dishwasher.product} #{@dishwasher.brand} #{@dishwasher.model} #{Dishwasher.human_attribute_name(:consume)} #{@dishwasher.consume} (kWh/Ciclo)"
    @canonical        = url_for(@dishwasher)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @dishwasher }
    end
  end

  # GET /dishwashers/new
  # GET /dishwashers/new.xml
  def new
    @dishwasher = Dishwasher.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @dishwasher }
    end
  end

  # GET /dishwashers/1/edit
  def edit
    @dishwasher = Dishwasher.find(params[:id])
  end

  # POST /dishwashers
  # POST /dishwashers.xml
  def create
    @dishwasher = Dishwasher.new(params[:dishwasher])

    respond_to do |format|
      if @dishwasher.save
        flash[:notice] = 'Dishwasher was successfully created.'
        format.html { redirect_to(@dishwasher) }
        format.xml  { render :xml => @dishwasher, :status => :created, :location => @dishwasher }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @dishwasher.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /dishwashers/1
  # PUT /dishwashers/1.xml
  def update
    @dishwasher = Dishwasher.find(params[:id])

    respond_to do |format|
      if @dishwasher.update_attributes(params[:dishwasher])
        flash[:notice] = 'Dishwasher was successfully updated.'
        format.html { redirect_to(@dishwasher) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @dishwasher.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /dishwashers/1
  # DELETE /dishwashers/1.xml
  def destroy
    @dishwasher = Dishwasher.find(params[:id])
    @dishwasher.destroy

    respond_to do |format|
      format.html { redirect_to(dishwashers_url) }
      format.xml  { head :ok }
    end
  end
end
