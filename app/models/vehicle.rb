class Vehicle < ActiveRecord::Base
	include ActiveUUID::UUID
	has_many :positions

	validates :vtype, inclusion: {in: %w(Bus Taxi Tram Train), message: "%{value} is not a valid vehicle type"}

end
