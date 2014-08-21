class Vote < ActiveRecord::Base;
  belongs_to :creator, foreign_key: "user_id", class_name: "User"
  belongs_to :voteable, polymorphic: true
  belongs_to :voteable, polymorphic: true

  #You can't use "validates_presence_of" with a boolean.  It won't evaluate false values properly.
  validates_inclusion_of :vote, in: [true, false]
  validates_presence_of :user_id,:voteable_type,:voteable_id
  
  #Validates a user can only vote on a post once.
  validates_uniqueness_of :user_id, scope: [:voteable_type, :voteable_id]


end