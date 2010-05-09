class ShowingsController < ApplicationController
  # GET /showings
  # GET /showings.xml
  def index
    @showings = Showing.today
    @grouped_showings = Showing.group_by_films
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @showings }
    end
  end

  # GET /showings/1
  # GET /showings/1.xml
  def show
    @showing = Showing.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @showing }
    end
  end

  # GET /showings/new
  # GET /showings/new.xml
  def new
    @showing = Showing.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @showing }
    end
  end

  # GET /showings/1/edit
  def edit
    @showing = Showing.find(params[:id])
  end

  # POST /showings
  # POST /showings.xml
  def create
    @showing = Showing.new(params[:showing])

    respond_to do |format|
      if @showing.save
        format.html { redirect_to(@showing, :notice => 'Showing was successfully created.') }
        format.xml  { render :xml => @showing, :status => :created, :location => @showing }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @showing.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /showings/1
  # PUT /showings/1.xml
  def update
    @showing = Showing.find(params[:id])

    respond_to do |format|
      if @showing.update_attributes(params[:showing])
        format.html { redirect_to(@showing, :notice => 'Showing was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @showing.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /showings/1
  # DELETE /showings/1.xml
  def destroy
    @showing = Showing.find(params[:id])
    @showing.destroy

    respond_to do |format|
      format.html { redirect_to(showings_url) }
      format.xml  { head :ok }
    end
  end

  def day_showing
    @showings =  Showing.where("date = ?", params[:day]).group_by{|i| i.film_id}
  end

  def film
    @showing = Showing.active.where("film_id = ?", params[:film])
  end

  def room
    @showing = Showing.active.where("room_id = ?", params[:room])
  end

  def week
    @showing =  Showing.where("date = ?", params[:day]).group_by{|i| i.film_id}
  end
end
