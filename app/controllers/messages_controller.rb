class MessagesController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    @room_id = params[:message][:room_id]
    if Entry.where(user_id: current_user.id, room_id: @room_id).present?
      @message = Message.create(message_params.merge(user_id: current_user.id))
      # redirect_to room_path(@room_id)
    else
      # redirect_back(fallback_location: root_path)
    end
  end
  
  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    # redirect_back(fallback_location: root_path)
  end
  
  private

  def message_params
    params.require(:message).permit(:user_id, :room_id, :message)
  end
end
