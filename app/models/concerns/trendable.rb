class AddPopularAndTrendingToSongsAndOtherModels < ActiveRecord::Migration
  def change

    [:songs,:song_parts,:devotionals,:]

    add_column :songs, :trending_power, :integer, default: 1000
    add_index  :songs, :trending_power


  end
end