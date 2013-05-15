class GranteesController < ApplicationController
  # GET /grantees
  # GET /grantees.json
  def index
    @grantees = Grantee.all
    

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @grantees }
    end
  end

  # GET /grantees/1
  # GET /grantees/1.json
  def show
    @grantee = Grantee.find(params[:id])


    @staffs = @grantee.staffs
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @grantee }
    end
  end

  # GET /grantees/new
  # GET /grantees/new.json
  def new
    @grantee = Grantee.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @grantee }
    end
  end

  # GET /grantees/1/edit
  def edit
    @grantee = Grantee.find(params[:id])
  end

  # POST /grantees
  # POST /grantees.json
  def create
    @grantee = Grantee.new(params[:grantee])

    respond_to do |format|
      if @grantee.save
        format.html { redirect_to @grantee, notice: 'Grantee was successfully created.' }
        format.json { render json: @grantee, status: :created, location: @grantee }
      else
        format.html { render action: "new" }
        format.json { render json: @grantee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /grantees/1
  # PUT /grantees/1.json
  def update
    @grantee = Grantee.find(params[:id])

    respond_to do |format|
      if @grantee.update_attributes(params[:grantee])
        format.html { redirect_to @grantee, notice: 'Grantee was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @grantee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grantees/1
  # DELETE /grantees/1.json
  def destroy
    @grantee = Grantee.find(params[:id])
    @grantee.destroy

    respond_to do |format|
      format.html { redirect_to grantees_url }
      format.json { head :no_content }
    end
  end
end
