class Message < ApplicationRecord
  # Message model that will reference the conversation and the user sending the message.
  belongs_to :conversation
  belongs_to :user

  # This makes sure that all the relevant params are present when sending a message
  validates_presence_of :body, :conversation_id, :user_id

  # Private method that will return the created_at time in the form of a string
  private
    def message_time
      created_at.strftime("%d/%m/%y at %l:%M %p")
    end
    
end
