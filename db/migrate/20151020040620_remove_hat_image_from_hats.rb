class RemoveHatImageFromHats < ActiveRecord::Migration
  def change
    remove_column :hats, :hat_image
  end
end
