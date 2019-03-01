class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @message.user = current_user
    if @message.save
      redirect_to trip_path(@message.trip)
    else
      flash[:alert] = "Error saving your message! #{@message.errors.full_messages.first}"
      redirect_to trip_path(@message.trip)
    end
  end

  def message_params
    params.require(:message).permit(:trip_id, :message)
  end
end
