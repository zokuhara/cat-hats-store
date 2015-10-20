class AddHatImageIdToHats < ActiveRecord::Migration
  def change
    add_column :hats, :hat_image_id, :string
  end
end
