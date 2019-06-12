class RhythmsController < ApplicationController
  before_action :set_rhythm, only: [:show, :update, :destroy]

  # GET /rhythms
  def index
    @rhythms = Rhythm.all

    render json: @rhythms
  end

  # GET /rhythms/1
  def show
    render json: @rhythm
  end

  # POST /rhythms
  def create
    @rhythm = Rhythm.new(rhythm_params)

    if @rhythm.save
      render json: @rhythm, status: :created, location: @rhythm
    else
      render json: @rhythm.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /rhythms/1
  def update
    if @rhythm.update(rhythm_params)
      render json: @rhythm
    else
      render json: @rhythm.errors, status: :unprocessable_entity
    end
  end

  # DELETE /rhythms/1
  def destroy
    @rhythm.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rhythm
      @rhythm = Rhythm.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def rhythm_params
      params.fetch(:rhythm, {})
    end
end
