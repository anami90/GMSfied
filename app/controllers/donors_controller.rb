class DonorsController < ApplicationController
  
  # GET /donors
  # GET /donors.json
  def index
    #@donors = Donor.all

    @donors = Donor.paginate(:page => params[:page], :per_page => 30)

    @search = Donor.search(params[:q])
      @donors = @search.result

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @donors }
      format.xlsx {
    xlsx_package = Donor.to_xlsx
    begin
      send_data xlsx_package.to_stream.read, :filename => 'donors.xlsx', :type=> "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" 
    ensure
      
    end
 }   
    end
  end

  # GET /donors/1
  # GET /donors/1.json
  def show
    @donor = Donor.find(params[:id])

      @projects = @donor.projects
      
      respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @donor }
    end
  end

  # GET /donors/new
  # GET /donors/new.json
  def new
    @donor = Donor.new

    @donor.balance = 0
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @donor }
    end
  end

  # GET /donors/1/edit
  def edit
    @donor = Donor.find(params[:id])

    @total =0
      @donor.projects.each  do |x|
       @total = @total+x.amount 
      end
      @donor.balance = @donor.funding - @total
 
  end

  # POST /donors
  # POST /donors.json
  def create
    @donor = Donor.new(params[:donor])

    respond_to do |format|
      if @donor.save
        format.html { redirect_to @donor, notice: 'Donor was successfully created.' }
        format.json { render json: @donor, status: :created, location: @donor }
      else
        format.html { render action: "new" }
        format.json { render json: @donor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /donors/1
  # PUT /donors/1.json
  def update
    @donor = Donor.find(params[:id])

    respond_to do |format|
      if @donor.update_attributes(params[:donor])
        format.html { redirect_to @donor, notice: 'Donor was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @donor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /donors/1
  # DELETE /donors/1.json
  def destroy
    @donor = Donor.find(params[:id])
    @donor.destroy

    respond_to do |format|
      format.html { redirect_to donors_url }
      format.json { head :no_content }
    end
  end
end
