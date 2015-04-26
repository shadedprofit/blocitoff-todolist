class Item < ActiveRecord::Base
  belongs_to :user

  validates :name, length: { minimum: 5 }, presence: true
  
  default_scope { order('updated_at DESC') }

  def days_left
    days_of_existence = (DateTime.now.to_date - created_at.to_date).to_i
    days_of_existence = 0 if days_of_existence <= -1
    return 7 - days_of_existence
  end
end
