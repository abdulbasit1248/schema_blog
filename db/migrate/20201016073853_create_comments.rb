class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|

      t.text :comment_body
      t.timestamps
      t.references :blog, foreign_key: {on_delete: :cascade}
    end
  end
end
