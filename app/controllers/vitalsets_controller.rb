class VitalsetsController < ApplicationController
  before_action :set_vitalset, only: [:show, :update, :destroy]

  # GET /vitalsets
  def index
    @vitalsets = Vitalset.all

    render json: @vitalsets
  end

  # GET /vitalsets/1
  def show
    render json: @vitalset
  end

  # POST /vitalsets
  def create
    @vitalset = Vitalset.new(vitalset_params)

    if @vitalset.save
      render json: @vitalset, status: :created, location: @vitalset
    else
      render json: @vitalset.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /vitalsets/1
  def update
    if @vitalset.update(vitalset_params)
      render json: @vitalset
    else
      render json: @vitalset.errors, status: :unprocessable_entity
    end
  end

  # DELETE /vitalsets/1
  def destroy
    @vitalset.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vitalset
      @vitalset = Vitalset.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def vitalset_params
      params.fetch(:vitalset, {})
    end
end
