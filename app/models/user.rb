# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  name                   :string
#  last_name              :string
#  age                    :integer
#  state                  :string
#  city                   :string
#  colony                 :string
#  street                 :string
#  uid                    :string
#  provider               :string
#  permission_level       :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  perfil                 :string
#
class User < ApplicationRecord
  include PermissionsConcern
  mount_uploader :perfil, PerfilUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :products
end
