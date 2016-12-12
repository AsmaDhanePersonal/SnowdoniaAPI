class PositionResource < JSONAPI::Resource
  attributes :longitude, :latitude, :timestampofrecord, :heading
  has_one :vehicle
  key_type :uuid
  #filter :vehicle
end
