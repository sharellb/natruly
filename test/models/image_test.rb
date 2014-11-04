require 'test_helper'

class ImageTest < ActiveSupport::TestCase
	test "should not save post without link" do
		image = Image.new
		assert_not image.save, "Saved the post without a link"
	end
end
