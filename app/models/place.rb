class Place < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :shared_users, class_name: 'User', join_table: 'users_places'

  geocoded_by :address
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }
end
