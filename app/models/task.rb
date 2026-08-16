class Task < ApplicationRecord
  attribute :status, :string, default: "pending"
end
