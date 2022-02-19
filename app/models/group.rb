class Group < ApplicationRecord
  belongs_to :user
  has_many :entitygroups

  def total_transaction
    entitygroups.joins(:entity, :group).sum(:amount)
  end
end
