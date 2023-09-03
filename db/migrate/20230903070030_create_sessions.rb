class CreateSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :sessions do |t|
      t.integer :sessid
      t.jsonb :questions

      t.timestamps
    end
  end
end
