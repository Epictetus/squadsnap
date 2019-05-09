class MembersController < ApplicationController
  before_action :set_squad, only: [:approve, :reject]
  before_action :set_member, only: [:approve, :reject]
  before_action :require_permission, only: [:approve, :reject]

  # PATCH/PUT /squads/1/approve/2
  # PATCH/PUT /squads/1/approve/2.json
  def approve()
    respond_to do |format|
      @member = @squad.members.find(params[:id])
      @member.membership = 'member'
      if @member.save
        format.html { redirect_to @squad, notice: 'Approved user access to squad.' }
        format.json { render :show, status: :ok, location: @squad }
      else
        format.html { render :edit }
        format.json { render json: @squad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /squads/1/reject/2
  # PATCH/PUT /squads/1/reject/2.json
  def reject()
    respond_to do |format|
      @member = @squad.members.find(params[:id])
      #@member.membership = 'rejected'
      if @member.destroy
        format.html { redirect_to @squad, notice: 'Rejected user access to squad.' }
        format.json { render :show, status: :ok, location: @squad }
      else
        format.html { render :edit }
        format.json { render json: @squad.errors, status: :unprocessable_entity }
      end
    end
  end

private

  # Use callbacks to share common setup or constraints between actions.
  def set_squad
    @squad = Squad.find(params[:squad_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_member
    @member = Member.find(params[:id])
  end

  # Must be owner of a squad to edit or destroy it
  def require_permission
    if current_user.id != @squad.owner_id
      redirect_to squads_path, notice: 'You must be owner of a squad to do that action.'
    end
  end
end
