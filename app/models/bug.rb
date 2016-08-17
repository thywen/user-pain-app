class Bug < ActiveRecord::Base
  belongs_to :user
  validates :ticket_number, presence: true, uniqueness: true
end
