class MembersController < ApplicationController
  before_action :set_squad, only: [:approve, :reject]
  before_action :set_user, only: [:approve, :reject]
  before_action :require_permission, only: [:approve, :reject]

  # PATCH/PUT /squads/1/approve/2
  # PATCH/PUT /squads/1/approve/2.json
  def approve(member)
    respond_to do |format|
      member = Member.new(squad: @squad, user: @user, membership: 'member')
      member.save(validate: false)
      #format.html { redirect_to @squad, notice: "#{user.name} was approved." }
    end
  end

  # PATCH/PUT /squads/1/reject/2
  # PATCH/PUT /squads/1/reject/2.json
  def reject(member)
    respond_to do |format|
      squad.user_ids.include?(@user).destroy
      #format.html { redirect_to @squad, notice: "#{user.name} was rejected." }
    end
  end

private

  # Use callbacks to share common setup or constraints between actions.
  def set_squad
    @squad = Squad.find(params[:id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Must be owner of a squad to edit or destroy it
  def require_permission
    if current_user.id != @squad.owner_id
      redirect_to squads_path, notice: 'You must be owner of a squad to do that action.'
    end
  end
end
