class ChangeRatingFromIntegerToFloat < ActiveRecord::Migration[5.0]
  def change
    change_column :evaluations, :rating, :float
  end
end
