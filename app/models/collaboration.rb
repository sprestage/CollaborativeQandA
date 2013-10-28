class Collaboration < ActiveRecord::Base
  attr_accessible :question, :answer

  has_and_belongs_to_many :users, :join_table => "users_collaborations", :class_name => "Users"
end
