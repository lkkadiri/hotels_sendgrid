class User < ActiveRecord::Base
  attr_accessible :address, :city, :first_name, :last_name, :phone, :state
end
