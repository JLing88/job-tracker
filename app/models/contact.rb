class Contact < ApplicationRecord
  belongs_to :company
  validates_presence_of :name, :job, :email
end
