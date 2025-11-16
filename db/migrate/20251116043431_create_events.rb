class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events, id: :uuid do |t|
      t.string :title
      t.datetime :date
      t.text :description

      t.timestamps
    end
  end
end
