# frozen_string_literal: true

class ClubsController < ApplicationController
  before_action :set_club, only: %i[show edit update destroy]
  before_action :set_football_association, only: %i[index new create]

  # GET /clubs
  # GET /clubs.json
  def index
    @clubs = policy_scope(Club)
    # redirect_to if @clubs.blank?
  end

  # GET /clubs/1
  # GET /clubs/1.json
  def show
  end

  # GET /clubs/new
  def new
    @club = @football_association.clubs.build
  end

  # GET /clubs/1/edit
  def edit
  end

  # POST /clubs
  # POST /clubs.json
  def create
    @club = Club.new(club_params)

    respond_to do |format|
      if @club.save
        format.html { redirect_to @club, notice: "Club was successfully created." }
        format.json { render :show, status: :created, location: @club }
      else
        format.html { render :new }
        format.json { render json: @club.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clubs/1
  # PATCH/PUT /clubs/1.json
  def update
    respond_to do |format|
      if @club.update(club_params)
        format.html { redirect_to @club, notice: "Club was successfully updated." }
        format.json { render :show, status: :ok, location: @club }
      else
        format.html { render :edit }
        format.json { render json: @club.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clubs/1
  # DELETE /clubs/1.json
  def destroy
    @club.destroy
    respond_to do |format|
      format.html do
        redirect_to football_association_clubs_url(@football_association),
          notice: "Club was successfully destroyed."
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_club
    @club = Club.find(params[:id])
    authorize @club
    @football_association = @club.football_association
    authorize @football_association
  end

  def set_football_association
    @football_association = FootballAssociation.find(params[:football_association_id])
    authorize @football_association
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def club_params
    params.require(:club).permit(policy(@club).permitted_attributes)
  end
end
