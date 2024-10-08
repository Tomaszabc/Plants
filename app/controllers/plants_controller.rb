class PlantsController < ApplicationController
  before_action :set_plant, only: %i[show edit update destroy water]
  before_action :authenticate_user!

  # GET /plants or /plants.json
  def index
    @plants = current_user.plants
    @plants_needing_watering = @plants.select { |plant| plant.needs_watering? }

    respond_to do |format|
      format.html
      format.csv { send_data Plant.to_csv(@plants), filename: "plants-#{DateTime.now.strftime("%d%m%Y%H%M")}.csv" }
    end
  end

  # GET /plants/1 or /plants/1.json
  def show
    @pagy, @watering_logs = pagy(@plant.watering_logs.order(created_at: :desc), limit: 5)
  end

  # GET /plants/new
  def new
    @plant = Plant.new
  end

  # GET /plants/1/edit
  def edit
  end

  # POST /plants or /plants.json
  def create
    @plant = current_user.plants.build(plant_params)
    respond_to do |format|
      if @plant.save
        format.html { redirect_to plant_url(@plant), notice: "Plant was successfully created." }
        format.json { render :show, status: :created, location: @plant }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @plant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plants/1 or /plants/1.json
  def update
    respond_to do |format|
      if @plant.update(plant_params)
        format.html { redirect_to plant_url(@plant), notice: "Plant was successfully updated." }
        format.json { render :show, status: :ok, location: @plant }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @plant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plants/1 or /plants/1.json
  def destroy
    @plant.destroy

    respond_to do |format|
      format.html { redirect_to plants_url, notice: "Plant was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def water
    @plant.water
    redirect_back_or_to plant_path(@plant)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_plant
    @plant = Plant.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def plant_params
    params.require(:plant).permit(:name, :plant_image, :note, :light_requirements, :water_needs, :fertilization_needs, :toxicity, :date_acquired)
  end
end
