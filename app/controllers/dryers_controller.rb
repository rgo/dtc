class DryersController < ApplicationController
  # GET /dryers
  # GET /dryers.xml
  def index
    @search = Dryer.searchlogic(params[:search])
    @dryers = @search.paginate(:page => params[:page])
    @meta_title = t('dryers.index.title')
    @meta_description = t('dryers.index.description')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @dryers }
    end
  end

  # GET /dryers/1
  # GET /dryers/1.xml
  def show
    @dryer = Dryer.find(params[:id])
    
    @meta_title       = "#{@dryer.product} #{@dryer.brand} #{@dryer.model}" 
    @meta_description = "#{@dryer.product} #{@dryer.brand} #{@dryer.model} #{Dryer.human_attribute_name(:consume)} #{@dryer.consume} (kWh/Ciclo)"
    @canonical        = url_for(@dryer)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @dryer }
    end
  end

  # GET /dryers/new
  # GET /dryers/new.xml
  def new
    @dryer = Dryer.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @dryer }
    end
  end

  # GET /dryers/1/edit
  def edit
    @dryer = Dryer.find(params[:id])
  end

  # POST /dryers
  # POST /dryers.xml
  def create
    @dryer = Dryer.new(params[:dryer])

    respond_to do |format|
      if @dryer.save
        flash[:notice] = 'Dryer was successfully created.'
        format.html { redirect_to(@dryer) }
        format.xml  { render :xml => @dryer, :status => :created, :location => @dryer }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @dryer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /dryers/1
  # PUT /dryers/1.xml
  def update
    @dryer = Dryer.find(params[:id])

    respond_to do |format|
      if @dryer.update_attributes(params[:dryer])
        flash[:notice] = 'Dryer was successfully updated.'
        format.html { redirect_to(@dryer) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @dryer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /dryers/1
  # DELETE /dryers/1.xml
  def destroy
    @dryer = Dryer.find(params[:id])
    @dryer.destroy

    respond_to do |format|
      format.html { redirect_to(dryers_url) }
      format.xml  { head :ok }
    end
  end
end
