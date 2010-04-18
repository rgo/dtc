class WashingMachinesController < ApplicationController
  # GET /washing_machines
  # GET /washing_machines.xml
  def index
    @search = WashingMachine.searchlogic(params[:search])
    @washing_machines = @search.paginate(:page => params[:page])
    
    @meta_title       = t('washing_machines.index.title') 
    @meta_description = t('washing_machines.index.description')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @washing_machines }
    end
  end

  # GET /washing_machines/1
  # GET /washing_machines/1.xml
  def show
    @washing_machine = WashingMachine.find(params[:id])
    
    @meta_title       = "#{@washing_machine.product} #{@washing_machine.brand} #{@washing_machine.model}" 
    @meta_description = "#{@washing_machine.product} #{@washing_machine.brand} #{@washing_machine.model} #{WashingMachine.human_attribute_name(:consume)} #{@washing_machine.consume} (kWh/Ciclo)"
    @canonical        = url_for(@washing_machine)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @washing_machine }
    end
  end

  # GET /washing_machines/new
  # GET /washing_machines/new.xml
  def new
    @washing_machine = WashingMachine.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @washing_machine }
    end
  end

  # GET /washing_machines/1/edit
  def edit
    @washing_machine = WashingMachine.find(params[:id])
  end

  # POST /washing_machines
  # POST /washing_machines.xml
  def create
    @washing_machine = WashingMachine.new(params[:washing_machine])

    respond_to do |format|
      if @washing_machine.save
        flash[:notice] = 'WashingMachine was successfully created.'
        format.html { redirect_to(@washing_machine) }
        format.xml  { render :xml => @washing_machine, :status => :created, :location => @washing_machine }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @washing_machine.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /washing_machines/1
  # PUT /washing_machines/1.xml
  def update
    @washing_machine = WashingMachine.find(params[:id])

    respond_to do |format|
      if @washing_machine.update_attributes(params[:washing_machine])
        flash[:notice] = 'WashingMachine was successfully updated.'
        format.html { redirect_to(@washing_machine) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @washing_machine.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /washing_machines/1
  # DELETE /washing_machines/1.xml
  def destroy
    @washing_machine = WashingMachine.find(params[:id])
    @washing_machine.destroy

    respond_to do |format|
      format.html { redirect_to(washing_machines_url) }
      format.xml  { head :ok }
    end
  end
end
