class Message < ApplicationRecord
  validates :body, presence: true, length: {minimum: 2, maximum: 1000}
  belongs_to :user, :dependent => :destroy
  belongs_to :chat, :dependent => :destroy
  after_create_commit { MessageBroadcastJob.perform_later(self) }



  def timestamp
    created_at.strftime('%H:%M:%S %d %B %Y')
  end

end
