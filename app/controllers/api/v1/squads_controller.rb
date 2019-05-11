class Api::V1::SquadsController < Api::V1::BaseController
  before_action :require_permission, only: [:edit, :update, :destroy]

  def index
    respond_with Squad.all
  end

  def create
    respond_with :api, :v1, Squad.create(squad_params)
  end

  def destroy
    respond_with Squad.destroy(params[:id])
  end

  def update
    squad = Squad.find(params["id"])
    squad.update_attributes(squad_params)
    respond_with squad, json: squad
  end

private

  def squad_params
    params.require(:squad).permit(:id, :name, :sport, :owner_id)
  end

  # Must be owner of a squad to edit or destroy it
  def require_permission
    if current_user.id != @squad.owner_id
      redirect_to squads_path, notice: 'You must be owner of a squad to do that action.'
    end
  end
end
