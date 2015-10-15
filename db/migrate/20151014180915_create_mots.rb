class CreateMots < ActiveRecord::Migration
  def change
    create_table :mots do |t|
      t.string :abreviation
      t.string :signification

      t.timestamps null: false
    end
  end
end
