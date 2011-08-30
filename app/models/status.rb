class Status < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :message, :user_id

  named_scope :recent, :order => 'created_at desc'

end
