class CreateDomains < ActiveRecord::Migration[5.2]
  def change
    create_table :domains do |t|
      t.string :name
      t.text :description
      t.references :culture, foreign_key: true
      t.timestamps
    end
  end
end
