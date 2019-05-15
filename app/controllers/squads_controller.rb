class SquadsController < ApplicationController
  before_action :set_squad, only: [:show, :edit, :join, :update, :destroy]
  before_action :require_permission, only: [:edit, :update, :destroy]

  # GET /squads
  # GET /squads.json
  def index
    @squads = Squad.all
  end

  # GET /squads/1
  # GET /squads/1.json
  def show
    @members = Member.where(squad: @squad)
  end

  # GET /squads/new
  def new
    @squad = Squad.new
  end

  # GET /squads/1/edit
  def edit
  end

  # GET /squads/1/join
  def join
    create_membership_request
  end

  # POST /squads
  # POST /squads.json
  def create
    @squad = Squad.new(squad_params)

    respond_to do |format|
      if @squad.save
        format.html { redirect_to @squad, notice: 'Squad was successfully created.' }
        format.json { render :show, status: :created, location: @squad }

        # create member with membership info to the squad then save
        create_membership
      else
        format.html { render :new }
        format.json { render json: @squad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /squads/1
  # PATCH/PUT /squads/1.json
  def update
    respond_to do |format|
      if @squad.update(squad_params)
        format.html { redirect_to @squad, notice: 'Squad was successfully updated.' }
        format.json { render :show, status: :ok, location: @squad }
      else
        format.html { render :edit }
        format.json { render json: @squad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /squads/1
  # DELETE /squads/1.json
  def destroy
    @squad.destroy
    respond_to do |format|
      format.html { redirect_to squads_url, notice: 'Squad was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # reset_db_path
  def reset_db
    if current_user.id == '1'
      logger.info "Executing reset_db, we are user_id 1"
      [User, Member, Squad].each { |model| model.truncate! }
      Rails.application.load_seed
    elsif
      logger.info "Attempted to reset_db, not user_id 1"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_squad
      @squad = Squad.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def squad_params
      params.require(:squad).permit(:name, :sport, :owner_id)
    end

    # Must be owner of a squad to edit or destroy it
    def require_permission
      if current_user.id != @squad.owner_id
        redirect_to squads_path, notice: 'You must be owner of a squad to do that action.'
      end
    end

    # Create Member row with membership information and save it
    def create_membership
      member = Member.new(squad: @squad, user: current_user, membership: 'owner')
      member.save(validate: false)
    end

    # Create Member row with membership request information and save it
    def create_membership_request
      member = Member.new(squad: @squad, user: current_user, membership: 'request')
      member.save(validate: false)
    end
end
