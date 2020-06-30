# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  age                    :integer
#  city                   :string
#  colony                 :string
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  last_name              :string
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string
#  name                   :string
#  perfil                 :string
#  permission_level       :integer          default(0)
#  provider               :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  state                  :string
#  street                 :string
#  uid                    :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
