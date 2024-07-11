class CreateMovies < ActiveRecord::Migration[7.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :overview
      t.string :poster_url
      t.integer :rating
      t.string :backdrop_path
      t.string :release_date
      t.timestamps
    end
  end
end
