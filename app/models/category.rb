class Category < ActiveRecord::Base
  validates_presence_of :name, :uri
end
