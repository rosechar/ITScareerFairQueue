class Company < ApplicationRecord
    belongs_to :event
    has_many :requests
    validates :slug, presence: true

    def to_param
        slug
    end
end
