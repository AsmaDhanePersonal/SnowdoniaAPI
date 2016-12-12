class DistanceValidator < ActiveModel::Validator
def validate(record)

				Geokit::default_units = :kms
				Geokit::default_formula = :sphere


				berlin_lat = 52.524268
				berlin_lng = 13.406290

			    center_of_berlin = Geokit::LatLng.new(berlin_lat, berlin_lng)
			    car_position = Geokit::LatLng.new(record.latitude.to_f, record.longitude.to_f)
			    distance = center_of_berlin.distance_to(car_position)
			    puts distance

			    puts record.latitude.to_f
			    puts record.longitude.to_f






    	if distance > 50
			record.errors[:base] << "You're in the wrong neighbourhood"
		end
	end
end



class Position < ActiveRecord::Base



	belongs_to :vehicle

	acts_as_mappable 	:lat_column_name => :latitude,
	 					:lon_column_name => :longitude,
	 					:default_units => :kms,
	 					:default_formula => :sphere


	validates :latitude, presence: true
	validates :longitude, presence: true
	validates :heading, presence: true, :inclusion => { :in => 0..359, :message => "Your heading must be between 0 and 359"}
	validates :timestampofrecord, presence: true

	validates_with DistanceValidator


	








	#bounds=Bounds.new(sw_point, ne_point)
	#bounds.contains?(home)
end
