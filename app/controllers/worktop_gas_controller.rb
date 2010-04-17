class WorktopGasController < ApplicationController
  # GET /worktop_gas
  # GET /worktop_gas.xml
  def index
    @worktop_gas = WorktopGa.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @worktop_gas }
    end
  end

  # GET /worktop_gas/1
  # GET /worktop_gas/1.xml
  def show
    @worktop_ga = WorktopGa.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @worktop_ga }
    end
  end

  # GET /worktop_gas/new
  # GET /worktop_gas/new.xml
  def new
    @worktop_ga = WorktopGa.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @worktop_ga }
    end
  end

  # GET /worktop_gas/1/edit
  def edit
    @worktop_ga = WorktopGa.find(params[:id])
  end

  # POST /worktop_gas
  # POST /worktop_gas.xml
  def create
    @worktop_ga = WorktopGa.new(params[:worktop_ga])

    respond_to do |format|
      if @worktop_ga.save
        flash[:notice] = 'WorktopGa was successfully created.'
        format.html { redirect_to(@worktop_ga) }
        format.xml  { render :xml => @worktop_ga, :status => :created, :location => @worktop_ga }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @worktop_ga.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /worktop_gas/1
  # PUT /worktop_gas/1.xml
  def update
    @worktop_ga = WorktopGa.find(params[:id])

    respond_to do |format|
      if @worktop_ga.update_attributes(params[:worktop_ga])
        flash[:notice] = 'WorktopGa was successfully updated.'
        format.html { redirect_to(@worktop_ga) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @worktop_ga.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /worktop_gas/1
  # DELETE /worktop_gas/1.xml
  def destroy
    @worktop_ga = WorktopGa.find(params[:id])
    @worktop_ga.destroy

    respond_to do |format|
      format.html { redirect_to(worktop_gas_url) }
      format.xml  { head :ok }
    end
  end
end
