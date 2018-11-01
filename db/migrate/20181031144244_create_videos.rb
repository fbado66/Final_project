class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.references :user
      t.string :video_url
      t.integer :video_id
      t.timestamps
    end
  end
end
