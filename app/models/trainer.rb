class Trainer < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  has_many :recordings_trainings
end
