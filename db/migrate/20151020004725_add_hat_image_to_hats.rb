class AddHatImageToHats < ActiveRecord::Migration
  def change
    add_column :hats, :hat_image, :string
  end
end
