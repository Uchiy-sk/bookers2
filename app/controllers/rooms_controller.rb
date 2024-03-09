class RoomsController < ApplicationController
  def create
    @room = Room.create
    @current_entry = Entry.create(room_id: @room.id, user_id: current_user.id)
    @subject_entry = Entry.create(entry_params.merge(room_id: @room.id))
    binding.pry
    redirect_to room_path(@room.id)
  end

  def show
    @room = Room.find(params[:id])
    # 相互フォローのEntryがあるか判定
    if Entry.where(user_id: current_user.id, room_id: @room.id).present?
      @messages = @room.messages
      @message = Message.new
      @entries = @room.entries
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def entry_params
    params[:room].require(:entry).permit(:user_id, :room_id)
  end
end
