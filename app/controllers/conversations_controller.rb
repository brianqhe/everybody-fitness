class ConversationsController < ApplicationController
before_action :authenticate_user!


  def index
    # Set instance variable for all consversation where the current user is either a sender or recipient
    @conversations = Conversation.where("sender_id = ? OR receiver_id = ?", current_user.id, current_user.id)
    # Set instance variable where the list of all users available for the current user to message don't include themselves
    @users = User.where.not(id: current_user.id)
  end

  def create
    # Function to create a new conversation if it doesn't already exist, otherwise if it does exist then set the conversation instance variable to the existing conversation
    if Conversation.between(params[:sender_id], params[:receiver_id]).present?
      @conversation = Conversation.between(params[:sender_id], params[:receiver_id]).first
    else
      @conversation = Conversation.create!(conversation_params)
    end

    redirect_to conversation_messages_path(@conversation)
  end

  private
  # set permitted params for the conversation controller
    def conversation_params
      params.permit(:sender_id, :receiver_id)
    end

end
