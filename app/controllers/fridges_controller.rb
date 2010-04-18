class FridgesController < ApplicationController
  # GET /fridges
  # GET /fridges.xml
  def index
    @fridges = Fridge.all
    
    @meta_title       = t('fridges.index.title') 
    @meta_description = t('fridges.index.description')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @fridges }
    end
  end

  # GET /fridges/1
  # GET /fridges/1.xml
  def show
    @fridge = Fridge.find(params[:id])
    
    @meta_title       = "#{@fridge.product} #{@fridge.brand} #{@fridge.model}" 
    @meta_description = "#{@fridge.product} #{@fridge.brand} #{@fridge.model} #{Fridge.human_attribute_name(:consume)} #{@fridge.consume} (kWh/Ciclo)"
    @canonical        = url_for(@fridge)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @fridge }
    end
  end

  # GET /fridges/new
  # GET /fridges/new.xml
  def new
    @fridge = Fridge.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @fridge }
    end
  end

  # GET /fridges/1/edit
  def edit
    @fridge = Fridge.find(params[:id])
  end

  # POST /fridges
  # POST /fridges.xml
  def create
    @fridge = Fridge.new(params[:fridge])

    respond_to do |format|
      if @fridge.save
        flash[:notice] = 'Fridge was successfully created.'
        format.html { redirect_to(@fridge) }
        format.xml  { render :xml => @fridge, :status => :created, :location => @fridge }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @fridge.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /fridges/1
  # PUT /fridges/1.xml
  def update
    @fridge = Fridge.find(params[:id])

    respond_to do |format|
      if @fridge.update_attributes(params[:fridge])
        flash[:notice] = 'Fridge was successfully updated.'
        format.html { redirect_to(@fridge) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @fridge.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /fridges/1
  # DELETE /fridges/1.xml
  def destroy
    @fridge = Fridge.find(params[:id])
    @fridge.destroy

    respond_to do |format|
      format.html { redirect_to(fridges_url) }
      format.xml  { head :ok }
    end
  end
end
