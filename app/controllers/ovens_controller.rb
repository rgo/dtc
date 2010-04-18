class OvensController < ApplicationController
  # GET /ovens
  # GET /ovens.xml
  def index
    @search = Oven.searchlogic(params[:search])
    @ovens = @search.paginate(:page => params[:page])
    
    @meta_title       = t('ovens.index.title') 
    @meta_description = t('ovens.index.description')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ovens }
    end
  end

  # GET /ovens/1
  # GET /ovens/1.xml
  def show
    @oven = Oven.find(params[:id])
    
    @meta_title       = "#{@oven.product} #{@oven.brand} #{@oven.model}" 
    @meta_description = "#{@oven.product} #{@oven.brand} #{@oven.model} #{Oven.human_attribute_name(:consume)} #{@oven.consume} (kWh/Ciclo)"
    @canonical        = url_for(@oven)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @oven }
    end
  end

  # GET /ovens/new
  # GET /ovens/new.xml
  def new
    @oven = Oven.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @oven }
    end
  end

  # GET /ovens/1/edit
  def edit
    @oven = Oven.find(params[:id])
  end

  # POST /ovens
  # POST /ovens.xml
  def create
    @oven = Oven.new(params[:oven])

    respond_to do |format|
      if @oven.save
        flash[:notice] = 'Oven was successfully created.'
        format.html { redirect_to(@oven) }
        format.xml  { render :xml => @oven, :status => :created, :location => @oven }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @oven.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ovens/1
  # PUT /ovens/1.xml
  def update
    @oven = Oven.find(params[:id])

    respond_to do |format|
      if @oven.update_attributes(params[:oven])
        flash[:notice] = 'Oven was successfully updated.'
        format.html { redirect_to(@oven) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @oven.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ovens/1
  # DELETE /ovens/1.xml
  def destroy
    @oven = Oven.find(params[:id])
    @oven.destroy

    respond_to do |format|
      format.html { redirect_to(ovens_url) }
      format.xml  { head :ok }
    end
  end
end
