class ReservationsController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html
  
  # GET /reservations
  # GET /reservations.json
  def index
    @reservations = Reservation.user_reservations(current_user)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reservations }
    end
  end

  # GET /reservations/1
  # GET /reservations/1.json
  def show
    @reservation = Reservation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @reservation }
    end
  end

  # GET /reservations/new
  # GET /reservations/new.json
  def new
    @reservation = Reservation.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @reservation }
    end
  end

  # GET /reservations/1/edit
  def edit
    @reservation = Reservation.find(params[:id])
  end

  # POST /reservations
  # POST /reservations.json
  def create
    format_dates
    @reservation = Reservation.new(params[:reservation])

    if @reservation.save
      # Deliver the signup_email
      Notifier.reservation_email(current_user,@reservation[:room_id]).deliver
      
      flash[:notice] = 'Reservation was successfully created.'
      respond_with(@reservation)
    else
      flash[:error] = @reservation.errors[:base].to_sentence
      redirect_to :back
      @reservation.errors.clear
    end
  end

  # PUT /reservations/1
  # PUT /reservations/1.json
  def update
    @reservation = Reservation.find(params[:id])

    respond_to do |format|
      if @reservation.update_attributes(params[:reservation])
        format.html { redirect_to @reservation, notice: 'Reservation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1
  # DELETE /reservations/1.json
  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    flash[:notice] = 'Reservation was successfully cancelled.'
    Notifier.cancellation_email(current_user).deliver
    respond_to do |format|
      format.html { redirect_to reservations_url }
      format.json { head :no_content }
    end
  end
  
  private
  
  def format_dates
    params[:reservation][:check_in] = (Date.strptime(params[:reservation][:check_in], '%m/%d/%Y')).to_date
    params[:reservation][:check_out] = (Date.strptime(params[:reservation][:check_out], '%m/%d/%Y')).to_date
  end
  
end
