class BoostersController < ApplicationController
  before_action :set_booster, only: %i[ show edit update destroy ]

  # GET /boosters or /boosters.json
  def index
    @boosters = Booster.all
  end

  # GET /boosters/1 or /boosters/1.json
  def show
  end

  # GET /boosters/new
  def new
    @booster = Booster.new
  end

  # GET /boosters/1/edit
  def edit
  end

  # POST /boosters or /boosters.json
  def create
    @booster = Booster.new(booster_params)

    respond_to do |format|
      if @booster.save
        format.html { redirect_to booster_url(@booster), notice: "Booster was successfully created." }
        format.json { render :show, status: :created, location: @booster }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @booster.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /boosters/1 or /boosters/1.json
  def update
    respond_to do |format|
      if @booster.update(booster_params)
        format.html { redirect_to booster_url(@booster), notice: "Booster was successfully updated." }
        format.json { render :show, status: :ok, location: @booster }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @booster.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boosters/1 or /boosters/1.json
  def destroy
    @booster.destroy

    respond_to do |format|
      format.html { redirect_to boosters_url, notice: "Booster was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booster
      @booster = Booster.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def booster_params
      params.require(:booster).permit(:name, :price)
    end
end
