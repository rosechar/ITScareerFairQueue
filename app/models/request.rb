class Request < ApplicationRecord
  belongs_to :user
  belongs_to :company
  belongs_to :event
end
