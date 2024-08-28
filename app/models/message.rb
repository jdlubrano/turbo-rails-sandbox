class Message < ApplicationRecord
  belongs_to :inbox

  scope :unread, -> { where(read_at: nil) }
end
