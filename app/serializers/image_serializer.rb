class ImageSerializer
  include FastJsonapi::ObjectSerializer
  set_id { nil }

  attributes :location, :image_url, :description, :credit
end
