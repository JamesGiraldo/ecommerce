# == Schema Information
#
# Table name: categories
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  avatar      :string
#
class Category < ApplicationRecord
    mount_uploader :avatar, AvatarUploader
    has_many :has_categories, :dependent => :destroy
    has_many :products, through: :has_categories, :dependent => :destroy
    validates :name, presence: true, length: {minimum: 6, too_short: "Minimo Son %{count} Caracteres"}
    validates :description, presence: true, length: {minimum: 10, too_short: "Minimo Son %{count} Caracteres"}
    validates :avatar, presence: true
end
