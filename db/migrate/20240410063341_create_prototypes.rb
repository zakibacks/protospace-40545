class CreatePrototypes < ActiveRecord::Migration[7.0]
  def change
    create_table :prototypes do |t|
      t.string :title
      t.text :catch_copy
      t.text :concept
      t.timestamps
    
      add_reference :prototypes, :user, foreign_key: true
    end
  end
end
