class CreateCarouselPictures < ActiveRecord::Migration[5.1]
  def change
    create_table :carousel_pictures do |t|
      t.string :title
      t.text :description
      t.string :picture

      t.timestamps
    end
  end
end
