class WasherDryersController < ApplicationController
  # GET /washer_dryers
  # GET /washer_dryers.xml
  def index
    @washer_dryers = WasherDryer.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @washer_dryers }
    end
  end

  # GET /washer_dryers/1
  # GET /washer_dryers/1.xml
  def show
    @washer_dryer = WasherDryer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @washer_dryer }
    end
  end

  # GET /washer_dryers/new
  # GET /washer_dryers/new.xml
  def new
    @washer_dryer = WasherDryer.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @washer_dryer }
    end
  end

  # GET /washer_dryers/1/edit
  def edit
    @washer_dryer = WasherDryer.find(params[:id])
  end

  # POST /washer_dryers
  # POST /washer_dryers.xml
  def create
    @washer_dryer = WasherDryer.new(params[:washer_dryer])

    respond_to do |format|
      if @washer_dryer.save
        flash[:notice] = 'WasherDryer was successfully created.'
        format.html { redirect_to(@washer_dryer) }
        format.xml  { render :xml => @washer_dryer, :status => :created, :location => @washer_dryer }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @washer_dryer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /washer_dryers/1
  # PUT /washer_dryers/1.xml
  def update
    @washer_dryer = WasherDryer.find(params[:id])

    respond_to do |format|
      if @washer_dryer.update_attributes(params[:washer_dryer])
        flash[:notice] = 'WasherDryer was successfully updated.'
        format.html { redirect_to(@washer_dryer) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @washer_dryer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /washer_dryers/1
  # DELETE /washer_dryers/1.xml
  def destroy
    @washer_dryer = WasherDryer.find(params[:id])
    @washer_dryer.destroy

    respond_to do |format|
      format.html { redirect_to(washer_dryers_url) }
      format.xml  { head :ok }
    end
  end
end
