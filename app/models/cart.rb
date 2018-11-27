class Cart < ApplicationRecord
  has_and_belongs_to_many :items
  has_one :user
end
