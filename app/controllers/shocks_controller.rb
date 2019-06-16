class ShocksController < ApplicationController
  before_action :set_shock, only: [:show, :update, :destroy]
   skip_before_action :authenticate_request
  # GET /shocks
  def index
    @shocks = Shock.all

    render json: @shocks
  end

  # GET /shocks/1
  def show
    render json: @shock
  end

  # POST /shocks
  def create
    @shock = Shock.new(shock_params)

    if @shock.save
      render json: @shock, status: :created, location: @shock
    else
      render json: @shock.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /shocks/1
  def update
    if @shock.update(shock_params)
      render json: @shock
    else
      render json: @shock.errors, status: :unprocessable_entity
    end
  end

  # DELETE /shocks/1
  def destroy
    @shock.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shock
      @shock = Shock.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def shock_params
      params.require(:shock).permit(:time, :energy, :code_id)
    end
end
