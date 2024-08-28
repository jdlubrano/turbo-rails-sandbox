class Message < ApplicationRecord
  belongs_to :inbox

  scope :ordered, -> { order(Arel.sql("read_at DESC NULLS FIRST, id ASC")) }
  scope :unread, -> { where(read_at: nil) }

  def read=(read)
    self.read_at = ActiveRecord::Type::Boolean.new.cast(read) ? Time.current : nil
  end
end
