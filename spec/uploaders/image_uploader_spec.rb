require 'spec_helper'
require 'carrierwave/test/matchers'

describe ImageUploader do
  include CarrierWave::Test::Matchers

  before do
    ImageUploader.enable_processing = true
    @restaurant = Restaurant.create(name: "Sample", description: "sample sample", address: "sample address", phone_number: "sample number", image: "sample_image")
    @uploader = ImageUploader.new(@restaurant, :image)
    @uploader.store!(File.open("#{Rails.root}/tmp/images/Option 1.png"))
  end

  after do
    ImageUploader.enable_processing = false
    @uploader.remove!
  end

  context 'the thumbnail version' do
    it "should scale original picture to be 300 by 250 pixels" do
      @uploader.thumbnail.should have_dimensions(300, 250)
    end
  end

  context "the masthead version" do
    it "should scale original picture to be 600 by 500 pixels" do
      @uploader.masthead.should have_dimensions(600, 500)
    end
  end

end