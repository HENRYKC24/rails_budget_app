class Entitygroup < ApplicationRecord
  belongs_to :entity
  belongs_to :group
end
