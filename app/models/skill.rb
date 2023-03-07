class Skill < ActiveRecord::Base
  # our active record one to many association
  belongs_to :user

  # enum :status, [ :CREATED, :ONGOING, :COMPLETED, :CANCELLED ]
end
