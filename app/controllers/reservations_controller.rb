class ReservationsController < ApplicationController
  # GET /reservations
  # GET /reservations.xml
  def index
    @reservations = Reservation.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @reservations }
    end
  end

  # GET /reservations/1
  # GET /reservations/1.xml
  def show
    @reservation = Reservation.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @reservation }
    end
  end

  # GET /reservations/new
  # GET /reservations/new.xml
  def new
    @reservation = Reservation.new
    @reservation.showing = Showing.find(params[:showing])
    get_reservations
#    @rows = JSON.parse(@reservation.showing.room.chairs)
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @reservation }
    end
  end

  # GET /reservations/1/edit
  def edit
    @reservation = Reservation.find(params[:id])
    get_reservations
  end

  # POST /reservations
  # POST /reservations.xml
  def create
    @reservation = Reservation.new(params[:reservation])

    respond_to do |format|
      if @reservation.save
        format.html { redirect_to(@reservation, :notice => 'Rezerwacja została dodana.') }
        format.xml  { render :xml => @reservation, :status => :created, :location => @reservation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @reservation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /reservations/1
  # PUT /reservations/1.xml
  def update
    @reservation = Reservation.find(params[:id])

    respond_to do |format|
      if @reservation.update_attributes(params[:reservation])
        format.html { redirect_to(@reservation, :notice => 'Reservation was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @reservation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1
  # DELETE /reservations/1.xml
  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy

    respond_to do |format|
      format.html { redirect_to(reservations_url) }
      format.xml  { head :ok }
    end
  end
  
  protected
  def get_reservations
    @reservation.chairs ||= "[]"
    @rows = JSON.parse(@reservation.showing.room.chairs)
    @my_reservations = JSON.parse(@reservation.chairs);
    reserved_chairs = Reservation.where("showing_id = ?", @reservation.showing_id)
    @all_reserved = []
    reserved_chairs.each{|r| @all_reserved += JSON.parse(r.chairs) }
    @all_reserved -= @my_reservations
  end
end
