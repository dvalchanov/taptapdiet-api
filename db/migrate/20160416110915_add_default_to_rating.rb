class AddDefaultToRating < ActiveRecord::Migration[5.0]
    def up
    change_column :evaluations, :rating, :integer, :default => 0
  end

  def down
    change_column :evaluations, :rating, :integer, :default => nil
  end
end
