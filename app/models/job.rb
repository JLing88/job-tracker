class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :category
  belongs_to :company
  has_many   :comments

  def self.jobs_by_interest
    group(:level_of_interest).count
  end
end
