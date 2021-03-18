class MessagesController < ApplicationController
  # authenticate user before being able to access any routes for messages
  before_action :authenticate_user!

  # Setting an instance variable to find the relevant conversation for a user
  before_action do
    @conversation = Conversation.find(params[:conversation_id])
  end

  def index
    # Setting instance variable for messages for the current user that is logged in
    @messages = @conversation.messages

    @messages.where("user_id != ? AND read = ?", current_user.id, false).update_all(read: true)

    @message = @conversation.messages.new
  end

  def create
    # Creating a new message based on the conversation that has been set
    @message = @conversation.messages.new(message_params)
    # Allocating the foreign key required for the message model that links to the user model
    @message.user = current_user

    if @message.save
      redirect_to conversation_messages_path(@conversation)
    end
  end

  private
    def message_params
      params.require(:message).permit(:body, :user_id, :created_at)
    end
end
