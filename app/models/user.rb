class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :places
  has_many :friendships
  has_many :friends, through: :friendships
  has_and_belongs_to_many :shared_places, class_name: 'Place', join_table: 'users_places'
end
