# frozen_string_literal: true

class FootballAssociationsController < ApplicationController
  before_action :set_football_association, only: %i[show edit update destroy]

  # GET /football_associations
  # GET /football_associations.json
  def index
    @football_associations = policy_scope(FootballAssociation)
  end

  # GET /football_associations/1
  # GET /football_associations/1.json
  def show
    # @clubs = @football_association.clubs
    @leagues = @football_association.leagues
  end

  # GET /football_associations/new
  def new
    @football_association = FootballAssociation.new
    authorize @football_association
  end

  # GET /football_associations/1/edit
  def edit; end

  # POST /football_associations
  # POST /football_associations.json
  def create
    @football_association = FootballAssociation.new(football_association_params)
    authorize @football_association

    respond_to do |format|
      if @football_association.save
        format.html do
          redirect_to @football_association,
                      notice: 'Football association was successfully created.'
        end
        format.json { render :show, status: :created, location: @football_association }
      else
        format.html { render :new }
        format.json do
          render json: @football_association.errors,
                 status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /football_associations/1
  # PATCH/PUT /football_associations/1.json
  def update
    respond_to do |format|
      if @football_association.update(football_association_params)
        format.html do
          redirect_to @football_association,
                      notice: 'Football association was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @football_association }
      else
        format.html { render :edit }
        format.json do
          render json: @football_association.errors,
                 status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /football_associations/1
  # DELETE /football_associations/1.json
  def destroy
    @football_association.destroy
    respond_to do |format|
      format.html do
        redirect_to football_associations_url,
                    notice: 'Football association was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_football_association
    @football_association = FootballAssociation.find(params[:id])
    authorize @football_association
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def football_association_params
    params
      .require(:football_association)
      .permit(policy(FootballAssociation)
    .permitted_attributes)
  end
end
