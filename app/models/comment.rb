class Comment < ApplicationRecord
belongs_to :job
validates_presence_of :content, :created_at, :updated_at
end