class Bug < ActiveRecord::Base
  belongs_to :user
  validates :ticket_number, presence: true, uniqueness: true
  before_save :calculate_score

  def calculate_score
    self.score = (priority.to_i + bug_type.to_i + likelyhood.to_i) *
                 100 / max_score
  end
end
