class FridgeFreezersController < ApplicationController
  # GET /fridge_freezers
  # GET /fridge_freezers.xml
  def index
    @meta_title       = t('fridge_freezers.index.title') 
    @meta_description = t('fridge_freezers.index.description')
    @search           = FridgeFreezer.searchlogic(params[:search])
    @fridge_freezers  = @search.paginate(:page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @fridge_freezers }
    end
  end

  # GET /fridge_freezers/1
  # GET /fridge_freezers/1.xml
  def show
    @fridge_freezer = FridgeFreezer.find(params[:id])
    
    @meta_title       = "#{@fridge_freezer.product} #{@fridge_freezer.brand} #{@fridge_freezer.model}" 
    @meta_description = "#{@fridge_freezer.product} #{@fridge_freezer.brand} #{@fridge_freezer.model} #{FridgeFreezer.human_attribute_name(:consume)} #{@fridge_freezer.consume} (kWh/Ciclo)"
    @canonical        = url_for(@fridge_freezer)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @fridge_freezer }
    end
  end

  # GET /fridge_freezers/new
  # GET /fridge_freezers/new.xml
  def new
    @fridge_freezer = FridgeFreezer.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @fridge_freezer }
    end
  end

  # GET /fridge_freezers/1/edit
  def edit
    @fridge_freezer = FridgeFreezer.find(params[:id])
  end

  # POST /fridge_freezers
  # POST /fridge_freezers.xml
  def create
    @fridge_freezer = FridgeFreezer.new(params[:fridge_freezer])

    respond_to do |format|
      if @fridge_freezer.save
        flash[:notice] = 'FridgeFreezer was successfully created.'
        format.html { redirect_to(@fridge_freezer) }
        format.xml  { render :xml => @fridge_freezer, :status => :created, :location => @fridge_freezer }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @fridge_freezer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /fridge_freezers/1
  # PUT /fridge_freezers/1.xml
  def update
    @fridge_freezer = FridgeFreezer.find(params[:id])

    respond_to do |format|
      if @fridge_freezer.update_attributes(params[:fridge_freezer])
        flash[:notice] = 'FridgeFreezer was successfully updated.'
        format.html { redirect_to(@fridge_freezer) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @fridge_freezer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /fridge_freezers/1
  # DELETE /fridge_freezers/1.xml
  def destroy
    @fridge_freezer = FridgeFreezer.find(params[:id])
    @fridge_freezer.destroy

    respond_to do |format|
      format.html { redirect_to(fridge_freezers_url) }
      format.xml  { head :ok }
    end
  end
end
