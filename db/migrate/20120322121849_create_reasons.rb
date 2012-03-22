class CreateReasons < ActiveRecord::Migration
  def change
    create_table :reasons do |t|
      t.string :reason

      t.timestamps
    end
  end
end
