class CreateBugs < ActiveRecord::Migration[6.1]
  def change
    create_table :bugs do |t|
      t.string :hashid, null: false, index: :unique
      t.text :svg, null: false
      t.text :qrcode, null: false
      t.string :load_identifier, null: false
      t.string :term, null: false
      t.string :language, null: false
      t.string :translation, null: false
      t.text :color_scheme
      t.string :text_color, null: false, default: "#000000"
      t.integer :batch, null: false, index: true
      t.string :wikipedia, null: false, default: ""

      t.timestamps
    end
  end
end
