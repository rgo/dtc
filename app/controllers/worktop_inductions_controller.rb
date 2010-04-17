class WorktopInductionsController < ApplicationController
  # GET /worktop_inductions
  # GET /worktop_inductions.xml
  def index
    @worktop_inductions = WorktopInduction.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @worktop_inductions }
    end
  end

  # GET /worktop_inductions/1
  # GET /worktop_inductions/1.xml
  def show
    @worktop_induction = WorktopInduction.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @worktop_induction }
    end
  end

  # GET /worktop_inductions/new
  # GET /worktop_inductions/new.xml
  def new
    @worktop_induction = WorktopInduction.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @worktop_induction }
    end
  end

  # GET /worktop_inductions/1/edit
  def edit
    @worktop_induction = WorktopInduction.find(params[:id])
  end

  # POST /worktop_inductions
  # POST /worktop_inductions.xml
  def create
    @worktop_induction = WorktopInduction.new(params[:worktop_induction])

    respond_to do |format|
      if @worktop_induction.save
        flash[:notice] = 'WorktopInduction was successfully created.'
        format.html { redirect_to(@worktop_induction) }
        format.xml  { render :xml => @worktop_induction, :status => :created, :location => @worktop_induction }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @worktop_induction.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /worktop_inductions/1
  # PUT /worktop_inductions/1.xml
  def update
    @worktop_induction = WorktopInduction.find(params[:id])

    respond_to do |format|
      if @worktop_induction.update_attributes(params[:worktop_induction])
        flash[:notice] = 'WorktopInduction was successfully updated.'
        format.html { redirect_to(@worktop_induction) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @worktop_induction.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /worktop_inductions/1
  # DELETE /worktop_inductions/1.xml
  def destroy
    @worktop_induction = WorktopInduction.find(params[:id])
    @worktop_induction.destroy

    respond_to do |format|
      format.html { redirect_to(worktop_inductions_url) }
      format.xml  { head :ok }
    end
  end
end
