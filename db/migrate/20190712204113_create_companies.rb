class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :link
      t.text :summary
      t.boolean :iSponsor
      t.string :slug
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
