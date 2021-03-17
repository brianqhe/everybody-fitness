class Conversation < ActiveRecord::Base
    # Conversation table that has the foreign keys sender_id and receiver_id that are created when a message is created.
    belongs_to :sender, class_name: "User", foreign_key: "sender_id"
    belongs_to :receiver, class_name: "User", foreign_key: "receiver_id"
    # A conversation can have many messages and if a user is deleted then their messages should also be destroyed
    has_many :messages, dependent: :destroy
  
    # Validates whether the conversation between two users already exists before continuing
    validates_uniqueness_of :sender_id, scope: :receiver_id
  
    # Because a conversation where a recipient_id and sender_id is swapped still belongs to the same conversation, this method will make sure that a new conversation isnt made
    scope :between, -> (sender_id, receiver_id) do
      where("(conversations.sender_id = ? AND conversations.receiver_id = ?) OR (conversations.receiver_id = ? AND conversations.sender_id = ?)", sender_id, receiver_id, sender_id, receiver_id)
    end
  
    # Function to call the recipient as the current user that is accessing their inbox
    def recipient(current_user)
      self.sender_id == current_user.id ? self.receiver : self.sender
    end
   
    # Method to count the number of unread messages. It does this by counting the number of messages with the boolean "read" in the messages model that has false for the respective user
    def unread_message_count(current_user)
        self.messages.where("user_id != ? AND read = ?", current_user.id, false).count
    end

end