class VehicleResource < JSONAPI::Resource
  attributes :vtype
  has_many :positions
  key_type :uuid

end
