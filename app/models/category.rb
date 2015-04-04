class Category < ActiveRecord::Base
  validates :name, presence: true
  validates :uri, presence: true, uniqueness: true
end
