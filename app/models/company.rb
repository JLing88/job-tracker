class Company < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :jobs, dependent: :destroy
  has_many :contacts

  def self.top_companies_by_interest
    select("companies.*, AVG(level_of_interest) AS interest_avg").joins(:jobs).group(:company_id, :id).order("interest_avg DESC").limit(3)
  end
end
