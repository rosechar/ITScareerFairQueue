class Event < ApplicationRecord
  has_many :companies
  has_many :requests
  validates :name, presence: true
  validates :slug, presence: true

  def to_param
    slug
  end
end
