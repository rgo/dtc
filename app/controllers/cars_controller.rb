class CarsController < ApplicationController
  # GET /cars
  # GET /cars.xml
  def index
    @search     = Car.searchlogic(params[:search])
    @cars       = @search.paginate(:page => params[:page])
    @meta_title = t('cars.index.title') 
    @meta_description = t('cars.index.description')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cars }
    end
  end

  # GET /cars/1
  # GET /cars/1.xml
  def show
    @car = Car.find(params[:id])
    
    @meta_title       = "#{@car.brand} #{@car.model}" 
    @meta_description = "#{@car.brand} #{@car.model} #{@car.finish} #{Car.human_attribute_name(:consume)}: #{@car.consume} l/100Km. #{Car.human_attribute_name(:emissions)} #{@car.emissions} gCo2/Km."
    @canonical        = url_for(@car)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @car }
    end
  end

  # GET /cars/new
  # GET /cars/new.xml
  def new
    @car = Car.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @car }
    end
  end

  # GET /cars/1/edit
  def edit
    @car = Car.find(params[:id])
  end

  # POST /cars
  # POST /cars.xml
  def create
    @car = Car.new(params[:car])

    respond_to do |format|
      if @car.save
        flash[:notice] = 'Car was successfully created.'
        format.html { redirect_to(@car) }
        format.xml  { render :xml => @car, :status => :created, :location => @car }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @car.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cars/1
  # PUT /cars/1.xml
  def update
    @car = Car.find(params[:id])

    respond_to do |format|
      if @car.update_attributes(params[:car])
        flash[:notice] = 'Car was successfully updated.'
        format.html { redirect_to(@car) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @car.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cars/1
  # DELETE /cars/1.xml
  def destroy
    @car = Car.find(params[:id])
    @car.destroy

    respond_to do |format|
      format.html { redirect_to(cars_url) }
      format.xml  { head :ok }
    end
  end
end
