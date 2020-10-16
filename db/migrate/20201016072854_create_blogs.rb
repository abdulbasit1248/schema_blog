class CreateBlogs < ActiveRecord::Migration[6.0]
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :description
      t.timestamps
      t.references :user, foreign_key: {on_delete: :cascade}
    end
  end
end
