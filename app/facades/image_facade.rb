class ImageFacade
  def self.get_image(location)
    image_data = ImageService.get_image_data(location)
    Image.new(image_data, location)
  end
end
