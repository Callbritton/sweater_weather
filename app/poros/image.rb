class Image
  attr_reader :image_url,
              :location,
              :description,
              :credit

  def initialize(data, location)
    @image_url = data[:results][0][:urls][:regular]
    @location = location
    @description = data[:results][0][:alt_description]
    @credit = {
      source: "Unsplash.com",
      author: data[:results][0][:user][:name]
    }
  end
end
