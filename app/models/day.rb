class Day < ApplicationRecord
  belongs_to :user

  def self.create_for_user
    @user = User.first
    create(user_id: @user.id)
  end
end

#module DayCreator
  #def create_days
    #User.all.each do |u|
      # is the next day?
      # has already a day been created?
    #end
  #end
#end
