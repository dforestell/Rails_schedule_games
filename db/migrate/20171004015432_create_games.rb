class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
    	t.string :time, null: false
  		t.string :date, null: false
  		t.string :field_address, null: false
  		t.integer :host_id, null: false
  		t.integer :traveler_id

  		t.timestamps
    end
  end
end
