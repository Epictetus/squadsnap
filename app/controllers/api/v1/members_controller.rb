class Api::V1::MembersController < Api::V1::BaseController
  before_action :set_squad, only: [:approve, :reject, :remove, :demote]
  before_action :set_member, only: [:approve, :reject, :remove, :demote]
  before_action :require_permission, only: [:approve, :reject, :remove, :demote]

  # PATCH/PUT /squads/1/approve/2
  # PATCH/PUT /squads/1/approve/2.json
  def approve()
    respond_to do |format|
      @member = @squad.members.find(params[:id])
      @member.membership = 'member'
      if @member.save
        # Tell the RequestMembershipMailer to send an email after saving membership status
        RequestMembershipMailer.membership(member: @member).deliver

        # Give notice of user approval and redirect
        format.html { redirect_to api_v1_squad_url(@squad), notice: 'Approved user access to squad.' }
        format.json { render :show, status: :ok, location: @squad }
      else
        format.html { render :show }
        format.json { render json: @squad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /squads/1/reject/2
  # PATCH/PUT /squads/1/reject/2.json
  def reject()
    respond_to do |format|
      @member = @squad.members.find(params[:id])

      if @member.destroy
        # Tell the RequestMembershipMailer to send an email after saving membership status
        RequestMembershipMailer.membership(member: @member).deliver

        format.html { redirect_to api_v1_squad_url(@squad), notice: 'Rejected user access to squad.' }
        format.json { render :show, status: :ok, location: @squad }
      else
        format.html { render :show }
        format.json { render json: @squad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /squads/1/remove/2
  # PATCH/PUT /squads/1/remove/2.json
  def remove()
    respond_to do |format|
      @member = @squad.members.find(params[:id])

      # TODO: this is currently being handled by not showing the remove button for owner, however we will need to actually not allow it here.

      #if (@member.membership == 'owner')
      #  format.html { redirect_to @squad, notice: 'Cannot remove the squad owner.' }
      #  format.json { render :show, status: :ok, location: @squad }
      #  return
      #end

      if @member.destroy
        format.html { redirect_to api_v1_squad_url(@squad), notice: 'Removed user from the squad.' }
        format.json { render :show, status: :ok, location: @squad }
      else
        format.html { render :show }
        format.json { render json: @squad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /squads/1/demote/2
  # PATCH/PUT /squads/1/demote/2.json
  def demote()
    respond_to do |format|
      @member = @squad.members.find(params[:id])

      @member.membership = 'request'
      if @member.save
        # Give notice of user approval and redirect
        format.html { redirect_to api_v1_squad_url(@squad), notice: 'Demoted user.' }
        format.json { render :show, status: :ok, location: @squad }
      else
        format.html { render :show }
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
      redirect_to api_v1_squads_path, notice: 'You must be owner of a squad to do that action.'
    end
  end
end
