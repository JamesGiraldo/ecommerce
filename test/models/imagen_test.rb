# == Schema Information
#
# Table name: imagenes
#
#  id          :integer          not null, primary key
#  avatar      :string
#  description :text
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  product_id  :integer
#
# Indexes
#
#  index_imagenes_on_product_id  (product_id)
#
require 'test_helper'

class ImagenTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
