# frozen_string_literal: true

class LeaguesController < ApplicationController
  before_action :set_league, only: %i[show edit update destroy]
  before_action :set_football_association, only: %i[index new create]

  # GET /leagues
  # GET /leagues.json
  def index
    @leagues = policy_scope(League)
  end

  # GET /leagues/1
  # GET /leagues/1.json
  def show
  end

  # GET /leagues/new
  def new
    @league = @football_association.leagues.build
  end

  # GET /leagues/1/edit
  def edit
  end

  # POST /leagues
  # POST /leagues.json
  def create
    @league = @football_association.leagues.build(league_params)

    respond_to do |format|
      if @league.save
        format.html { redirect_to @league, notice: "League was successfully created." }
        format.json { render :show, status: :created, location: @league }
      else
        format.html { render :new }
        format.json { render json: @league.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leagues/1
  # PATCH/PUT /leagues/1.json
  def update
    respond_to do |format|
      if @league.update(league_params)
        format.html { redirect_to @league, notice: "League was successfully updated." }
        format.json { render :show, status: :ok, location: @league }
      else
        format.html { render :edit }
        format.json { render json: @league.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leagues/1
  # DELETE /leagues/1.json
  def destroy
    @league.destroy
    respond_to do |format|
      format.html do
        redirect_to football_association_leagues_url(@football_association),
          notice: "League was successfully destroyed."
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_league
    @league = League.find(params[:id])
    authorize @league
    @football_association = @league.football_association
    authorize @football_association
  end

  def set_football_association
    @football_association = FootballAssociation.find(params[:football_association_id])
    authorize @football_association
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def league_params
    params.require(:league).permit(:name, :level, :relegation)
  end
end
