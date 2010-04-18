class FreezersController < ApplicationController
  # GET /freezers
  # GET /freezers.xml
  def index
<<<<<<< HEAD:app/controllers/freezers_controller.rb
    @freezers = Freezer.all
    
    @meta_title       = t('freezers.index.title') 
    @meta_description = t('freezers.index.description')
=======
    @search = FridgeFreezer.searchlogic(params[:search])
    @fridge_freezers = @search.paginate(:page => params[:page])
    @meta_title = t('fridge_freezers.index.title')
    @meta_description = t('fridge_freezers.index.description')
>>>>>>> 7aacfc462bc4f85d5683789c3d28153428f2ec50:app/controllers/freezers_controller.rb

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @freezers }
    end
  end

  # GET /freezers/1
  # GET /freezers/1.xml
  def show
    @freezer = Freezer.find(params[:id])
    
    @meta_title       = "#{@freezer.product} #{@freezer.brand} #{@freezer.model}" 
    @meta_description = "#{@freezer.product} #{@freezer.brand} #{@freezer.model} #{Freezer.human_attribute_name(:consume)} #{@freezer.consume} (kWh/Ciclo)"
    @canonical        = url_for(@freezer)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @freezer }
    end
  end

  # GET /freezers/new
  # GET /freezers/new.xml
  def new
    @freezer = Freezer.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @freezer }
    end
  end

  # GET /freezers/1/edit
  def edit
    @freezer = Freezer.find(params[:id])
  end

  # POST /freezers
  # POST /freezers.xml
  def create
    @freezer = Freezer.new(params[:freezer])

    respond_to do |format|
      if @freezer.save
        flash[:notice] = 'Freezer was successfully created.'
        format.html { redirect_to(@freezer) }
        format.xml  { render :xml => @freezer, :status => :created, :location => @freezer }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @freezer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /freezers/1
  # PUT /freezers/1.xml
  def update
    @freezer = Freezer.find(params[:id])

    respond_to do |format|
      if @freezer.update_attributes(params[:freezer])
        flash[:notice] = 'Freezer was successfully updated.'
        format.html { redirect_to(@freezer) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @freezer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /freezers/1
  # DELETE /freezers/1.xml
  def destroy
    @freezer = Freezer.find(params[:id])
    @freezer.destroy

    respond_to do |format|
      format.html { redirect_to(freezers_url) }
      format.xml  { head :ok }
    end
  end
end
