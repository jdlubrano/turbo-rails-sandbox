class Message < ApplicationRecord
  belongs_to :inbox

  scope :ordered, -> { order(:id) }
  scope :read, -> { where.not(read_at: nil) }
  scope :unread, -> { where(read_at: nil) }

  def read=(read)
    self.read_at = ActiveRecord::Type::Boolean.new.cast(read) ? Time.current : nil
  end
end
