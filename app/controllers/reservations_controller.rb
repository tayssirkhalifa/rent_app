class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[ show edit update destroy ]
skip_before_action :verify_authenticity_token, :only => [:create,:reservations]

  # GET /reservations or /reservations.json
  def index
    @reservations = Reservation.all
    @i=0
    @listmatricule=[]
    @listphoto=[]
    @listlis=[]

   @reservations.each do|c|
   @mat=Car.find(c.car_id)
  @listmatricule.push(@mat.photo)
  @listphoto.push(@mat.Manufacturer)
  @listlis.push(@mat.License_plate)
  
end
  end

  # GET /reservations/1 or /reservations/1.json
  def show
  end

  # GET /reservations/new
  def new

    @reservation = Reservation.new


    @users = User.all

    @list=[]
   @users.each do|u|

  @list.push(u.id)


  @cars = Car.all

    @listt=[]
   @cars.each do|c|

  @listt.push(c.id)
  end
  end 
end

  # GET /reservations/1/edit
  def edit
    @users = User.all

    @list=[]
   @users.each do|u|

  @list.push(u.id)


  @cars = Car.all

    @listt=[]
   @cars.each do|c|

  @listt.push(c.id)
  end
  end 
  end

  # POST /reservations or /reservations.json
  def create
    @reservation = Reservation.new(reservation_params)
    @users = User.all
    @cars = Car.all
@users.map{|c| [c.first_name,c.id]}
@cars.map{|c| [c.Manufacturer,c.id]}
    respond_to do |format|
      if @reservation.save
        format.html { redirect_to @reservation, notice: "Reservation was successfully created." }
        format.json { render :show, status: :created, location: @reservation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservations/1 or /reservations/1.json
  def update
    respond_to do |format|
      @users = User.all
    @cars = Car.all
@users.map{|c| [c.first_name,c.id]}
@cars.map{|c| [c.Manufacturer,c.id]}
      if @reservation.update(reservation_params)
        format.html { redirect_to @reservation, notice: "Reservation was successfully updated." }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1 or /reservations/1.json
  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to reservations_url, notice: "Reservation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reservation_params
      params.require(:reservation).permit(:start_date, :end_date, :user_id, :car_id)
    end
end
