class MessagesController < ApplicationController
  before_action :find_room

  def new
    @message = @chatroom.messages.new
  end

  def create
    message = @chatroom.messages.new(message_params)
    if message.save
      ActionCable.server.broadcast 'messages',
        message: message.content,
        user: message.username
      head :ok
    else
      redirect_to chatrooms_path
    end
  end

  private

  def find_room
    @chatroom = Chatroom.find(params[:chatroom_id])
  end

  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id)
  end
end