class Category < ApplicationRecord
    mount_uploader :avatar, AvatarUploader
end
