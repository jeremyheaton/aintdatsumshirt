class Charge < ActiveRecord::Base
  # Setup accessible (or protected) attributes for your model
  attr_accessible :customer_charge_id, :user_id

  belongs_to :user

  # attr_accessible :title, :body
end
