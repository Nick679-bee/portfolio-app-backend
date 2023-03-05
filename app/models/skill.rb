class Skill < ActiveRecord::Base
    # our active record one to many association
    belongs_to :user
  end
  