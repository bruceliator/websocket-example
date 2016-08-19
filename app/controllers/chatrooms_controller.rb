class ChatroomsController < ApplicationController
  def index
    @chatrooms = Chatroom.all
    @chatroom = Chatroom.new
  end

  def new
    @chatroom = Chatroom.new
  end

  def show
    @chatroom = Chatroom.includes(:messages, :authors).find(params[:id])
    @message = Message.new
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)
    if @chatroom.save
      redirect_to chatrooms_path
    else
      render :new
    end
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:topic)
  end
end