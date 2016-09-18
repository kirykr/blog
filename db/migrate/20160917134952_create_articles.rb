class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
    	t.string :title
      t.text :description, limit: 300

      t.timestamps
    end
  end
end
